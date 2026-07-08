# 22 — Security Hardening: How DesiMachines Actually Gets Hacked, and How to Make It Not Worth Trying

> **The question:** "How easy is it to hack my website or inject malware?"
> **The honest answer:** for an unhardened WordPress site — *easy and fully automated*: bots probe every WP site on the internet within hours of it existing, and a single outdated plugin or weak admin password is all they need. For a hardened one on your stack (Cloudways + Cloudflare) — opportunistic attacks bounce off, and you're not a profitable target for skilled humans. **The gap between those two states is about one day of configuration**, which this doc closes.
> **Scope note:** the live site can't be probed from this workspace (network policy), so this is a stack-based assessment; run `data/wp-security-audit.sh` on the server for your actual current state.
> **Companion files (in `data/`):** `wp-security-audit.sh`, `wp-config-security.txt`, `htaccess-security.txt`.

---

## 1. Threat model — who attacks a site like this, and how (ranked by real-world frequency)

| # | Vector | Who | How easy today | Frequency in real WP compromises |
|---|---|---|---|---|
| 1 | **Vulnerable/outdated plugin or theme** | Fully automated bots | Trivial if any plugin is behind on a known CVE — exploited within *days* of disclosure, no human involved | **~90% of WP hacks** start here |
| 2 | **wp-admin credential attacks** (brute force, credential stuffing from other breaches, phishing the admin) | Automated + cheap human | Trivial against weak/reused passwords; near-impossible against 2FA | The other big slice |
| 3 | **Malware upload via a form/plugin flaw** → PHP webshell in `/uploads/` | Automated | Only works if a plugin allows unfiltered upload AND uploads can execute PHP | Common *payload*, needs #1 first |
| 4 | **Admin's own laptop compromised** (stolen session cookies, password manager, phished Cloudways/Cloudflare account) | Targeted human | Depends entirely on personal device/account hygiene | Rising; bypasses all server defenses |
| 5 | **Nulled/pirated premium plugins** | Self-inflicted | Instant — many ship pre-backdoored | Sadly common |
| 6 | **Hosting-level attack** | Skilled human | Hard: Cloudways isolates apps, patches the OS, firewalls ports | Rare |
| 7 | **Bespoke targeted attack** (someone paying a professional to hack *you specifically*) | Skilled human | Expensive; your profile (content/leads site, no stored payments) makes ROI poor | Very rare |

**What an attacker gains here:** not credit cards (you don't store payments) — they want **your SEO**. The standard WP infection is *pharma/casino spam injection* and *malicious redirects* buried in your ranked pages, invisible to you, visible to Googlebot. For a business that is 100% organic, the realistic worst case is a **"This site may be hacked" label in the SERP + deindexing of money pages** — a direct hit on the entire revenue engine. Treat security as an SEO workstream.

**What's already in your favor:** Cloudflare WAF in front (blocks exploit patterns before origin), Cloudways managed OS patching + app isolation + fail2ban, `xmlrpc.php` and user-enumeration closed (`21`), REST dumps capped (`21`). The remaining exposure is the WordPress application layer and the humans.

---

## 2. The hardening plan — 5 layers, ~1 day total

### Layer 1 — Plugins & updates (kills vector #1, the 90% one)

1. **Auto-update everything:** WP Admin → Dashboard → Updates → enable auto-updates for core; Plugins → select all → "Enable auto-updates". On a Varnish/Cloudflare-cached site the risk of a bad plugin update briefly breaking something is far smaller than the risk of running a known-CVE version for weeks. (Cloudways SafeUpdates can