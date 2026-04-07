---
name: wp-child-theme
description: Edycja i rozszerzanie GeneratePress child theme zgodnie z architekturą BigDIAMOND
---

# WP Child Theme

## Zasady

- Nigdy nie edytuj parent theme bezpośrednio
- Wszystkie zmiany w child theme
- Hook-first > template overrides
- CSS-first dla powierzchni e-commerce

## Struktura

Child theme: `app/public/wp-content/themes/bigdiamond-prestige/`

## Typowe operacje

- Dodawanie CSS: edytuj `assets/css/*.css`
- Dodawanie JS: edytuj `assets/js/*.js`
- Dodawanie PHP: edytuj `inc/*.php`

## Walidacja

```bash
php -l inc/<file>.php
composer run phpcs
```
