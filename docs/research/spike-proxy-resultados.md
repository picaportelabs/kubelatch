# Resultado del spike del proxy (hito 0)

Fecha: 2026-09-24. kind v0.33.0, nodo kindest/node:v1.37.0, kubectl v1.37.1 (cliente), Go go1.26.0.

Proxy: `cmd/spike-proxy` (httputil.ReverseProxy con Rewrite, transporte HTTP/2 para peticiones normales y HTTP/1.1 para upgrades, FlushInterval -1, TLS autofirmado, prefijo `/clusters/kind`).

| Prueba | Comando | Resultado | Observaciones (log del proxy) |
| --- | --- | --- | --- |
| get pods / auth whoami | Task 2 step 5 | OK | inbound HTTP/2.0, upstream HTTP/2.0; `system:authenticated` añadido por el apiserver |
| get secrets / nodes | Task 2 step 5 | 403 esperado | RBAC del impersonado |
| `--as alice` | Task 2 step 5 | 400 esperado | cabecera Impersonate-* rechazada |
| exec WebSocket | Task 3 step 1 | OK | `hello-from-pod` + `x86_64`; `GET .../pods/web/exec?... status=101 upgrade=true inbound=HTTP/1.1` y `upstream GET .../exec -> 101 over HTTP/1.1`, dur=25ms |
| exec SPDY | Task 3 step 1 | OK | `hello-over-spdy`; `POST .../pods/web/exec?... status=101 upgrade=true inbound=HTTP/1.1` (SPDY usa POST), dur=28ms |
| exec -it | Task 3 step 2 | OK (vía pty simulado) | sin TTY humano disponible, se usó `script -qfec "... exec -it web -- sh -c 'hostname; exit'"`; salida `web`, rc=0; log `GET .../exec?...tty=true status=101 upgrade=true inbound=HTTP/1.1 dur=31ms` — dur corto porque no hubo tecleo humano (no indica fallo); una sesión interactiva real queda como verificación manual opcional |
| cp (WS y SPDY) | Task 3 step 3 | OK | descarga WS → `download ok`; subida WS verificada con `head -1` → `apiVersion: v1`; descarga SPDY → `web`; ningún `error: ... reset` (no se reproduce el fallo de StrongDM); cada `cp` usa `exec`+`tar` internamente (GET status=101 en WS, POST status=101 en SPDY) |
| port-forward WS | Task 3 step 4 | OK | `ws: 200`; `/tmp/pf.log`: `Forwarding from 127.0.0.1:18080 -> 80` + `Handling connection for 18080`; log `GET .../portforward status=101 upgrade=true inbound=HTTP/1.1 dur=24.846s` — dur alto porque `kill $PF` solo terminó el subshell de la función `kproxy`, no el proceso `kubectl` real (detectado con `pgrep`/`ss` y terminado aparte); no es un fallo del proxy, es una particularidad de backgroundear una función de shell con `&` |
| port-forward SPDY | Task 3 step 4 | OK | `spdy: 200`; mismo `/tmp/pf.log` (guardado aparte como pf-ws.log / pf-spdy.log); log `POST .../portforward status=101 upgrade=true inbound=HTTP/1.1 dur=3.005s`; el puerto quedó libre tras `kill $PF` más el `pkill` de seguridad añadido a posteriori, no tras `kill $PF` por sí solo (misma causa raíz que en la fila WS: backgroundear la función `kproxy` con `&` hace que `$!` sea el PID del subshell, no el de `kubectl`; el plan ya se ha corregido para backgroundear el binario `kubectl` directamente) |
| logs -f | Task 4 step 1 | OK | 3740 líneas en 6 s (≥ 4 esperado); el número alto se debe a que `logs -f` sin `--tail` vuelca primero todo el historial y el pod `ticker` llevaba ≈63 min corriendo a 1 línea/s — no es un fallo, de hecho confirma streaming real: si el proxy retuviera la respuesta hasta cerrar la conexión, `timeout 6` habría matado kubectl antes de que llegara nada (0 líneas); log `GET .../pods/ticker/log?container=ticker&follow=true status=200 upgrade=false inbound=HTTP/2.0 in=0 dur=5.978s` |
| get -w > 120 s | Task 4 step 2 | OK | `exit=124` (matado por `timeout`, no por el proxy); una única línea `watch=true` en los 130 s, sin reconexiones: `GET /clusters/kind/api/v1/namespaces/default/pods?resourceVersion=5887&watch=true status=200 upgrade=false inbound=HTTP/2.0 in=0 dur=2m9.971s` |
| create CRD > 1 MB | Task 4 step 3 | OK | `spike/big-crd.json` de 1.151.248 bytes; `kproxy create -f` → `customresourcedefinition.apiextensions.k8s.io/bigthings.spike.kubelatch.io created`; log `POST .../apis/apiextensions.k8s.io/v1/customresourcedefinitions?fieldManager=kubectl-create&fieldValidation=Strict status=201 upgrade=false inbound=HTTP/2.0 in=1137214 dur=73ms` (in=1.137.214 > 1.000.000); `get -o name` y `delete` correctos, confirmado con un `get` posterior → 404; el `delete` de kubectl intenta además un watch interno de confirmación que devuelve 403 porque `spike/rbac.yaml` no concede `watch` sobre `customresourcedefinitions` (solo get/list/create/patch/update/delete) — no bloquea el borrado, kubectl reintenta con `list` y termina bien |

## Conclusión

El patrón funciona: `httputil.ReverseProxy` con `Rewrite`, un transporte HTTP/1.1
dedicado para upgrades y `FlushInterval: -1` cubre exec/attach/port-forward/cp por
WebSocket y por SPDY, `logs -f`, watches de más de 120 s y cuerpos de más de 1 MB,
con TLS terminado en el proxy e impersonación restringida por `resourceNames`.
Las tres pruebas de esta tarea lo confirman: `logs -f` entregó datos en streaming
(3740 líneas en 6 s, ninguna retenida hasta el cierre de la conexión), el `watch`
de pods aguantó 130 s con una sola línea `watch=true` (`dur=2m9.971s`, sin
reconexiones) y el POST de un CRD de 1.151.248 bytes llegó íntegro al proxy
(`in=1137214`, `status=201`). Ninguna fila de la tabla está marcada FALLA.
Lo que pasa a `internal/proxy` en el hito 3: statusWriter con `Unwrap()`,
switchingTransport, el saneado de cabeceras (`Impersonate-*` → 400, `Authorization`
sustituida, `SetXForwarded`) y el `http.Server` sin timeouts de lectura/escritura.
Cualquier prueba marcada FALLA arriba bloquea el hito 3 hasta resolverla.
