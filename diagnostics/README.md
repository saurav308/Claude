# Claude Code — sessions not showing on mobile

**Why it happens:** sessions started in a plain Mac terminal are local-only by
design and never sync to the phone. The Claude mobile app's **Code** tab only
shows (a) cloud sessions and (b) local sessions explicitly shared via
**Remote Control**.

## Quick fix (on the Mac)

```bash
claude update                 # 1. get the latest version
claude                        # 2. start a session
# inside the session:
/status                       # 3. must show your claude.ai subscription login
                              #    (saurav@teampromotedge.com), NOT an API key.
                              #    If it shows API key: run /login and pick claude.ai.
/remote-control               # 4. share this session -> appears in the phone's Code tab
```

Make it permanent with `/config` → *Enable Remote Control for all sessions*.
For tasks that should keep running with the laptop closed, start them with
`claude --cloud "task"` instead.

**On the phone:** update the Claude app and sign in with the *same* claude.ai
account, then open the **Code** tab.

## Full diagnostic

If it still doesn't show, run the checker on the Mac — it tests the install
version, blocking environment variables (`ANTHROPIC_API_KEY`,
`ANTHROPIC_BASE_URL`, telemetry opt-outs, Bedrock/Vertex mode), settings
files, the logged-in account, and network reachability, and prints the exact
fix for anything that fails:

```bash
bash diagnostics/claude-mobile-sync-check.sh
```

Docs: [Mobile](https://code.claude.com/docs/en/mobile) ·
[Remote Control](https://code.claude.com/docs/en/remote-control) ·
[Claude Code on the web](https://code.claude.com/docs/en/claude-code-on-the-web)
