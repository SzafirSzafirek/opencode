---
name: /product-template
description: Praca z PDP (Product Detail Page) - gallery, purchase, personalization, sticky CTA
agent: plan-architect
subtask: true
when: Przy zmianach w PDP, dodawaniu nowych atrybutów, zmianach w layoutcie produktu
prerequisites:
  - Znajomość inc/woocommerce/single-product-layout.php
  - Znajomość inc/woocommerce/personalization.php
  - Znajomość assets/css/woocommerce-single-product.css
  - Znajomość assets/js/woocommerce-single-product.js
---

# Product Template Work

## Charakterystyka Surface

**PDP to high-risk WooCommerce surface** składający się z:
- Gallery-first stage
- Purchase-focused summary
- Below-fold story
- Reassurance band
- Accordion details
- Related products
- Sticky purchase bar

## Owned by

- `inc/woocommerce/single-product-layout.php` - PDP shell
- `inc/woocommerce/personalization.php` - PDP personalization (HIGH RISK)
- `assets/css/woocommerce-single-product.css` - styles
- `assets/js/woocommerce-single-product.js` - PDP-only JS (swatches, gallery, sticky CTA)
- `woocommerce/single-product/review.php` - template override (jedyny approved)

## Zasady

- **Treat single-product-layout.php i personalization.php jako jeden system**
- **Preserve gallery, variations, personalization, engraving, sticky CTA, reviews, related products**
- **Read full file before editing** - wszystkie PDP files są high-risk
- **No generic Woo JS** - theme-owned JS tylko dla PDP

## Procedura Pracy

### 1. Analiza Obecnego Stanu

```bash
./run-wp.sh post list --post_type=product --posts_per_page=3
./run-wp.sh term list product_cat
./run-wp.sh term list pa_material 2>/dev/null || echo "No pa_material"
```

- Przeczytaj `inc/woocommerce/single-product-layout.php`
- Przeczytaj `inc/woocommerce/personalization.php`
- Zidentyfikuj co wymaga zmiany

### 2. Zmiany Layout (PHP)

1. Edytuj `inc/woocommerce/single-product-layout.php`
2. Uruchom `php -l inc/woocommerce/single-product-layout.php`
3. Uruchom `composer run phpcs`

### 3. Zmiany Personalization (HIGH RISK)

1. Przeczytaj pełny `inc/woocommerce/personalization.php`
2. Zrozum impact zmian
3. Wprowadź minimalną poprawną zmianę
4. Uruchom `php -l inc/woocommerce/personalization.php`
5. Przetestuj na sample product

### 4. Zmiany CSS

1. Edytuj `assets/css/woocommerce-single-product.css`
2. Upewnij się że nie nadpisujesz WooCommerce core

### 5. Zmiany JS

1. Edytuj `assets/js/woocommerce-single-product.js`
2. Uruchom `node --check assets/js/woocommerce-single-product.js`

## Walidacja

1. PDP ładuje się poprawnie
2. Gallery działa (lightbox, navigation)
3. Variations/swatches działają
4. Add to cart działa
5. Personalization fields działają
6. Sticky CTA działa
7. Related products wyświetlają się
8. Mobile layout OK

## Photo Standards

Wg `docs/pdp-product-photo-standards.md`:
- 1:1 square canvas
- Product fills 78-88% of frame
- Consistent background across product line
- Gallery order: hero → context → detail → packaging

## Powiązane

- `/smoke` - smoke tests
- `/taxonomy` - praca z atrybutami
- `/truth-check` - walidacja treści produktów
- `/schema` - audit schema na PDP
