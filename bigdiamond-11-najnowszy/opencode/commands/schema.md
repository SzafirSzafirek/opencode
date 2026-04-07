---
name: /schema
description: Audit i walidacja structured data (JSON-LD) - Schema.org, Google rich results
agent: merchant-data-guard
subtask: true
when: Przed release, przy zmianach w schema, przy audycie SEO
prerequisites:
  - Dostęp do docs/ssot/schema-source-of-truth.md
  - Dostęp do docs/policies/schema-publication-policy.md
  - Znajomość page structure
---

# Schema

## Cel

Audit i walidacja structured data (JSON-LD):
- Schema.org syntax validation
- Required fields per schema type
- Consistency z SSOT
- Google rich results eligibility

## Dostępne Tryby

- `--audit` - audit all pages
- `--page=<slug>` - audit specific page
- `--type=<schema-type>` - audit specific schema type (Product, LocalBusiness, etc.)

## Procedura Audit

### 1. SSOT Check

Sprawdź `docs/ssot/schema-source-of-truth.md`:
- Które schema types są wymagane?
- Jakie są templates dla każdego type?
- Jakie są required fields?

### 2. Policy Check

Sprawdź `docs/policies/schema-publication-policy.md`:
- Które schema types są dozwolone?
- Jaka jest polityka publication?
- Jakie są forbidden fields?

### 3. Page Audit

Dla każdej strony sprawdź:

#### Homepage
- LocalBusiness schema
- Organization schema
- BreadcrumbList schema

#### Product Pages (PDP)
- Product schema
- Offer schema
- AggregateRating schema (jeśli reviews)
- BreadcrumbList schema

#### Service Pages
- LocalBusiness schema lub Service schema
- FAQPage schema (jeśli FAQ)

#### Category Pages
- BreadcrumbList schema
- ItemList schema (dla product listing)

### 4. JSON-LD Validation

Sprawdź:
- Valid JSON syntax
- @context: https://schema.org
- @type jest poprawny
- Wszystkie required fields są obecne
- Brak forbidden fields
- URL matches canonical URL

### 5. Generate Report

```markdown
## Schema Audit - YYYY-MM-DD

### SSOT Status
- schema-source-of-truth.md: CURRENT

### Findings

| Page | Schema Type | Status | Issues |
|------|-------------|--------|--------|
| homepage | LocalBusiness | VALID | None |
| /product/... | Product | INVALID | Missing offers.price |
| ... | ... | ... | ... |

### Schema Types Found
- LocalBusiness: 1 (VALID)
- Product: 45 (VALID: 42, INVALID: 3)
- BreadcrumbList: 50 (VALID: 50)

### Action Items
- [ ] Fix Product schema on 3 PDPs - missing offers.price
- [ ] Add FAQPage schema to pracownia-zlotnicza
```

## Common Schema Types for BigDIAMOND

| Page Type | Schema Types |
|-----------|-------------|
| Homepage | Organization, LocalBusiness, WebSite |
| PDP | Product, Offer, AggregateRating, BreadcrumbList |
| Service | LocalBusiness, Service, FAQPage |
| Category | BreadcrumbList, ItemList |
| Blog | Article, BreadcrumbList |

## Zasady

- **SSOT as template** - używaj SSOT jako template
- **Validate JSON-LD** - zawsze waliduj JSON syntax
- **Consistency** - schema musi być zgodny z page content
- **Google requirements** - sprawdź Google rich results requirements

## Tools

- Google Rich Results Test: https://search.google.com/test/rich-results
- Schema.org Validator: https://validator.schema.org/

## Powiązane

- `/truth-check` - general truth check
- `/smoke` - smoke tests
- `/policy-sync` - policy sync
- `/homepage` / `/product-template` / `/service-page` - strony które mają schema
