# Execution Order

**Date:** March 24, 2026
**Site:** BigDIAMOND (Local staging copy)

## Important Directives
- **Dry-run only:** This plan describes the order of execution for a future phase. No actions are taken during this audit.
- **Rollback first:** Ensure all backups (SQL dump, Updraft) are secure before proceeding with any wave.

## Wave 1: Low Risk (Safe to Execute)
These items have no code references outside their inactive plugins, no runtime usage, and no dependencies on critical paths (checkout, orders, SEO, mail, auth).

1. **Clear Expired Transients:**
   - Delete all options starting with `_transient_` or `_site_transient_`. These will automatically regenerate as needed.
2. **Remove Orphaned Cron Hooks:**
   - Clear scheduled hooks for inactive plugins (e.g., `aiowps_clean_old_events`, `breeze_clear_remote_gravatar`, `wpacu_daily_scheduled_events`, `yith_wcwl_delete_expired_wishlists`).
3. **Drop Safe Orphan Tables:**
   - Drop tables belonging to definitively inactive and unused plugins:
     - `ab12CD34_woo_mailerlite_carts`
     - `ab12CD34_woo_mailerlite_jobs`
     - `ab12CD34_mclean_cache`
     - `ab12CD34_mclean_refs`
     - `ab12CD34_ewwwio_images`
     - `ab12CD34_ewwwio_queue`
     - `ab12CD34_compressx_images_meta`
     - `ab12CD34_compressx_files_opt_meta`
     - Custom export script leftovers: `export_media_meta`, `export_wc_attachments_lookup`, etc.

## Wave 2: Medium Risk (Requires Verification Post-Execution)
These items are orphaned but belong to complex plugins or have potential minor side effects.

1. **Drop Importer/Exporter Residue:**
   - `ab12CD34_pmxi_*` (WP All Import Pro)
   - `ab12CD34_pmxe_*` (WP All Export Pro)
   - `ab12CD34_wt_iew_*` (WebToffee)
2. **Clean SEO Leftovers:**
   - Drop Yoast SEO tables (`ab12CD34_yoast_*`) since Rank Math is active and migrations should be complete.
3. **Clean Cache/Optimization Leftovers:**
   - Drop `ab12CD34_litespeed_img_optming`
4. **Remove Autoloaded Options:**
   - Delete heavy autoloaded options from inactive plugins (e.g., `elementor_remote_info_library`, `wp-smush-optimize-list`).

## Wave 3: High Risk / Manual Review (Blocked or Needs Code Migration)
These items require manual code changes, business decisions, or are currently blocked by active dependencies.

1. **Migrate Child Theme Logic:**
   - Extract non-presentational logic from `inc/security.php`, `inc/performance.php`, and `inc/woocommerce/personalization.php` into a separate MU-plugin or custom plugin.
2. **Review Ambiguous Tables:**
   - `ab12CD34_frmt_*` (Forminator) - Verify if form data is needed before dropping.
   - `ab12CD34_gla_*` (Google Listings and Ads) - Verify if merchant data is needed before dropping.
3. **Blocked: HPOS and Legacy Orders:**
   - Do not touch `ab12CD34_wc_orders` or `ab12CD34_posts` (shop_order). Cleanup is BLOCKED due to active InPost code touching legacy posts/postmeta and unsynced orders.
4. **Blocked: Security/Mail Tables:**
   - Do not drop `ab12CD34_wpmailsmtp_*` or Wordfence tables without explicit confirmation that logs are no longer required.

## Validation Checklist (Post-Execution)
After each wave, verify the following surfaces:
- [ ] Front page loads without errors
- [ ] Product page displays correctly (including swatches and tokens)
- [ ] Cart functions normally (add/remove items)
- [ ] Checkout page loads and processes mock payments
- [ ] Order admin interface is accessible
- [ ] Shipping labels/webhooks (InPost) generate correctly
- [ ] SEO metadata (Rank Math) is present in `<head>`
- [ ] Redirects function as expected
- [ ] Outbound mail sends successfully
