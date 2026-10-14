# ¿Bastan los roles de sistema para el día a día?

2026-10-13 · investigación · sin cambios de código

## 1. Pregunta y método

La pregunta: ¿cubren los seis tiers lo que un equipo hace en una semana normal sin recurrir a `admin`, a `cluster-admin` o a un rol personalizado? Y, donde no, ¿qué respuesta conviene: un módulo nuevo, un cambio de tier, el rol personalizado tal como existe o nada? Importa por la edición: en Free solo hay tiers (los roles personalizados son Pro), así que todo hueco cuya respuesta sea «rol personalizado» es, en Free, «`admin`» o la etiqueta de agregación en el cluster.

Método: una lista de operaciones por persona, sacada de la referencia de `kubectl`, de las tablas de roles `view`, `edit` y `admin` y de la página de `kubectl debug` de la documentación de Kubernetes, más las herramientas MCP del servidor. Cada operación se cruza con `TierRules` y `AggregationSelectors` (`rules.go`: `viewer` y `developer` agregan el `view` de Kubernetes), con `Modules` (`modules.go`) y con las matrices de `SubjectAccessReview` del e2e (`sarMatrix`, `customRoleMatrix`); los filtros de auditoría (verbo, recurso, herramienta MCP, resultado `denied` o `write`) dicen qué ve kubelatch de cada una. «De la semana» es criterio, no medida: no hay datos de uso y no se dan frecuencias. Lo marcado «(view)» llega por la agregación de `view` y no está en `TierRules`.

## 2. Operaciones de la semana

| Operación | Tier más bajo | Módulo | Notas |
| --- | --- | --- | --- |
| **Developer en su namespace** | | | |
| `get`/`describe pods`, `logs -f`, `logs --previous`; MCP `describe`, `get_logs` | `viewer` | `workloads.read`, `pods.logs` | |
| `top pod`; MCP `top_pods` | `viewer` | `workloads.read` | Desde el 2026-10-13; requiere metrics-server |
| `apply -f`, `set image`, `rollout restart`; MCP `apply`, `rollout_restart` | `developer` | `workloads.deploy` | PSA |
| `rollout status`, `rollout history`, `wait`; MCP `rollout_status` | `viewer` | `workloads.read` | El historial de StatefulSet y DaemonSet lee `controllerrevisions` (view): el módulo no lo tiene |
| `rollout undo deployment` | `developer` | `workloads.deploy` | Lee ReplicaSets y parchea el Deployment |
| `scale`; MCP `scale` | `developer` | `workloads.scale` | |
| `delete pod` | `developer` | `pods.delete` | |
| `create job --from=cronjob/x` | `developer` | `workloads.deploy` | |
| `edit configmap` | `developer` | `config.write` | |
| `create secret`, `apply` de un Secret | `admin` | `secrets.write` (+ `secrets.read` para `apply`) | Hueco |
| `exec`, `cp`, `attach` | `debugger` | `pods.exec` | Add-on, PSA |
| `port-forward` | `debugger` | `pods.portforward` | `svc/x` lee además el Service: con `viewer` |
| `debug` con contenedor efímero | `debugger` | `pods.ephemeral` | El perfil por defecto, `general`, añade `SYS_PTRACE`, que PSA `baseline` rechaza: `--profile=baseline` |
| `patch pvc` para ampliarlo | `developer` | `storage.write` | Si la StorageClass lo permite |
| Ingress, HPA | `developer` | `network.write`, `autoscaling.write` | |
| `describe quota`, `get limitrange` | `viewer` (view) | ninguno | |
| `auth can-i`; MCP `whoami` | cualquiera | ninguno | `system:basic-user`; el apiserver añade `system:authenticated` al usuario suplantado. El e2e no lo prueba por el proxy |
| **Operador de guardia** | | | |
| `get events -A`; MCP `get_events` | `viewer` en `*` | `events.read` en un rol de ámbito cluster | `viewer` en `*` también lee los logs de todo el cluster |
| `get pods -A`, `top node`, `describe node`; MCP `top_nodes` | `viewer` en `*` | `workloads.read`, `nodes.read` | |
| `get secret`; MCP `read_secret` | `secrets-reader` | `secrets.read` | |
| `cordon`, `uncordon`, `drain` | `cluster-admin` | ninguno | Hueco |
| **SRE de todo el cluster** | | | |
| `get pv,sc,crd`, `api-resources`; MCP `list_api_resources` | `viewer` en `*` | `volumes.read`, `crds.read` | |
| `get rolebindings` en un namespace | `admin` | regla avanzada | |
| `get` de webhooks, ClusterRoles, IngressClasses, PriorityClasses, APIServices | `cluster-admin` | regla avanzada de lectura | Hueco |
| `taint`, `label node` | `cluster-admin` | ninguno | Hueco |
| `debug node/x` | `cluster-admin` | ninguno | Pod privilegiado: PSA lo impide en los namespaces concedibles |
| `certificate approve`, crear namespaces | `cluster-admin` | prohibido | |
| **Bot de CI** | | | |
| `apply -f`, `rollout status`, `wait` | `developer` | `workloads.deploy`, `workloads.read` | Si los manifiestos no traen Secrets, ServiceAccounts, RBAC, PDB ni NetworkPolicies |
| `helm upgrade --install` | `admin` | ninguno | Hueco: Helm guarda sus releases en Secrets por defecto |
| `apply` de un `Certificate` (cert-manager), `ScaledObject` (KEDA) | ninguno | regla avanzada | `viewer` los lee si el chart del CRD etiqueta para `view` |

## 3. Huecos

| Hueco | Respuesta | Coste | Coste de seguridad |
| --- | --- | --- | --- |
| Escribir Secrets (developer, CI) | Rol personalizado: `developer` duplicado más `secrets.write` y, para `apply`, `secrets.read` | Ninguno; una receta en el manual, pequeño | Bajo: quien despliega pods ya alcanza los Secrets del namespace. Nuevo: sobrescribir el Secret que lee otro pod |
| Helm con su almacén por defecto | `admin` para el bot en su namespace; rol personalizado si el chart no trae RBAC (la escritura en RBAC está siempre prohibida). `HELM_DRIVER=configmap` cabe en `developer`, pero deja a cualquier `viewer` el manifiesto renderizado, Secrets del chart incluidos | Ninguno | `admin` crea RoleBindings dentro del namespace |
| ServiceAccounts, PodDisruptionBudgets y NetworkPolicies, objetos habituales de un chart | Módulos nuevos `policy.write` (PDB) y `networkpolicies.write`; las ServiceAccounts, como regla avanzada, que ya marca el rol sensible | Pequeño | NetworkPolicy abre o cierra el tráfico del namespace; un PDB puede bloquear un `drain` |
| `cordon`, `drain`, `taint`, `label node` | Nada: `cluster-admin` de 8 h | Un tier de nodos sería medio o grande: la primera escritura de ámbito `*` fuera de `cluster-admin`, y RBAC no limita el `patch` a `spec.unschedulable` (haría falta una `ValidatingAdmissionPolicy`) | Alto: evicciones en `kube-system`, y taints y etiquetas que deciden dónde corre todo |
| Lectura de objetos de cluster (webhooks, ClusterRoles, IngressClasses, PriorityClasses, APIServices, CSR) | Hoy, rol personalizado de ámbito cluster con reglas de lectura; mejor, un módulo `cluster.inspect` | Pequeño | Bajo o medio: dice quién tiene qué permiso |
| Metadatos de Secrets sin valores | Nada: RBAC no separa metadatos de valores (`PartialObjectMetadata` también pide `list secrets`); solo podría hacerlo el proxy con una identidad propia | Grande | Rompe el modelo: el proxy solo suplanta y el apiserver decide |
| Crear namespaces | Nada en kubelatch: escribir `namespaces` está prohibido siempre; es un flujo de plataforma (GitOps, un admin) | Grande si kubelatch lo ofreciera con la etiqueta PSA puesta | Medio |
| CRDs de terceros en escritura (cert-manager, KEDA, Argo Rollouts) | Como hoy: un ClusterRole con `kubelatch.io/aggregate-to-developer` (vale en Free) o una regla avanzada | Ninguno; receta pequeña | Depende del CRD: un `Workflow` de Argo ejecuta código |

**Huecos del catálogo, no de los tiers.** `viewer` recibe de `view` `controllerrevisions`, `resourcequotas`, `limitranges`, `poddisruptionbudgets`, `serviceaccounts` y `replicationcontrollers`, que ningún módulo nombra. Un duplicado de `viewer` pierde así `rollout history` de StatefulSets y DaemonSets y `describe quota`. Añadirlos a `workloads.read` o a un módulo `namespace.read` es pequeño y de coste de seguridad bajo.

**Candidatos que no son huecos.** `rollout undo` y `history` de Deployments, ampliar un PVC, `create job --from`, editar un HPA, Ingress (`developer`); `top` (`viewer`, desde hoy); eventos de todos los namespaces (`viewer` en `*`, o un rol de ámbito cluster solo con `events.read` si no se quieren dar los logs); `auth can-i` (todos); leer cuotas (`viewer`); ConfigMaps (`viewer` lee incluso los valores); `exec` y `port-forward` para developers (`debugger`: la separación es deliberada, no un hueco). `kubectl debug` funciona con `debugger` si se pide un perfil que PSA admita.

## 4. Recomendación

- Mantener los seis tiers sin cambios: cubren el trabajo diario de developer, guardia y CI salvo Secrets, Helm y los nodos, y ninguno de esos huecos se cierra bien cambiando un tier.
- Ampliar el catálogo de módulos con lo que `viewer` obtiene de `view` y con `policy.write`, `networkpolicies.write` y `cluster.inspect`, un cambio pequeño (estimación) que hace fieles los duplicados de `viewer` y `developer`.
- Documentar en el manual cuatro recetas: developer con Secrets, bot de Helm (`admin` en su namespace o rol personalizado), CRDs con la etiqueta `aggregate-to-developer`, y `kubectl debug --profile=baseline` en namespaces con PSA.
- Dejar `cordon`, `drain` y `taint` en `cluster-admin` y, antes de diseñar un tier de nodos, contar en la auditoría de una instalación real (resultado `denied`, por verbo y recurso) qué 403 aparecen de verdad.
- No ofrecer metadatos de Secrets ni creación de namespaces desde kubelatch.
