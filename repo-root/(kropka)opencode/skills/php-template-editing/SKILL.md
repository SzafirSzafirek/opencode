---
name: php-template-editing
description: Bezpieczna edycja PHP templates - high-risk files i walidacja
---

# PHP Template Editing

## High-Risk Files

Te pliki czytać w całości przed edycją:
- `inc/homepage.php`
- `inc/assets.php`
- `inc/site-shell.php`
- `inc/woocommerce/hooks.php`
- `inc/woocommerce/personalization.php`
- `inc/woocommerce/single-product-layout.php`

## Walidacja przed commit

```bash
php -l inc/<file>.php
composer run phpcs
```

## Zasady

1. Nigdy nie zostawiaj syntax errors
2. Hook-first > bezpośrednia edycja HTML
3. Używaj istniejących helper functions
4. Unikaj direct DB queries

## Struktura PHP w theme

- `functions.php` - bootstrap
- `inc/*.php` - surface modules
- `woocommerce/*.php` - Woo overrides
