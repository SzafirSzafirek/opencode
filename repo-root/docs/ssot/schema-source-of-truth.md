# Schema Source of Truth - Szablony Schema.org

**Status:** FINAL_CANONICAL

**Last verified:** 2026-04-07
**Canonical Schema Engine:** Rank Math SEO (1.0.265)

---

## Schema Engine Decision

| Engine | Status | Decision |
|--------|--------|----------|
| Rank Math SEO | ✓ CANONICAL | Default schema generator for all types |
| Custom JSON-LD in theme | ⚠ EXCEPTION_ONLY | Only for types not covered by Rank Math or controlled overrides |

**Decision Tree:**
1. Does Rank Math cover this schema type? → Use Rank Math
2. Is Rank Math output incorrect or incomplete? → Custom JSON-LD override via policy approval
3. Is type not covered by Rank Math? → Custom JSON-LD with policy approval

---

## Organization / LocalBusiness

**Publication Gate:** Rank Math General Settings → Local Business tab
**Implementation Owner:** Rank Math (auto-generated from WooCommerce store settings + page content)
**Where Rendered:** Homepage, Contact page

### Canonical Source Fields

```json
{
  "@context": "https://schema.org",
  "@type": ["Organization", "LocalBusiness", "JewelryStore"],
  "name": "BigDIAMOND",
  "description": "Jubiler Kraków - biżuteria na zamówienie, pierścionki zaręczynowe, obrączki ślubne",
  "url": "https://bigdiamond.pl",
  "logo": "https://bigdiamond.pl/wp-content/uploads/2024/07/Logo-firmy-BigDIAMOND-Jubiler-Krakow-1.png",
  "image": "https://bigdiamond.pl/wp-content/uploads/2024/07/Logo-firmy-BigDIAMOND-Jubiler-Krakow-1.png",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "ul. Starowiślna 6/1B",
    "addressLocality": "Kraków",
    "addressRegion": "Małopolskie",
    "postalCode": "31-032",
    "addressCountry": "PL"
  },
  "telephone": "+48 574 470 119",
  "email": "biure@bigdiamond.pl",
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
      "opens": "10:00",
      "closes": "19:00"
    },
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Saturday"],
      "opens": "10:00",
      "closes": "14:00"
    }
  ],
  "priceRange": "$$",
  "areaServed": {
    "@type": "City",
    "name": "Kraków"
  }
}
```

### Rank Math LocalBusiness Verification Checklist

- [ ] Rank Math → General Settings → Local Business
- [ ] Name: "BigDIAMOND"
- [ ] Address: "ul. Starowiślna 6/1B, 31-032 Kraków"
- [ ] Phone: "+48 574 470 119"
- [ ] Email: "biuro@bigdiamond.pl"
- [ ] Hours: Mon-Fri 10:00-19:00, Sat 10:00-14:00
- [ ] Logo uploaded in Rank Math

**Note:** Homepage hero section shows hours "Pon.-Pt. 9:00 - 19:00" but canonical hours are "10:00 - 19:00" per contact page. Verify correct hours in Rank Math.

### Address Discrepancy (Historical)

| Source | Value | Status |
|--------|-------|--------|
| Schema (SSOT) | "ul. Starowiślna 6/1B" | ✓ CANONICAL |
| Page 15982 text | "ul. Starowiślna 6" | ⚠ needs-owner-confirmation |
| Google Maps | "ul. Starowiślna 6" | Map pin |

**Resolution:** Schema uses "6/1B" per WooCommerce store address. Discrepancy with Google Maps is common (mapping algorithms simplify). Owner confirmation needed for final address text.

---

## Product / Offer

**Publication Gate:** Rank Math WooCommerce integration (auto-generated)
**Implementation Owner:** Rank Math (auto from WooCommerce product data)
**Where Rendered:** PDP pages

### Canonical Source Fields

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "[PRODUCT_NAME]",
  "description": "[PRODUCT_DESCRIPTION]",
  "image": "[PRODUCT_IMAGE_URL]",
  "sku": "[PRODUCT_SKU]",
  "mpn": "[PRODUCT_MPN]",
  "brand": {
    "@type": "Brand",
    "name": "BigDIAMOND"
  },
  "offers": {
    "@type": "Offer",
    "price": "[PRODUCT_PRICE]",
    "priceCurrency": "PLN",
    "availability": "[IN_STOCK|OUT_OF_STOCK]",
    "seller": {
      "@type": "Organization",
      "name": "BigDIAMOND"
    }
  }
}
```

### Rank Math Product Schema Verification

- [ ] Rank Math → WooCommerce → Product Schemas
- [ ] Brand: "BigDIAMOND"
- [ ] Price currency: PLN
- [ ] Seller: BigDIAMOND

---

## BreadcrumbList

**Publication Gate:** Rank Math (auto on pages with breadcrumbs)
**Implementation Owner:** Rank Math
**Where Rendered:** Category pages, PDP, Service pages

### Canonical Source Fields

```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Strona główna",
      "item": "https://bigdiamond.pl"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "[CATEGORY_NAME]",
      "item": "https://bigdiamond.pl/[CATEGORY_SLUG]/"
    }
  ]
}
```

---

## FAQPage

**Publication Gate:** Rank Math FAQ block OR custom JSON-LD
**Implementation Owner:** Page content (Rank Math FAQ block)
**Where Rendered:** FAQ page (Page ID 24673)

### Canonical Source Fields

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "[QUESTION_TEXT]",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "[ANSWER_TEXT]"
      }
    }
  ]
}
```

### FAQPage Content Source

Full FAQ content in: `docs/ssot/faq-source.md`

**Blocked claims in FAQ answers (NOT to be in Schema):**
| Claim | Why Blocked |
|-------|-------------|
| "30-50% niższa cena" | NEEDS_OWNER_CONFIRMATION |
| "Zużycie wody mniejsze o 85%" | NEEDS_OWNER_CONFIRMATION |
| "Ślad węglowy redukowany o 70%" | NEEDS_OWNER_CONFIRMATION |
| "certyfikat SCS-007" | NEEDS_OWNER_CONFIRMATION |

---

## Service

**Publication Gate:** Rank Math (auto-detected on service pages) OR custom JSON-LD
**Implementation Owner:** Rank Math / Theme
**Where Rendered:** Service pages

### Canonical Source Fields

```json
{
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "[SERVICE_NAME]",
  "description": "[SERVICE_DESCRIPTION]",
  "provider": {
    "@type": "LocalBusiness",
    "name": "BigDIAMOND",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "ul. Starowiślna 6/1B",
      "addressLocality": "Kraków",
      "postalCode": "31-032",
      "addressCountry": "PL"
    },
    "telephone": "+48 574 470 119"
  },
  "areaServed": {
    "@type": "City",
    "name": "Kraków"
  }
}
```

### Confirmed Service Pages

| Service | Slug | Page ID | Schema Type |
|---------|------|---------|-------------|
| Pracownia Złotnicza | pracownia-zlotnicza-jubiler-krakow-bigdiamond | 16488 | Service |
| Biżuteria na zamówienie | bizuteria-handmade-od-bigdiamond-pl-jubiler-krakow | 16686 | Service |
| Naprawa i renowacja | naprawa-i-renowacja-bizuterii-krakow | 27450 | Service |
| Złotnik | zlotnik-krakow-bigdiamond-naprawa-renowacja-i-projekty | 22275 | Service |

---

## MerchantReturnPolicy

**Publication Gate:** Rank Math OR WooCommerce settings
**Implementation Owner:** Rank Math
**Where Rendered:** Policy pages

### Canonical Source Fields

```json
{
  "@context": "https://schema.org",
  "@type": "MerchantReturnPolicy",
  "name": "Polityka zwrotów BigDIAMOND",
  "returnPolicyCategory": "https://schema.org/MerchantReturnFiniteReturnWindow",
  "returnDays": 14,
  "returnFees": "https://schema.org/ReturnFeesCustomerResponsibility",
  "merchantReturnDays": 14
}
```

### Return Policy Source

- Return window: 14 days from delivery
- Return fees: Customer responsibility
- Source: Page ID 25201 (Polityka Zwrotów)

---

## Rank Math Schema Verification Checklist

For all schema types, verify in Rank Math admin:

### Pre-Publication
- [ ] Schema is complete (all required fields present)
- [ ] No blocked claims in descriptions
- [ ] Values match page content
- [ ] Validated at https://validator.schema.org/

### Rank Math Configuration Required
- [ ] General Settings → Local Business configured
- [ ] WooCommerce integration enabled
- [ ] FAQ block used for FAQPage (not manual JSON-LD unless exception)
- [ ] Service pages detected as Service type

---

## Blocked Claims in Schema

The following claims MUST NOT appear in Schema descriptions:

| Claim | Why Blocked |
|-------|-------------|
| "30-50% niższa cena" diamentów | NEEDS_OWNER_CONFIRMATION |
| "85% mniej wody" | NEEDS_OWNER_CONFIRMATION |
| "70% ślad węglowy" | NEEDS_OWNER_CONFIRMATION |
| "certyfikat SCS-007" | NEEDS_OWNER_CONFIRMATION |
| "najlepszy jubiler" | Superlative without evidence |
| "ekskluzywna biżuteria" | Unverified claim |

---

## Status

`FINAL_CANONICAL` — Rank Math designated as canonical schema engine. All types have canonical source fields defined. Blocked claims documented. Logo/image URLs added from live site.

---

**End of file**
