# Cleanup Manifest

| name | type | size | owner | referenced_in_code | runtime_used | recommended_action | confidence | rollback | notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `ab12CD34_woo_mailerlite_carts` | table | 76.61 MB | woo-mailerlite | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin woo-mailerlite, 191946 rows |
| `export_media_meta` | table | 19.55 MB | custom-export-script | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin custom-export-script, 38312 rows |
| `ab12CD34_mclean_cache` | table | 16.08 MB | media-cleaner | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin media-cleaner, 34472 rows |
| `ab12CD34_frmt_form_views` | table | 15.58 MB | forminator | no | cron-leftover | PURGE-CANDIDATE | medium | Restore from app/sql/local.sql | Inactive plugin forminator, 96750 rows |
| `ab12CD34_ewwwio_images` | table | 11.58 MB | ewww-image-optimizer | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin ewww-image-optimizer, 30847 rows |
| `export_wc_attachments_lookup` | table | 10.52 MB | custom-export-script | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin custom-export-script, 24957 rows |
| `ab12CD34_mclean_refs` | table | 7.03 MB | media-cleaner | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin media-cleaner, 34472 rows |
| `ab12CD34_pmxi_images` | table | 4.52 MB | wp-all-import-pro | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin wp-all-import-pro, 17595 rows |
| `export_media_posts` | table | 3.52 MB | custom-export-script | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin custom-export-script, 5920 rows |
| `ab12CD34_yoast_indexable` | table | 3.23 MB | wordpress-seo | no | cron-leftover | PURGE-CANDIDATE | medium | Restore from app/sql/local.sql | Inactive plugin wordpress-seo, 2487 rows |
| `ab12CD34_pmxe_posts` | table | 1.52 MB | wp-all-export-pro | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin wp-all-export-pro, 23100 rows |
| `export_wc_product_gallery_map` | table | 1.52 MB | custom-export-script | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin custom-export-script, 11536 rows |
| `export_wc_products_identity` | table | 1.52 MB | custom-export-script | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin custom-export-script, 5580 rows |
| `ab12CD34_litespeed_img_optming` | table | 0.41 MB | litespeed-cache | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin litespeed-cache, 1400 rows |
| `ab12CD34_pmxe_google_cats` | table | 0.39 MB | wp-all-export-pro | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin wp-all-export-pro, 5480 rows |
| `ab12CD34_pmxi_posts` | table | 0.39 MB | wp-all-import-pro | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin wp-all-import-pro, 4800 rows |
| `ab12CD34_yoast_indexable_hierarchy` | table | 0.36 MB | wordpress-seo | no | cron-leftover | PURGE-CANDIDATE | medium | Restore from app/sql/local.sql | Inactive plugin wordpress-seo, 2266 rows |
| `ab12CD34_compressx_images_meta` | table | 0.30 MB | compressx | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin compressx, 85 rows |
| `export_wc_product_featured_map` | table | 0.27 MB | custom-export-script | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin custom-export-script, 5634 rows |
| `used_attachments` | table | 0.20 MB | custom-export-script | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin custom-export-script, 6194 rows |
| `ab12CD34_pmxe_exports` | table | 0.17 MB | wp-all-export-pro | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin wp-all-export-pro, 5 rows |
| `ab12CD34_wt_iew_action_history` | table | 0.14 MB | webtoffee-import-export | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin webtoffee-import-export, 7 rows |
| `ab12CD34_pmxi_imports` | table | 0.08 MB | wp-all-import-pro | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin wp-all-import-pro, 2 rows |
| `ab12CD34_yoast_primary_term` | table | 0.08 MB | wordpress-seo | no | cron-leftover | PURGE-CANDIDATE | medium | Restore from app/sql/local.sql | Inactive plugin wordpress-seo, 48 rows |
| `ab12CD34_woo_mailerlite_jobs` | table | 0.02 MB | woo-mailerlite | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin woo-mailerlite, 0 rows |
| `export_wc_seq` | table | 0.02 MB | custom-export-script | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Inactive plugin custom-export-script, 50 rows |
| `elementor_remote_info_library` | option | 644788 B | elementor | no | cron-leftover | PURGE-CANDIDATE | medium | Restore from app/sql/local.sql | Autoloaded 644788B from inactive plugin |
| `wp-smush-optimize-list` | option | 138942 B | wp-smushit | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Autoloaded 138942B from inactive plugin |
| `_site_transient_feed_*` | option | ~69000 B | wordpress-core | no | no | PURGE-CANDIDATE | high | Transients regenerate automatically | Safe to delete transients |
| `woo_mailerlite_options` | option | 2262 B | woo-mailerlite | no | no | PURGE-CANDIDATE | high | Restore from app/sql/local.sql | Autoloaded 2262B from inactive plugin |
| `aiowps_clean_old_events` | cron hook | N/A | all-in-one-wp-security | no | yes | PURGE-CANDIDATE | medium | wp_clear_scheduled_hook() | Scheduled recurring event |
| `breeze_clear_remote_gravatar` | cron hook | N/A | breeze | no | yes | PURGE-CANDIDATE | medium | wp_clear_scheduled_hook() | Scheduled recurring event |
| `wpseo-reindex` | cron hook | N/A | wordpress-seo | no | yes | PURGE-CANDIDATE | medium | wp_clear_scheduled_hook() | Scheduled recurring event |
| `yith_wcwl_delete_expired_wishlists` | cron hook | N/A | yith-woocommerce-wishlist | no | yes | PURGE-CANDIDATE | medium | wp_clear_scheduled_hook() | Scheduled recurring event |
| `wpacu_daily_scheduled_events` | cron hook | N/A | wp-asset-clean-up | no | yes | PURGE-CANDIDATE | medium | wp_clear_scheduled_hook() | Scheduled recurring event |
| `gla/jobs/update_merchant_price_benchmarks/start` | as_action | N/A | google-listings-and-ads | no | yes | REVIEW | medium | Action Scheduler will re-create on plugin activation | Action Scheduler leftover |

*Note: This is a representative sample of the full manifest. The complete list of tables, options, and cron events is available in the generated CSV reports.*
