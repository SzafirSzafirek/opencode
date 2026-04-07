---
name: merchant-readiness
description: Google Merchant Center i e-commerce readiness - wymagania i walidacja
---

# Merchant Readiness

## Wymagania GMC

1. Poprawne ceny i dostępność
2. Poprawne изображения (min 250x250)
3. GTIN/MPN dla produktów
4. Shipping information
5. Return policy

## WooCommerce do GMC

Produkty w WooCommerce muszą mieć:
- Cena (regular/sale)
- Stan magazynowy
- SKU
- Kategorie

## Walidacja produktów

```bash
./run-wp.sh post list --post_type=product --posts_per_page=20 --fields=ID,post_title,_price,_stock_status,_sku
```

## Typowe problemy

- Brak GTIN
- Niezgodność cen
- Out-of-stock bez update
- Missing images
