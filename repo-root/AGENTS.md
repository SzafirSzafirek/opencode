# BigDIAMOND WordPress/WooCommerce

## Stack
- WordPress 6.8+ with WooCommerce + HPOS
- Parent theme: GeneratePress 3.6.1
- Child theme: `bigdiamond-prestige` (in `app/public/wp-content/themes/bigdiamond-prestige/`)
- Custom plugin: `bigdiamond-image-seo-ai` (in `app/public/wp-content/plugins/bigdiamond-image-seo-ai/`)
- PHP 8.4, MySQL 8.0 (Local by Flywheel)

## Local Dev Commands

Run SQL against Local MySQL socket:
```bash
./run-sql.sh "SELECT * FROM wp_posts LIMIT 1;"
```

Run WP-CLI via Local PHP:
```bash
./run-wp.sh <command>
```

Example WP-CLI commands:
```bash
./run-wp.sh post list --post_type=product --posts_per_page=5
./run-wp.sh term list product_cat
./run-wp.sh plugin list --status=active
```

## Theme Quality Gate

```bash
cd app/public/wp-content/themes/bigdiamond-prestige
composer install
composer run phpcs
php -l inc/homepage.php
php -l inc/woocommerce/personalization.php
node --check assets/js/theme.js
node --check assets/js/woocommerce-single-product.js
```

## Architecture

- **Hook-first** for WooCommerce (prefer actions/filters over template overrides)
- **CSS-first** for cart/account/checkout surfaces
- **Theme-owned JS is PDP-only** (`woocommerce-single-product.js`) - no generic Woo JS
- Surface modules loaded from `functions.php` in `inc/` subdirectories
- `/koszyk/` is Woo Blocks; local `/kasa/` redirects to `/koszyk/`

## Key Surface Owners

| Surface | Primary owner |
|---------|---------------|
| Homepage | `inc/homepage.php` |
| Service pages | `inc/service-pages.php` |
| Editorial pages | `inc/editorial-pages.php` |
| Woo archives/cart/account | `inc/woocommerce/hooks.php` |
| PDP shell | `inc/woocommerce/single-product-layout.php` |
| PDP personalization | `inc/woocommerce/personalization.php` |

## High-Risk Files

Read full file before editing:
- `inc/homepage.php`, `inc/assets.php`, `inc/site-shell.php`
- `inc/woocommerce/hooks.php`, `inc/woocommerce/personalization.php`
- `inc/woocommerce/single-product-layout.php`
- `assets/css/homepage.css`, `assets/css/woocommerce-single-product.css`
- `assets/js/theme.js`, `assets/js/woocommerce-single-product.js`

## Key Docs

- Theme layout architecture: `app/public/wp-content/themes/bigdiamond-prestige/docs/layout-system.md`
- WooCommerce override policy: `app/public/wp-content/themes/bigdiamond-prestige/woocommerce/README.md`
- PDP photo standards: `app/public/wp-content/themes/bigdiamond-prestige/docs/pdp-product-photo-standards.md`
- SSOT: `docs/ssot/`
- Policies: `docs/policies/`

## Agents & Commands

Agents: `.opencode/agents/`
Commands: `.opencode/commands/`
