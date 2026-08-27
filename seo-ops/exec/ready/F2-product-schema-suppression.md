# F2 — Product schema suppression for unpriced products

**Issue:** Semrush issue 45, 168 structured-data ERRORS. `page_info` shows item `PRODUCT`, cause `REQUIRED`, missing all of `["aggregateRating","offers","review"]` — Google requires ≥1. Count (168) closely matches the sheet's 💰 Missing Prices register (169 rows, generated 08-04); sample URLs overlap (e.g. `/wheel-loader/jcb-440-5/`).
**Fix has two independent parts:**
- **(a) Saurav:** fill the "PRICE TO ADD" column, P1 10 rows first, in the master sheet's 💰 Missing Prices register — this is already the standing #1 quick ask; Semrush just independently confirmed it matters. Not this session's to do.
- **(b) S-EXEC (this artifact):** a template-level rule that suppresses the bare `Product` JSON-LD block entirely when no real offer/review exists yet, so unpriced products stop emitting invalid schema *regardless of when (a) lands*. **Do not fabricate an `aggregateRating` to paper over this** — the site already has a hardcoded 4.5-everywhere pattern flagged as a schema-spam risk; this fix must not add to it.
**Owner:** S-EXEC. **Approval:** pre-authorized (schema hygiene, 2026-08-02).
**Batch size:** 1 site-wide deploy (mu-plugin), reversible by deleting one file.

## Preferred mechanism: RankMath JSON-LD filter (no theme edit)

RankMath (free + Pro) fires `rank_math/json_ld` before output. Hooking it avoids touching the `construction-equipments` theme's product templates at all — lowest blast radius, and trivially reversible.

```php
<?php
/**
 * Plugin Name: DesiMachines — Schema Guard (F2)
 * Description: Suppress the Product JSON-LD block when a product has no real offer/review data, per Semrush issue 45. Never fabricates aggregateRating.
 */

add_filter( 'rank_math/json_ld', function ( $data, $jsonld ) {
	if ( empty( $data['Product'] ) ) {
		return $data;
	}

	$product = $data['Product'];
	$has_offer  = ! empty( $product['offers'] );
	$has_review = ! empty( $product['review'] ) || ! empty( $product['aggregateRating'] );

	if ( ! $has_offer && ! $has_review ) {
		unset( $data['Product'] );
	}

	return $data;
}, 99, 2 );
```

Deploy as an **mu-plugin** (`wp-content/mu-plugins/desimachines-schema-guard-f2.php`) — mu-plugins auto-load with no activation step, and a file delete is the entire rollback.

```bash
# once SSH/SFTP access exists:
scp desimachines-schema-guard-f2.php user@host:/path/to/wp-content/mu-plugins/
# or, if only WP-CLI is available and shell file write isn't:
wp eval-file desimachines-schema-guard-f2.php   # verify the hook registers, then still place the file for persistence — eval-file alone does not persist across requests
```

If the site is not actually emitting Product schema via RankMath's `rank_math/json_ld` filter (needs confirming once code access exists — the theme might build its own JSON-LD independently), the fallback is a template-level guard: locate the product-schema `<script type="application/ld+json">` emission (likely `single-product.php` or a WooCommerce hook override in the theme) and wrap it in the same offer/review check before echo. Flagged here as the fallback path pending an actual look at the theme code.

## Dry run / validation before going live

1. Pick 3 known-unpriced product URLs (cross-reference the sheet's Missing Prices register) and 3 known-priced ones.
2. With the mu-plugin active, re-render each and check the JSON-LD block via a schema parser (Google Rich Results Test or `\wp schema validate` if such a WP-CLI command exists) — priced products should be unaffected; unpriced ones should have no `Product` node at all (not an empty/malformed one).
3. Confirm no PHP notices/fatals in the debug log after activation (`wp-content/debug.log`, or `wp log` if configured).

## Validation after Saurav's price fills land

Once a given product gets a real price (part a), its schema should reappear automatically on the next cache-clear/render — no re-deploy needed, since the filter checks live data each time.

## Rollback

Delete the mu-plugin file. Schema reverts to today's state (the invalid Product block reappears on unpriced products) — a safe rollback since it returns to the pre-fix status quo, not a new failure mode.

## Expected effect

Semrush issue 45 (168 errors) → 0 for any product that either gets a price (part a) or has none (part b suppresses the invalid block either way). Recheck at the next audit (~2026-08-29).
