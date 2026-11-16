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
# Usage: open-approval.sh [<kubelatch_url> [<open_approvals>]]
# hooks.json passes no arguments: Anthropic's plugin directory refuses a hook
# command with a variable other than ${CLAUDE_PLUGIN_ROOT}, so the plugin's
# two settings come from CLAUDE_PLUGIN_OPTION_KUBELATCH_URL and
# CLAUDE_PLUGIN_OPTION_OPEN_APPROVALS, which Claude Code exports to every
# hook. An argument, empty or not substituted, falls back to them too.
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
# POSIX sh and awk only, so it runs wherever Claude Code does. Every program
# it runs is named as it is (awk, uname, xdg-open, open) and the link comes
# from open-approval.awk, a file of its own: Anthropic's plugin directory
# refuses a command path the shell computes or an inline program. The
# plugin's tests put their own awk and openers first in PATH.

base=$1
case $base in '' | *'${'*) base=${CLAUDE_PLUGIN_OPTION_KUBELATCH_URL:-} ;; esac
enabled=$2
case $enabled in '' | *'${'*) enabled=${CLAUDE_PLUGIN_OPTION_OPEN_APPROVALS:-} ;; esac
[ -n "$base" ] || exit 0
case $enabled in false | False | FALSE | 0 | no | No | NO | off | Off | OFF) exit 0 ;; esac

case ${CLAUDE_CODE_ENTRYPOINT:-} in '' | cli) exit 0 ;; esac
[ -z "${SSH_CONNECTION:-}" ] || exit 0

system=$(uname -s 2>/dev/null)
if [ "$system" = Linux ] && [ -z "${DISPLAY:-}" ] && [ -z "${WAYLAND_DISPLAY:-}" ]; then
  exit 0
fi

case $system in
  Linux) command -v xdg-open >/dev/null 2>&1 || exit 0 ;;
  Darwin) command -v open >/dev/null 2>&1 || exit 0 ;;
  *) exit 0 ;;
esac

link=$(KUBELATCH_BASE=$base awk -f "${CLAUDE_PLUGIN_ROOT}/hooks/open-approval.awk" 2>/dev/null)
[ -n "$link" ] || exit 0

# Started, not awaited: the hook never learns how the opener ended.
case $system in
  Linux) xdg-open "$link" </dev/null >/dev/null 2>&1 & ;;
  Darwin) open "$link" </dev/null >/dev/null 2>&1 & ;;
esac
printf '{"systemMessage":"kubelatch: opening %s in your browser"}\n' "$link"
exit 0
