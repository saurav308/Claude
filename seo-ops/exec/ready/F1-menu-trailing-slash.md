# F1 — Site-wide menu trailing-slash fix

**Issue:** Semrush issue 214, 21,776 "permanent redirect" notices. Every crawled page's header/footer menu links to `https://desimachines.com/skid-steer-loader` and `https://desimachines.com/telehandler` (no trailing slash); both 301 to the slash version. Confirmed via `page_info` on multiple sampled pages — the same two `id:214` entries recur on every page checked, each pointing at `.../skid-steer-loader` → 301 → `.../skid-steer-loader/`.
**Fix:** add the trailing slash to both menu items at the source (one template-level edit each), so ~20k redirect hops disappear.
**Owner:** S-EXEC. **Approval:** none needed (content/menu edit, not a redirect rule).
**Batch size:** 2 menu items.

## 1. Discover the menu-item IDs (read-only, safe to run immediately once WP-CLI/SSH is available)

WordPress nav menu items are `nav_menu_item` posts; the target URL lives in postmeta `_menu_item_url`.

```bash
wp db query "
SELECT p.ID, p.post_title, pm.meta_value AS url
FROM wp_posts p
JOIN wp_postmeta pm ON pm.post_id = p.ID AND pm.meta_key = '_menu_item_url'
WHERE p.post_type = 'nav_menu_item'
  AND (
    pm.meta_value LIKE '%/skid-steer-loader'
    OR pm.meta_value LIKE '%/telehandler'
  );
"
```

This pattern (`LIKE '%/skid-steer-loader'` with no trailing `%`) matches only URLs that *end* in the bare slug — it will not accidentally match the already-correct `/skid-steer-loader/` version. Expect 1–2 rows per slug (menus can repeat an item in header + footer + mobile nav — check for all occurrences, don't assume exactly 2).

If WP-Hide has renamed the REST base and only REST access is available (no SSH), use the WP core Menu Items endpoint instead — replace `{REST_ROUTE}` with the real base Saurav provides:

```
GET {REST_ROUTE}/wp/v2/menu-items?search=skid-steer-loader
GET {REST_ROUTE}/wp/v2/menu-items?search=telehandler
```
(requires an app-password user with `edit_theme_options`).

## 2. Snapshot before writing (rollback file)

```bash
wp db query --skip-column-names "
SELECT p.ID, pm.meta_value
FROM wp_posts p
JOIN wp_postmeta pm ON pm.post_id = p.ID AND pm.meta_key = '_menu_item_url'
WHERE p.post_type = 'nav_menu_item'
  AND (pm.meta_value LIKE '%/skid-steer-loader' OR pm.meta_value LIKE '%/telehandler');
" > seo-ops/data/meta-snapshots/$(date +%F)-f1-menu-urls-before.csv
```

## 3. Apply (per matched ID from step 1)

```bash
wp post meta update <ID> _menu_item_url 'https://desimachines.com/skid-steer-loader/'
wp post meta update <ID> _menu_item_url 'https://desimachines.com/telehandler/'
```

REST equivalent (per menu-item ID):
```
POST {REST_ROUTE}/wp/v2/menu-items/<id>
{ "url": "https://desimachines.com/skid-steer-loader/" }
```

## 4. Clear caches (WP Rocket + nav-menu transient)

```bash
wp cache flush
wp rocket clean --confirm   # if WP-CLI command exists for the installed WP Rocket version; otherwise purge via wp-admin
wp transient delete --all   # nav menus are transient-cached; targeted delete of wp_nav_menu_* transients is safer if the site has many transients
```

## 5. Validate

- Re-fetch the homepage (and one page from a different template, e.g. a compare page) via Exa fetch and confirm the rendered `<a href>` for both links now carries the trailing slash.
- Confirm no new 404s: both target URLs (`/skid-steer-loader/`, `/telehandler/`) still resolve 200.
- Log expected result: next Semrush audit (~2026-08-29), issue 214 count should fall from 21,776 toward ~0 (residual count = any hardcoded links Semrush finds outside the menu template, e.g. in post content — check those separately if the count doesn't hit zero).

## Rollback

```bash
wp post meta update <ID> _menu_item_url '<old_value_from_csv>'
wp cache flush
```
