---
name: /category
description: Praca z category/archive pages - hook-first, dane z WooCommerce
agent: plan-architect
subtask: true
when: Przy zmianach w category pages, archive layout, product listing
prerequisites:
  - Znajomość inc/woocommerce/hooks.php
  - Znajomość assets/css/woocommerce.css
  - Rozumienie WooCommerce archive behavior
---

# Category Work

## Charakterystyka Surface

**Hook-first surface** - archive/category pages są kontrolowane przez `inc/woocommerce/hooks.php`. WooCommerce native loop pozostaje nietknięty.

## Owned by

- `inc/woocommerce/hooks.php` - archive hooks i wrappers
- `assets/css/woocommerce.css` - shared Woo styles
- WooCommerce native templates (nie nadpisywać bez potrzeby)

## Sekcje Category Page

Wg `docs/layout-system.md`:
- Archive hero
- Slim browse toolbar
- Browse-first product cards
- Native Woo sorting and pagination

## Procedura Pracy

### 1. Analiza Obecnego Stanu

```bash
./run-wp.sh term list product_cat
./run-wp.sh post list --post_type=product --posts_per_page=5
```

- Przeczytaj `inc/woocommerce/hooks.php` - sekcje archive-related
- Zidentyfikuj co wymaga zmiany

### 2. Zmiany CSS

1. Edytuj `assets/css/woocommerce.css`
2. Dodaj style dla `.woocommerce archives` lub `.tax-product_cat`
3. Nie nadpisuj WooCommerce core styles bez potrzeby

### 3. Zmiany w Hooks

1. Przeczytaj pełny `inc/woocommerce/hooks.php`
2. Dodawaj nowe hooks lub modify istniejące
3. Uruchom `php -l inc/woocommerce/hooks.php`
4. Uruchom `composer run phpcs`

### 4. Zmiany w Kategoriach

```bash
# Lista kategorii
./run-wp.sh term list product_cat

# Update category
./run-wp.sh term update product_cat <ID> --name="..." --description="..."

# Create category
./run-wp.sh term create product_cat --name="..." --description="..."
```

## Zasady

- **Preserve sorting** - nie zmieniaj native Woo sorting
- **Preserve pagination** - nie zmieniaj native Woo pagination
- **Avoid hardcoded badges** - nie dodawaj fake product badges
- **Avoid mock metadata** - używaj real product data

## Walidacja

1. Archive ładuje się poprawnie
2. Produkty wyświetlają się poprawnie
3. Filtering/sorting działa
4. Mobile layout OK
5. No JS errors

## Powiązane

- `/smoke` - smoke tests
- `/taxonomy` - praca z taksonomią
- `/truth-check` - walidacja treści
