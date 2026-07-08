<?php
/**
 * wp-config.php hardening snippets — doc 22 §3.6.
 * These are constants to ADD to wp-config.php, ABOVE the line:
 *     /* That's all, stop editing! Happy publishing. *​/
 * Do NOT paste this file wholesale — copy the define() lines you need.
 * Test on Cloudways staging; back up wp-config.php first.
 */

/* 1. Disable the in-dashboard file editors (Appearance/Plugin -> Editor).
 *    A compromised admin session's favourite tool for planting a backdoor. */
define('DISALLOW_FILE_EDIT', true);

/* 2. Force SSL for all admin + login pages (you're already HTTPS via Cloudflare). */
define('FORCE_SSL_ADMIN', true);

/* 3. Correct filesystem method (prevents FTP-credential prompts / some LPE paths). */
define('FS_METHOD', 'direct');

/* 4. Limit post revisions + trash cadence (smaller DB, less injection surface, tidier). */
define('WP_POST_REVISIONS', 10);
define('EMPTY_TRASH_DAYS', 14);

/* 5. Keep auto-updates for minor core + security ON (default, but be explicit). */
define('WP_AUTO_UPDATE_CORE', 'minor');

/* 6. OPTIONAL — only if you deploy plugins/themes via git/CI, NOT from wp-admin.
 *    This blocks ALL plugin/theme/core installs+updates from the dashboard.
 *    Leave commented unless that's your workflow, or you'll block your own updates.
 * define('DISALLOW_FILE_MODS', true);
 */

/* -------------------------------------------------------------------------
 * 7. SECURITY SALTS / KEYS.
 * If your wp-config.php still has placeholder keys, or you suspect a
 * compromise, REPLACE the existing AUTH_KEY...NONCE_SALT block with a fresh
 * set from:  https://api.wordpress.org/secret-key/1.1/salt/
 * Rotating salts invalidates all existing login cookies -> logs out any
 * attacker riding a stolen session. Costs your users one re-login. Do it now
 * if anything feels off. (Replace the 8 lines you already have; don't add a
 * second set.)
 * ------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------
 * 8. File permissions (set over SSH, not in this file — reference values):
 *      find . -type d -exec chmod 755 {} \;
 *      find . -type f -exec chmod 644 {} \;
 *      chmod 640 wp-config.php        # or 600 on Cloudways single-app
 *    Nothing in the webroot should be world-writable (777/666).
 * ------------------------------------------------------------------------- */
