---
name: structured-data-google
description: Structured data Schema.org - walidacja i implementacja dla Google rich results
---

# Structured Data Google

## Typy schema dla BigDIAMOND

| Strona | Schema Types |
|--------|-------------|
| Homepage | Organization, LocalBusiness, WebSite |
| PDP | Product, Offer, AggregateRating, BreadcrumbList |
| Service | LocalBusiness, Service, FAQPage |
| Category | BreadcrumbList, ItemList |

## Walidacja JSON-LD

```bash
# Sprawdź czy jest osadzony w HTML
grep -r "application/ld+json" app/public/wp-content/themes/bigdiamond-prestige/inc/

# Narzędzia online
# https://validator.schema.org/
# https://search.google.com/test/rich-results
```

## Wymagane pola Product

- name
- image
- description
- offers.price
- offers.availability

## Typowe problemy

- JSON invalid syntax
- Missing required fields
- Mismatch z page content
- Duplicated schema

## Procedura audit

1. Znajdź wszystkie JSON-LD na stronie
2. Zvaliduj syntax
3. Sprawdź required fields
4. Porównaj z SSOT schema-source-of-truth
