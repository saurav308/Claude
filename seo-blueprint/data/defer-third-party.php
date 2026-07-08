<?php
/**
 * Plugin Name: DesiMachines — Defer & On-Interaction Third-Party Loader
 * Description: (mu-plugin) Defers enqueued JS for visitors and delays heavy third-party
 *              scripts (chat widgets, GTM, embeds) until first interaction. INP/TBT fix
 *              from seo-blueprint doc 20 Phase 5.
 * Install:     copy to wp-content/mu-plugins/defer-third-party.php (mu-plugins load
 *              automatically; create the folder if missing). No activation needed.
 * Rollback:    delete the file (or set DTP_ENABLED to false), purge Varnish + Cloudflare.
 *
 * IMPORTANT: the WhatsApp deal bar / RFQ CTA (doc 08) must be plain <a href="https://wa.me/...">
 * markup — it needs no JS and must NOT be routed through this loader.
 */

defined('ABSPATH') || exit;

if (!defined('DTP_ENABLED')) {
    define('DTP_ENABLED', true);   // kill switch
}

/* ---------------------------------------------------------------------------
 * CONFIG — edit these three lists for your site.
 * To see your enqueued script handles:  wp eval 'global $wp_scripts; wp_head();'
 * or simply View Source and check <script id="HANDLE-js"> attributes.
 * ------------------------------------------------------------------------- */

/** 1. Handles that must load normally (never deferred). Keep jQuery here until
 *     the theme is verified to survive deferred jQuery. */
$dtp_defer_exclude = ['jquery', 'jquery-core', 'jquery-migrate'];

/** 2. URL substrings of third-party scripts to hold back until first interaction
 *     (touch/scroll/keydown/mousemove) or the idle timeout. Add your chat widget,
 *     GTM container, embeds. Examples included — extend to match your tags. */
$dtp_on_interaction_patterns = [
    'googletagmanager.com/gtm.js',
    'connect.facebook.net',
    'embed.tawk.to',
    'widget.intercom.io',
    'code.tidio.co',
];

/** 3. Idle fallback (ms): load held scripts anyway after this long, so
 *     analytics still records passive visitors. */
$dtp_idle_timeout_ms = 6000;

/* ---------------------------------------------------------------------------
 * Implementation — no edits needed below.
 * ------------------------------------------------------------------------- */

// (a) Add `defer` to all enqueued scripts except exclusions. Front-end,
//     logged-out only: admins/editors see the site unmodified.
add_filter('script_loader_tag', function ($tag, $handle, $src) use ($dtp_defer_exclude, $dtp_on_interaction_patterns) {
    if (!DTP_ENABLED || is_admin() || is_user_logged_in()) {
        return $tag;
    }
    // (b) On-interaction scripts: swap src -> data-dtp-src so the browser
    //     doesn't fetch them; the loader below restores them.
    foreach ($dtp_on_interaction_patterns as $pat) {
        if ($pat !== '' && strpos($src, $pat) !== false) {
            return str_replace(' src=', ' data-dtp-src=', $tag);
        }
    }
    if (in_array($handle, $dtp_defer_exclude, true) || strpos($tag, ' defer') !== false || strpos($tag, ' async') !== false) {
        return $tag;
    }
    return str_replace(' src=', ' defer src=', $tag);
}, 10, 3);

// (c) The tiny loader: on first interaction (or idle timeout) re-activate all
//     data-dtp-src scripts in order.
add_action('wp_footer', function () use ($dtp_idle_timeout_ms) {
    if (!DTP_ENABLED || is_admin() || is_user_logged_in()) {
        return;
    }
    ?>
    <script id="dtp-loader">
    (function () {
        var fired = false;
        function load() {
            if (fired) return; fired = true;
            document.querySelectorAll('script[data-dtp-src]').forEach(function (s) {
                var n = document.createElement('script');
                for (var i = 0; i < s.attributes.length; i++) {
                    var a = s.attributes[i];
                    if (a.name === 'data-dtp-src') { n.src = a.value; }
                    else if (a.name !== 'id') { n.setAttribute(a.name, a.value); }
                }
                s.parentNode.replaceChild(n, s);
            });
            evts.forEach(function (e) { window.removeEventListener(e, load, opts); });
        }
        var evts = ['touchstart', 'scroll', 'keydown', 'mousemove', 'click'];
        var opts = { once: true, passive: true };
        evts.forEach(function (e) { window.addEventListener(e, load, opts); });
        setTimeout(load, <?php echo (int) $dtp_idle_timeout_ms; ?>);
    })();
    </script>
    <?php
}, 99);
