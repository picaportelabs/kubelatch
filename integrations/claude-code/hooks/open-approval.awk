# kubelatch plugin for Claude Code: the link the PostToolUse hook opens.
#
# open-approval.sh runs this file with awk -f ${CLAUDE_PLUGIN_ROOT}/hooks/...,
# the hook's JSON on stdin and the plugin's kubelatch URL in KUBELATCH_BASE.
# It prints the link of the tool's answer when the answer starts with a code
# that waits for a person and the link passes every check that
# open-approval.sh describes, and nothing otherwise.
#
# POSIX awk only, so it runs wherever Claude Code does; the plugin's tests run
# it under each awk on PATH (mawk, gawk, BWK awk).

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
