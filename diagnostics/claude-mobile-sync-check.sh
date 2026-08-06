#!/usr/bin/env bash
# claude-mobile-sync-check.sh
# Diagnoses why Claude Code sessions on this Mac don't appear in the Claude
# mobile app, and prints the exact fix for each failing condition.
#
# Usage (on your Mac):
#   bash claude-mobile-sync-check.sh
set -u

MIN_RC_VERSION="2.1.154"   # Remote Control needs at least this Claude Code version

# Colors only when writing to a terminal
if [ -t 1 ]; then
  C_OK=$'\033[32m'; C_WARN=$'\033[33m'; C_BAD=$'\033[31m'; C_OFF=$'\033[0m'
else
  C_OK=""; C_WARN=""; C_BAD=""; C_OFF=""
fi

PASS=0; WARN=0; FAIL=0
ok()   { printf '  %s[OK]%s   %s\n' "$C_OK" "$C_OFF" "$1"; PASS=$((PASS+1)); }
warn() { printf '  %s[WARN]%s %s\n' "$C_WARN" "$C_OFF" "$1"; WARN=$((WARN+1)); }
bad()  { printf '  %s[FAIL]%s %s\n' "$C_BAD" "$C_OFF" "$1"; FAIL=$((FAIL+1)); }
fix()  { printf '         fix: %s\n' "$1"; }
hdr()  { printf '\n%s\n' "$1"; }

# version_ge A B  ->  true if A >= B
version_ge() {
  awk -v a="$1" -v b="$2" 'BEGIN{
    n=split(a,x,"."); m=split(b,y,".");
    for(i=1;i<=3;i++){
      xa=(i<=n?x[i]:0)+0; yb=(i<=m?y[i]:0)+0;
      if(xa>yb) exit 0;
      if(xa<yb) exit 1;
    }
    exit 0}'
}

printf 'Claude Code mobile-visibility check\n'
printf 'Machine: %s   Date: %s\n' "$(uname -s)" "$(date)"

# ---------------------------------------------------------------- 1. install
hdr '1. Claude Code installation'
CLAUDE_BIN="$(command -v claude 2>/dev/null || true)"
if [ -z "$CLAUDE_BIN" ]; then
  for p in "$HOME/.claude/local/claude" "$HOME/.local/bin/claude" \
           /usr/local/bin/claude /opt/homebrew/bin/claude; do
    if [ -x "$p" ]; then CLAUDE_BIN="$p"; break; fi
  done
fi
if [ -z "$CLAUDE_BIN" ]; then
  bad 'claude CLI not found on PATH'
  fix 'install Claude Code (https://code.claude.com), then re-run this script'
else
  ok "claude found at $CLAUDE_BIN"
  RAW_VER="$("$CLAUDE_BIN" --version 2>/dev/null || true)"
  VER="$(printf '%s' "$RAW_VER" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | head -1)"
  if [ -z "$VER" ]; then
    warn 'could not read claude version'
    fix "run: claude --version   (and 'claude update' if it is old)"
  elif version_ge "$VER" "$MIN_RC_VERSION"; then
    ok "version $VER (>= $MIN_RC_VERSION, new enough for Remote Control)"
  else
    bad "version $VER is older than $MIN_RC_VERSION"
    fix "run: claude update"
  fi
fi

# ------------------------------------------------- 2. environment variables
hdr '2. Environment variables that block mobile visibility'
ENV_ISSUE=0
check_env() {
  # $1 = var name, $2 = severity (bad|warn), $3 = why, $4 = fix text
  local name="$1"
  local val="${!name:-}"
  if [ -n "$val" ]; then
    ENV_ISSUE=1
    if [ "$2" = "bad" ]; then bad "$name is set — $3"; else warn "$name is set — $3"; fi
    fix "$4"
  fi
}
check_env ANTHROPIC_API_KEY bad \
  'forces API-key auth; API-key sessions never appear in the mobile app' \
  'unset it (remove from ~/.zshrc), restart the terminal, then /login with your claude.ai account'
check_env ANTHROPIC_AUTH_TOKEN bad \
  'overrides claude.ai login with a custom token' \
  'unset it and /login with your claude.ai account'
check_env ANTHROPIC_BASE_URL bad \
  'Remote Control does not work through a custom gateway/proxy base URL' \
  'unset it so Claude Code talks to api.anthropic.com directly'
check_env CLAUDE_CODE_USE_BEDROCK bad \
  'Bedrock auth has no claude.ai account, so nothing can show on mobile' \
  'use a claude.ai Pro/Max/Team/Enterprise login for sessions you want on your phone'
check_env CLAUDE_CODE_USE_VERTEX bad \
  'Vertex auth has no claude.ai account, so nothing can show on mobile' \
  'use a claude.ai Pro/Max/Team/Enterprise login for sessions you want on your phone'
check_env DISABLE_TELEMETRY warn \
  'blocks the feature-flag traffic Remote Control depends on' \
  'unset it, then restart your session'
check_env DO_NOT_TRACK warn \
  'blocks the feature-flag traffic Remote Control depends on' \
  'unset it, then restart your session'
check_env CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC warn \
  'blocks the feature-flag traffic Remote Control depends on' \
  'unset it, then restart your session'
check_env DISABLE_GROWTHBOOK warn \
  'blocks the feature-flag traffic Remote Control depends on' \
  'unset it, then restart your session'
[ "$ENV_ISSUE" -eq 0 ] && ok 'no blocking environment variables set in this shell'

# ------------------------------------------------------- 3. settings files
hdr '3. Settings files (same variables can hide in settings.json "env" blocks)'
SETTINGS_ISSUE=0
for f in "$HOME/.claude/settings.json" "$HOME/.claude/settings.local.json" \
         ".claude/settings.json" ".claude/settings.local.json"; do
  if [ -f "$f" ]; then
    HITS="$(grep -Eo 'ANTHROPIC_API_KEY|ANTHROPIC_AUTH_TOKEN|ANTHROPIC_BASE_URL|CLAUDE_CODE_USE_BEDROCK|CLAUDE_CODE_USE_VERTEX|DISABLE_TELEMETRY|DO_NOT_TRACK|CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC|DISABLE_GROWTHBOOK' "$f" 2>/dev/null | sort -u | tr '\n' ' ')"
    if [ -n "$HITS" ]; then
      SETTINGS_ISSUE=1
      warn "$f mentions: $HITS"
      fix "open the file and remove those entries from its \"env\" block if present"
    fi
  fi
done
[ "$SETTINGS_ISSUE" -eq 0 ] && ok 'no blocking variables found in settings files'

# ------------------------------------------------------------ 4. account
hdr '4. claude.ai account login'
CFG="$HOME/.claude.json"
EMAIL=""
if [ -f "$CFG" ]; then
  if command -v python3 >/dev/null 2>&1; then
    EMAIL="$(python3 -c 'import json,sys
d=json.load(open(sys.argv[1]))
print((d.get("oauthAccount") or {}).get("emailAddress",""))' "$CFG" 2>/dev/null || true)"
  fi
  if [ -z "$EMAIL" ]; then
    EMAIL="$(grep -o '"emailAddress"[^,}]*' "$CFG" 2>/dev/null | head -1 | sed 's/.*: *"//;s/"$//')"
  fi
fi
if [ -n "$EMAIL" ]; then
  ok "logged in to claude.ai as: $EMAIL"
  printf '         note: the Claude app on your phone MUST be signed in as exactly this account.\n'
else
  bad 'no claude.ai account login found on this Mac'
  fix 'start claude, run /login, and choose the claude.ai (subscription) option — not the Console/API option'
fi

# ------------------------------------------------------------ 5. network
hdr '5. Network reachability'
for host in https://api.anthropic.com https://claude.ai; do
  CODE="$(curl -sS -o /dev/null -m 10 -w '%{http_code}' "$host" 2>/dev/null || echo 000)"
  if [ "$CODE" = "000" ]; then
    bad "$host is unreachable from this Mac"
    fix 'check VPN/firewall/proxy — outbound HTTPS (443) to this host is required'
  else
    ok "$host reachable (HTTP $CODE)"
  fi
done

# ------------------------------------------------------------ summary
hdr '--------------------------------------------------------------'
printf 'Result: %d ok, %d warnings, %d failures\n' "$PASS" "$WARN" "$FAIL"
hdr 'Why sessions were not showing:'
printf '  Plain terminal sessions are LOCAL-ONLY by design and never sync to the\n'
printf '  phone. The mobile app Code tab only shows (a) cloud sessions and\n'
printf '  (b) local sessions you have shared via Remote Control.\n'
hdr 'To put a Mac session on your phone (after fixing any FAIL above):'
printf '  A. In a running session type:            /remote-control\n'
printf '     or start new ones with:               claude --remote-control\n'
printf '     make it permanent:                    /config  ->  enable Remote Control for all sessions\n'
printf '  B. For work that survives closing the laptop:  claude --cloud "your task"\n'
hdr 'On the phone:'
printf '  1. Update the Claude app (App Store / Play Store)\n'
printf '  2. Sign in as the SAME account shown in section 4 above\n'
printf '  3. Open the Code tab — the session appears within seconds\n'
hdr 'Extra checks if it still fails:'
printf '  - Inside claude, run /status: it must say you are logged in with your\n'
printf '    Claude subscription account (Pro/Max/Team/Enterprise), not an API key.\n'
printf '  - On Team/Enterprise plans an admin must enable Remote Control at\n'
printf '    claude.ai/admin-settings/claude-code (it is off by default).\n'
printf '  - Remote Control drops if the Mac sleeps ~10 min; keep it awake or use --cloud.\n'

[ "$FAIL" -gt 0 ] && exit 1 || exit 0
