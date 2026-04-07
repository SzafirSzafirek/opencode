---
name: woo-hooks-templates
description: WooCommerce hooks i template overrides - gdy hooks nie wystarczą
---

# WooCommerce Hooks & Templates

## Zasady

1. Preferuj hooks/filters nad template overrides
2. Dodawaj template override tylko gdy hook nie istnieje lub nie daje kontroli
3. Każdy override musi mieć inline note z wersją WooCommerce

## Override Registry

Wg `woocommerce/README.md` aktualnie nadpisany jest tylko:
- `single-product/review.php`

## Procedura Override

1. Sprawdź czy istnieje hook który może załatwić sprawę
2. Jeśli nie, zidentyfikuj oryginalny template WooCommerce
3. Skopiuj do child theme z zachowaniem ścieżki
4. Dodaj comment z wersją WooCommerce:
```php
<?php
// Override: WooCommerce X.X
```

## Walidacja

```bash
composer run phpcs
```
