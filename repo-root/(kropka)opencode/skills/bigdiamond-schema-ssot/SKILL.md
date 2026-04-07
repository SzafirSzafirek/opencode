---
name: bigdiamond-schema-ssot
description: Schema.org templates dla BigDIAMOND - LocalBusiness, Product, Service
---

# BigDIAMOND Schema SSOT

## Typy schema

Status: NEEDS_REVIEW

## Homepage Schema

```json
{
  "@context": "https://schema.org",
  "@type": ["Organization", "LocalBusiness"],
  "name": "NEEDS_REVIEW",
  "url": "NEEDS_REVIEW",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "NEEDS_REVIEW",
    "addressLocality": "Kraków",
    "addressRegion": "Małopolskie",
    "postalCode": "NEEDS_REVIEW",
    "addressCountry": "PL"
  },
  "telephone": "NEEDS_REVIEW"
}
```

## Product Schema

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "NEEDS_REVIEW",
  "description": "NEEDS_REVIEW",
  "image": "NEEDS_REVIEW",
  "sku": "NEEDS_REVIEW",
  "offers": {
    "@type": "Offer",
    "price": "NEEDS_REVIEW",
    "priceCurrency": "PLN",
    "availability": "https://schema.org/InStock"
  }
}
```

## Service Schema

```json
{
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "NEEDS_REVIEW",
  "description": "NEEDS_REVIEW",
  "provider": {
    "@type": "LocalBusiness",
    "name": "NEEDS_REVIEW"
  }
}
```

## Walidacja

Użyj https://validator.schema.org/ dla każdego schema.
