#!/bin/sh
# kubelatch plugin for Claude Code: the PreToolUse hook on Bash.
#
# Claude Code sends the hook's JSON on stdin. This refuses a command that
# runs kubectl or helm against a cluster, or k9s: exit 2, and the reason on
# stderr goes back to Claude, naming the kubelatch MCP tool to use instead.
# Offline subcommands pass (kubectl kustomize, completion, version --client;
# helm template, lint, package, repo, show...). It is a guardrail for an
# agent that means well, not a boundary: what bounds an agent is the
# permissions kubelatch gives it.
#
# POSIX sh and awk only, so it runs wherever Claude Code does.
# KUBELATCH_HOOK_AWK names the awk to run (the plugin's tests try each one).
exec "${KUBELATCH_HOOK_AWK:-awk}" '
BEGIN {
  # Global flags that take a separate value, so the subcommand is found.
  KV = "^(-n|--namespace|--context|--kubeconfig|--cluster|--user|-s|--server|--token|--as|--as-group|--as-uid|--request-timeout|--cache-dir|--certificate-authority|--client-certificate|--client-key|--tls-server-name|-v|--v)$"
  HV = "^(-n|--namespace|--kube-context|--kubeconfig|--kube-apiserver|--kube-token|--kube-as-user|--kube-as-group|--kube-ca-file|--registry-config|--repository-cache|--repository-config)$"
}
{ input = input $0 "\n" }
END {
  check(command_of(input))
  exit 0
}

function hexval(h,    k, v) {
  v = 0
  h = tolower(h)
  for (k = 1; k <= length(h); k++) v = v * 16 + index("0123456789abcdef", substr(h, k, 1)) - 1
  return v
}

# The value of the first "command" key of the input, with its escapes decoded.
function command_of(s,    n, i, j, c, v, str, want) {
  n = length(s)
  want = 0
  for (i = 1; i <= n; i++) {
    if (substr(s, i, 1) != "\"") continue
    str = ""
    for (i++; i <= n; i++) {
      c = substr(s, i, 1)
      if (c == "\"") break
      if (c != "\\") { str = str c; continue }
      i++
      c = substr(s, i, 1)
      if (c == "n" || c == "r") str = str "\n"
      else if (c == "t" || c == "b" || c == "f") str = str " "
      else if (c == "u") {
        v = hexval(substr(s, i + 1, 4))
        i += 4
        str = str ((v >= 32 && v < 127) ? sprintf("%c", v) : " ")
      } else str = str c
    }
    if (want) return str
    j = i + 1
    while (j <= n && substr(s, j, 1) ~ /[ \t\r\n]/) j++
    if (str == "command" && substr(s, j, 1) == ":") want = 1
  }
  return ""
}

# Splits the command at shell separators and checks each simple command.
# A backslash-newline continues the line, so it is joined first.
function check(cmd,    segs, n, k) {
  gsub(/\\\n/, " ", cmd)
  gsub(/\$\(|&&|\|\||[;&|(){}`\n]/, "\n", cmd)
  n = split(cmd, segs, "\n")
  for (k = 1; k <= n; k++) segment(segs[k])
}

function segment(s,    w, n, i, word) {
  gsub(/["\047\\]/, "", s)
  n = split(s, w, " ")
  i = 1
  while (i <= n) {
    word = w[i]
    if (word ~ /^[A-Za-z_][A-Za-z_0-9]*=/) { i++; continue }
    if (word ~ /(^|\/)(sudo|doas|env|command|builtin|exec|nohup|time|nice|ionice|timeout|watch|xargs|then|do|else|elif|if|while|until|!)$/) {
      i++
      while (i <= n && (w[i] ~ /^-/ || w[i] ~ /^[0-9][0-9.]*[smhd]?$/)) i++
      continue
    }
    if (word ~ /(^|\/)(ba|z|da|k|c|tc)?sh$/) {
      i++
      while (i <= n && w[i] ~ /^-/ && w[i] !~ /^-[A-Za-z]*c[A-Za-z]*$/) i++
      if (i <= n && w[i] ~ /^-[A-Za-z]*c[A-Za-z]*$/) { i++; continue }
      return
    }
    if (word ~ /(^|\/)ssh$/) {
      for (i++; i <= n; i++) {
        word = w[i]
        sub(/.*\//, "", word)
        if (word ~ /^(kubectl|helm|k9s)(\.exe)?$/) break
      }
      if (i > n) return
    }
    break
  }
  if (i > n) return
  word = w[i]
  sub(/.*\//, "", word)
  sub(/\.exe$/, "", word)
  if (word == "kubectl") kubectl(w, n, i)
  else if (word == "helm") helm(w, n, i)
  else if (word == "k9s") refuse("k9s", "list_resources, get_resource and get_logs")
}

# The words from w[i] on, space-separated, up to the first "--": what
# follows it (a container command, an argument) is no flag of kubectl.
function joined(w, n, i,    s, j) {
  s = " "
  for (j = i; j <= n; j++) {
    if (w[j] == "--") break
    s = s w[j] " "
  }
  return s
}

# The index of the first word after w[i] that is not a flag or its value.
function subcommand(w, n, i, valued,    j) {
  for (j = i + 1; j <= n; j++) {
    if (w[j] ~ /^-/) {
      if (w[j] !~ /=/ && w[j] ~ valued) j++
      continue
    }
    return j
  }
  return 0
}

function kubectl(w, n, i,    all, j, sc, use) {
  all = joined(w, n, i)
  if (all ~ / (--help|-h) /) return
  j = subcommand(w, n, i, KV)
  if (j == 0) return
  sc = w[j]
  if (sc ~ /^(kustomize|completion|help|plugin)$/) return
  if (sc == "version" && all ~ / --client(=true)? /) return
  if (sc == "create" && all ~ / --dry-run=client /) return
  if (sc == "get") use = "list_resources, or get_resource for one object (the values of a Secret: read_secret)"
  else if (sc == "describe") use = "get_resource and get_events"
  else if (sc == "logs") use = "get_logs"
  else if (sc == "events") use = "get_events"
  else if (sc ~ /^(api-resources|api-versions|explain)$/) use = "list_api_resources"
  else if (sc ~ /^(apply|create|replace|patch|edit|label|annotate|set)$/) use = "apply, with the whole object"
  else if (sc == "delete") use = "delete_resource, one object at a time"
  else if (sc == "scale") use = "scale"
  else if (sc == "rollout") use = (w[j + 1] == "restart") ? "rollout_restart" : "get_resource"
  else if (sc ~ /^(auth|config|cluster-info|whoami)$/) use = "whoami and list_clusters"
  else use = ""
  refuse("kubectl " sc, use)
}

function helm(w, n, i,    all, j, sc, use) {
  all = joined(w, n, i)
  if (all ~ / (--help|-h) /) return
  j = subcommand(w, n, i, HV)
  if (j == 0) return
  sc = w[j]
  if (sc ~ /^(template|lint|package|repo|search|show|inspect|pull|fetch|create|dependency|dep|version|env|plugin|verify|registry|push|completion|help)$/) return
  if (sc ~ /^(install|upgrade)$/) use = "helm template here, then apply for each object it renders"
  else if (sc ~ /^(uninstall|delete|del|un)$/) use = "delete_resource for each object of the release"
  else if (sc ~ /^(list|ls|status|get|history|hist)$/) use = "list_resources and get_resource"
  else use = ""
  refuse("helm " sc, use)
}

function refuse(what, use) {
  if (use == "")
    printf "kubelatch: no kubelatch tool does \"%s\" (exec, port-forward, copy, rollback and watch do not go through kubelatch). Ask the person to do it.\n", what > "/dev/stderr"
  else
    printf "kubelatch: Kubernetes goes through the kubelatch MCP tools here, not \"%s\". Use %s instead.\n", what, use > "/dev/stderr"
  printf "The tools act with the permissions kubelatch gives you and record every call. Start with whoami.\n" > "/dev/stderr"
  exit 2
}
'
