#!/bin/sh
# kubelatch plugin for Claude Code: the PostToolUse hook on the kubelatch tools
# that can wait for a person (apply, delete_resource, scale, rollout_restart
# and request_access).
#
# When the first text block of the tool's answer starts with
# agent.approval_pending, agent.access_pending or agent.access_needs_person,
# it opens the link of that answer in the browser, so the person who has to
# decide lands on the page without a copy and paste. It starts the opener in
# the background and does not wait for it, so it prints a systemMessage saying
# it is opening the link, not that it opened it, and always exits 0: it never
# blocks a tool.
#
# Usage: open-approval.sh <kubelatch_url> [<open_approvals>]
# Both come from the plugin's userConfig; an empty value, or one Claude Code
# did not substitute, falls back to CLAUDE_PLUGIN_OPTION_KUBELATCH_URL and
# CLAUDE_PLUGIN_OPTION_OPEN_APPROVALS.
#
# What it is not: a boundary. It is a convenience. It runs a program with a
# string that came from a server answer, so the link is opened only when it
# starts with the plugin's kubelatch URL followed by /agents/requests/ or
# /request?, holds nothing but URL characters and is at most 2048 characters
# long, and it is passed as the opener's one argument: never through eval,
# never inside a string a shell parses again. Text from a cluster cannot
# imitate the line (the tools that read clusters start their answer with
# server text), and a link that did pass would still be a page of kubelatch,
# which asks for a session and a click.
#
# It does not open in the terminal client (CLAUDE_CODE_ENTRYPOINT empty or
# cli: the client's own dialog already asked, and a "no" stands), over SSH, on
# Linux without a display, or when open_approvals is turned off.
#
# POSIX sh and awk only, so it runs wherever Claude Code does.
# KUBELATCH_HOOK_AWK names the awk to run and KUBELATCH_HOOK_OPEN the opener
# (the plugin's tests set both).

base=$1
case $base in '' | *'${'*) base=${CLAUDE_PLUGIN_OPTION_KUBELATCH_URL:-} ;; esac
enabled=$2
case $enabled in *'${'*) enabled=${CLAUDE_PLUGIN_OPTION_OPEN_APPROVALS:-} ;; esac
[ -n "$base" ] || exit 0
case $enabled in false | False | FALSE | 0 | no | No | NO | off | Off | OFF) exit 0 ;; esac

case ${CLAUDE_CODE_ENTRYPOINT:-} in '' | cli) exit 0 ;; esac
[ -z "${SSH_CONNECTION:-}" ] || exit 0

system=$(uname -s 2>/dev/null)
if [ "$system" = Linux ] && [ -z "${DISPLAY:-}" ] && [ -z "${WAYLAND_DISPLAY:-}" ]; then
  exit 0
fi

opener=${KUBELATCH_HOOK_OPEN:-}
if [ -z "$opener" ]; then
  case $system in
    Linux) command -v xdg-open >/dev/null 2>&1 && opener=xdg-open ;;
    Darwin) command -v open >/dev/null 2>&1 && opener=open ;;
  esac
fi
[ -n "$opener" ] || exit 0

link=$(KUBELATCH_BASE=$base "${KUBELATCH_HOOK_AWK:-awk}" '
BEGIN {
  codes[1] = "agent.approval_pending"
  codes[2] = "agent.access_pending"
  codes[3] = "agent.access_needs_person"
}
{ input = input $0 "\n" }
END { print link_of(input) }

function hexval(h,    k, v) {
  v = 0
  h = tolower(h)
  for (k = 1; k <= length(h); k++) v = v * 16 + index("0123456789abcdef", substr(h, k, 1)) - 1
  return v
}

# Reads the JSON in s: the tool name (a key of the top object) and the first
# text value after "tool_response". Escapes are decoded; a character outside
# printable ASCII becomes \001, which no link may hold.
function link_of(s,    n, i, c, v, str, j, pend, depth, tool, text, inresp, got, iskey) {
  n = length(s)
  depth = 0
  for (i = 1; i <= n; i++) {
    c = substr(s, i, 1)
    if (c ~ /[ \t\r\n:]/) continue
    if (c != "\"") {
      if (c == "{" || c == "[") depth++
      else if (c == "}" || c == "]") depth--
      pend = ""
      continue
    }
    str = ""
    for (i++; i <= n; i++) {
      c = substr(s, i, 1)
      if (c == "\"") break
      if (c != "\\") { str = str c; continue }
      i++
      c = substr(s, i, 1)
      if (c == "n") str = str "\n"
      else if (c == "r" || c == "t" || c == "b" || c == "f") str = str " "
      else if (c == "u") {
        v = hexval(substr(s, i + 1, 4))
        i += 4
        if (v == 10) str = str "\n"
        else if (v == 9 || v == 13) str = str " "
        else str = str ((v >= 32 && v < 127) ? sprintf("%c", v) : "\001")
      } else str = str c
    }
    j = i + 1
    while (j <= n && substr(s, j, 1) ~ /[ \t\r\n]/) j++
    iskey = (substr(s, j, 1) == ":")
    if (iskey) {
      pend = str
      if (str == "tool_response") inresp = 1
      continue
    }
    if (pend == "tool_name" && depth == 1 && tool == "") tool = str
    else if (inresp && !got && (pend == "text" || pend == "tool_response")) { text = str; got = 1 }
    pend = ""
  }
  if (tool !~ /^mcp__plugin_kubelatch_kubelatch__(apply|delete_resource|scale|rollout_restart|request_access)$/) return ""
  return checked(text)
}

# The link of the text when it passes every check, else "".
function checked(text,    k, ok, link, base, rest, p) {
  ok = 0
  for (k = 1; k <= 3; k++) if (index(text, codes[k] ": ") == 1) ok = 1
  if (!ok) return ""
  p = match(text, /https?:\/\//)
  if (p == 0) return ""
  link = ""
  for (k = RSTART; k <= length(text); k++) {
    if (substr(text, k, 1) ~ /[ \t\r\n]/) break
    link = link substr(text, k, 1)
  }
  base = ENVIRON["KUBELATCH_BASE"]
  while (substr(base, length(base), 1) == "/") base = substr(base, 1, length(base) - 1)
  if (base !~ "^https?://[A-Za-z0-9._~%+&=?/:-]+$") return ""
  if (length(link) > 2048) return ""
  if (link !~ "^[A-Za-z0-9._~%+&=?/:-]+$") return ""
  if (index(link, base) != 1) return ""
  rest = substr(link, length(base) + 1)
  if (index(rest, "/agents/requests/") != 1 && index(rest, "/request?") != 1) return ""
  return link
}
' 2>/dev/null)

[ -n "$link" ] || exit 0

# Started, not awaited: the hook never learns how the opener ended.
"$opener" "$link" </dev/null >/dev/null 2>&1 &
printf '{"systemMessage":"kubelatch: opening %s in your browser"}\n' "$link"
exit 0
