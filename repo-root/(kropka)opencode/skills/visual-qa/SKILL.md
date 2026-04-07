---
name: visual-qa
description: Visual QA - screenshoty, porównania, design consistency
---

# Visual QA

## Zasady

1. Przed/po - zawsze porównuj
2. Systematic - checklist
3. Cross-device - różne viewporty

## Checklist wizualny

### Layout
- Header i nawigacja
- Footer
- Content alignment
- Spacing consistency
- Container widths

### Komponenty
- Buttons (size, color, hover)
- Forms (input styles, labels)
- Cards (shadows, borders, radius)
- Typography (font sizes, weights)

### Strony
- Homepage
- Category/Archive
- Product Detail Page (PDP)
- Cart
- Checkout
- Service pages

### Responsive
- Mobile (375px)
- Tablet (768px)
- Desktop (1280px)
- Large (1920px)

## Narzędzia

- Playwright - automated screenshots
- Browser DevTools - inspection
- Lighthouse - visual audit

## High-risk visual changes

- CSS w `assets/css/*.css`
- Layout zmiany w `inc/site-shell.php`
- PDP zmiany w `inc/woocommerce/single-product-layout.php`
