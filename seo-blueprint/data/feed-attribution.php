<?php
/**
 * Plugin Name: DesiMachines — Feed Attribution + REST Hardening
 * Description: (mu-plugin) Anti-scraping side-door fixes from seo-blueprint doc 21 §4:
 *              (1) appends a canonical-source attribution line to every RSS/Atom item, so
 *                  auto-republishers self-identify as copies and link back to the original;
 *              (2) blocks REST user enumeration (/wp-json/wp/v2/users) for anonymous callers;
 *              (3) caps anonymous REST post listings to small pages (stops per_page=100 dumps).
 * Install:     copy to wp-content/mu-plugins/feed-attribution.php (auto-loads, no activation).
 * Rollback:    delete the file.
 *
 * Also set manually: Settings -> Reading -> "For each post in a feed, include: Excerpt".
 */

defined('ABSPATH') || exit;

/* 1 — Attribution line on every feed item (turns republished copies into citations). */
function dm_feed_attribution($content)
{
    if (!is_feed()) {
        return $content;
    }
    $url   = esc_url(get_permalink());
    $title = esc_html(get_the_title());
    $line  = sprintf(
        '<p>This article, <a href="%1$s">%2$s</a>, was originally published on ' .
        '<a href="%3$s">DesiMachines.com</a> — India&#8217;s construction-equipment ' .
        'price &amp; buying platform. Prices, specs and offers are maintained at the ' .
        'original page: <a href="%1$s">%1$s</a></p>',
        $url,
        $title,
        esc_url(home_url('/'))
    );
    return $content . $line;
}
add_filter('the_excerpt_rss', 'dm_feed_attribution');
add_filter('the_content_feed', 'dm_feed_attribution');

/* 2 — Block anonymous REST user enumeration. */
add_filter('rest_endpoints', function ($endpoints) {
    if (!is_user_logged_in()) {
        unset($endpoints['/wp/v2/users'], $endpoints['/wp/v2/users/(?P<id>[\d]+)']);
    }
    return $endpoints;
});

/* 3 — Cap anonymous REST listing size (stops ?per_page=100 full-content dumps
 *     while keeping the API usable for legitimate small reads). */
add_filter('rest_post_dispatch', function ($result, $server, $request) {
    if (is_user_logged_in()) {
        return $result;
    }
    $route = $request->get_route();
    if (preg_match('#^/wp/v2/(posts|pages)#', $route)) {
        $per_page = (int) $request->get_param('per_page');
        if ($per_page > 10) {
            return new WP_Error(
                'rest_forbidden_per_page',
                'per_page is limited for anonymous requests.',
                ['status' => 403]
            );
        }
    }
    return $result;
}, 10, 3);
