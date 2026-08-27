# F3 — Kill the X-vs-X self-compare page + generator guard

**Issue:** Semrush issue 2, the site's *only* 4xx. Confirmed via `issue_details`: a single URL,
`https://desimachines.com/compare/manitou-1340r-vs-manitou-1340r-skid-steer-loader/`, both `source_url` and `target_url` (i.e. it is not a redirect chain landing on a 404 — the page itself 404s and is still internally linked from somewhere).
**Fix:** find and remove the internal link(s) pointing at it, and add a `left != right` guard to whatever generates compare-page links so this class of bug can't recur.
**Owner:** S-EXEC. **Approval:** pre-authorized (removing one dead artifact + a code guard — not a page/content deletion at scale, not a redirect rule).
**Batch size:** 1 URL's inlinks + 1 generator guard.

## 1. Find what's linking to it (discovery, read-only)

The page itself doesn't exist as content to delete — it already 404s. The work is finding the *source* of the link(s) still pointing at it.

```bash
wp db query "
SELECT ID, post_title, post_type
FROM wp_posts
WHERE post_status = 'publish'
  AND post_content LIKE '%manitou-1340r-vs-manitou-1340r%';
"
```

If the link isn't in post_content (likely — compare/related-model modules are usually generated from a data table or taxonomy relation, not hardcoded HTML), check:
- Any custom table or postmeta driving the "related comparisons" widget on the Manitou 1340R product/compare pages (needs a look at the theme's compare-generator code — `construction-equipments` theme, likely under a `compare` or `related-machines` template part).
- The XML sitemap (if compare pages are sitemap-generated from a model list rather than crawled from links, the self-pair may originate there, not in on-page HTML — check `wp-sitemap.xml` or the SEO plugin's sitemap index for a `manitou-1340r` × `manitou-1340r` combination).

## 2. Confirm the live link (read-only, safe now)

Exa-fetch the Manitou 1340R skid-steer-loader page (and its category/brand hub) and search the returned markdown for `manitou-1340r-vs-manitou-1340r` to identify which module is emitting it, without needing site write access.

## 3. Fix

- Remove the specific `<a>`/data row once located (content edit if in post_content; a data-table row delete if driven by a related-machines table).
- Add a generator guard so no future self-pair can be produced. Exact call site depends on the actual generator function (needs a look at the theme once SSH/repo access exists), but the shape is:

```php
function dm_get_compare_url( $left_slug, $right_slug ) {
	if ( $left_slug === $right_slug ) {
		return false; // never emit a self-compare link/page
	}
	return home_url( "/compare/{$left_slug}-vs-{$right_slug}/" );
}
```
Every call site that builds a "compare this" link/card must skip rendering when this returns `false`.

## 4. Validate

- Exa-fetch the source page again; confirm the link is gone.
- Confirm the URL still 404s (expected — nothing un-404s it, it should simply never be linked again).
- Next Semrush audit (~2026-08-29): issue 2 (the only 4xx) should read 0, and it should stay 0 on subsequent audits (proof the generator guard, not just the one link removal, took).

## Rollback

- Content-edit rollback: restore the previous post revision (`wp post get <ID> --field=post_content` before/after diff kept; WordPress's own revision history is the primary rollback here).
- Code-guard rollback: revert the generator diff via git (this is a template/code change — normal PR revert, no live-site risk since the guard only ever *removes* a broken link class, never adds one).
