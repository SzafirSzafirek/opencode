# Code Ownership Map

**Date:** March 24, 2026
**Site:** BigDIAMOND (Local staging copy)

## Child Theme: bigdiamond-prestige

### Option APIs Usage
The child theme makes extensive use of the Customizer API (`get_theme_mod`) to manage frontend settings, and accesses a few core options via `get_option`:

- `get_theme_mod( 'custom_logo' )` (used in `inc/site-shell.php` and `inc/woocommerce/single-product-layout.php`)
- `get_theme_mod( 'bdp_consult_whatsapp_url' )` (used in `inc/woocommerce/cta.php`)
- `get_theme_mod( 'bdp_consult_calendly_url' )` (used in `inc/woocommerce/cta.php`)
- `get_option( 'page_for_posts' )` (used in `inc/editorial-pages.php`)
- `get_option( 'page_on_front' )` (used in `inc/homepage.php`)

### Database Access & Transients
Direct `$wpdb` access was not found in the primary structural files. The theme relies heavily on transients for caching runtime assets (like compiled CSS).

- `delete_transient( 'bigdiamond_prestige_runtime_css' )` (used in `inc/security.php`)

### WooCommerce Hooks & Containers
The theme extensively hooks into WooCommerce rendering loops. It modifies standard WooCommerce behavior via:

- `inc/woocommerce/hooks.php` registers multiple actions on `woocommerce_before_main_content`, `woocommerce_before_shop_loop_item`, etc.
- It intercepts archive rendering and single product layouts.

### Non-Presentational Business Logic (MIGRATE candidates)
As per the cleanup plan, the following files contain non-presentational logic that should be migrated to a dedicated plugin:

- **`inc/security.php`**: Contains AJAX handlers (`wp_ajax_bigdiamond_prestige_flush_runtime_cache`), nonce verification, and admin request validation.
- **`inc/performance.php`**: Modifies script loading tags (`script_loader_tag`), alters image attributes (`wp_get_attachment_image_attributes`), and injects resource hints (`wp_preload_resources`).
- **`inc/woocommerce/personalization.php`** (and related logic): Implements custom product tokenization (`bigdiamond_prestige_get_product_tokens`) and attribute swatch rendering based on specific taxonomy terms (e.g., matching 'yellow', 'gold', 'żół' to color hex `#D4AF37`).

## MU-Plugins

### automation-by-installatron.php
A simple environment control script that disables automatic updates via filters:
- `add_filter( 'automatic_updater_disabled', '__return_true', -9999 )`
- Unsets `background_updates` in Site Health tests.

## Required Custom Plugins

### bigdiamond-image-seo-ai
This plugin is required but currently inactive. It handles automated image SEO attributes using AI.

**Option APIs:**
- `get_option( 'bd_image_seo_ai_settings' )`
- `add_options_page`

**Post Meta:**
- `get_post_meta( $id, '_wp_attachment_image_alt', true )`
- `update_post_meta( $id, '_wp_attachment_image_alt', ... )`
- Custom meta key `_bd_image_seo_ai_keywords`

**No direct `$wpdb` access or Cron/Action Scheduler usage was detected in the main file.**
