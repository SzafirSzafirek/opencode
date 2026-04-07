# Page Intent Map - Architektura Intencji

**Status:** FINAL_CANONICAL

**Last verified:** 2026-04-07
**Verification sources:** DB + Live site

---

## Intent Classification

| Symbol | Meaning |
|--------|---------|
| 💰 | Money page (transaction intent) |
| 📄 | Support page (informational) |
| 🔧 | Utility page (account, cart, checkout) |
| ⚠️ | Mixed intent - REBUILD needed |

---

## Homepage Family

| Page | Slug | Intent | SEO Role | Notes |
|------|------|--------|----------|-------|
| Homepage | / | 💰📄 | Brand + category entry | Mixed - homepage architecture doc |

**Homepage Issues:** ⚠️ REQUIRED_REBUILD
- Hero has product photos instead of clear value prop
- Trust badges buried
- CTA structure unclear
- See: `docs/implementation/homepage-architecture.md`

---

## Category Family 💰

| Kategoria | Slug | Count | Primary Intent | SEO Role |
|-----------|------|-------|----------------|----------|
| Pierscionki | pierscionki | 3365 | 💰 | Money page |
| Kolczyki ze złota | kolczyki-zlote | 876 | 💰 | Money page |
| Złote Zawieszki | zawieszki-zloto | 533 | 💰 | Money page |
| Złote Naszyjniki | zlote-naszyjniki | 206 | 💰 | Money page |
| Bransoletki złote | bransoletki-zlote | 90 | 💰 | Money page |
| Sygnety | sygnety | 44 | 💰 | Money page |
| Złote Łańcuszki | zlote-lancuszki | 17 | 💰 | Money page |
| Naszyjniki | naszyjniki | 17 | 💰 | Money page |
| Bransoletki | bransoletki | 17 | 💰 | Money page |
| Srebrne kolczyki | srebrne-kolczyki | 15 | 💰 | Money page |
| Biżuteria Disney | bizuteria-disney | 18 | 💰 | Money page |
| Złote Monety | zlote-monety | 1 | 💰 | Money page |
| Srebrne naszyjniki | srebrne-naszyjniki | 3 | 💰 | Money page |
| Bransoletki ze srebra | bransoletki-ze-srebra | 1 | 💰 | Money page |
| Srebrne zawieszki | srebrne-zawieszki | 35 | 💰 | Money page |
| Sztabki złota | sztabki-zlota | 27 | 💰 | Money page |
| Zawieszki | zawieszki | 22 | 💰 | Money page |
| Handmade | na-zamowienie | 450 | 💰 | Money page |
| Kolczyki na zamówienie | kolczyki-na-zamowienie | 103 | 💰 | Money page |
| Pierścionki Wyroby dwuczęściowe | pierscionki-wyroby-dwuczesciowe | 247 | 💰 | Money page |

**Category Template Requirements:** See `docs/implementation/category-family.md`

---

## Service Family 💰📄

| Strona | Slug | Page ID | Intent | Conversion Role | SEO Role |
|--------|------|---------|--------|-----------------|----------|
| Pracownia Złotnicza | pracownia-zlotnicza-jubiler-krakow-bigdiamond | 16488 | 💰 | Primary CTA | Money page |
| Biżuteria na zamówienie | bizuteria-handmade-od-bigdiamond-pl-jubiler-krakow | 16686 | 💰 | Primary CTA | Money page |
| Naprawa i renowacja | naprawa-i-renowacja-bizuterii-krakow | 27450 | 💰 | Primary CTA | Money page |
| Przetapianie złota | przetapianie-zlota-krakow | 27379 | 💰 | Primary CTA | Money page |
| Złotnik | zlotnik-krakow-bigdiamond-naprawa-renowacja-i-projekty | 22275 | ⚠️ | Duplicate | Overlap |
| Grawerowanie | (feature) | — | 📄 | Personalization | Feature |
| Diamenty laboratoryjne | diamenty-laboratoryjne-bigdiamond-krakow | 16733 | 📄 | Support | Educational |
| Realizacje | realizacje-na-zamowienie-bigdiamond-jubiler-krakow | 20151 | 📄 | Support | Evidence |

**Service Template Requirements:** See `docs/implementation/service-family.md`

**Issues:**
- Złotnik page overlaps with Pracownia Złotnicza - consider consolidation

---

## PDP Family (Product Detail Pages) 💰

| Component | Intent | Notes |
|-----------|--------|-------|
| Product title | 💰 | Primary conversion |
| Gallery | 💰 | Visual confirmation |
| Price | 💰 | Decision factor |
| Add to cart | 💰 | Primary CTA |
| Specifications | 📄 | Support |
| Trust badges | 📄 | Confidence |
| FAQ | 📄 | Support |
| Related products | 💰📄 | Cross-sell |

**PDP Template Requirements:** See `docs/implementation/pdp-standard.md`

---

## Editorial / Blog Family 📄

| Strona | Slug | Page ID | Intent | Notes |
|--------|------|---------|--------|-------|
| Blog | blog-bigdiamond-najnowsze-trendy-jubilerskie-w-krakowie | 17399 | 📄 | Educational/SEO |

**Blog Posts:** Educational content supporting SEO and brand authority

---

## Policy Pages 📄

| Strona | Slug | Page ID | Intent |
|--------|------|---------|--------|
| Regulamin | regulamin | 11952 | 📄 |
| Polityka prywatności | polityka-prywatnosci | 3 | 📄 |
| Polityka zwrotów | polityka-zwrotow-sklepu-internetowego-bigdiamond-pl | 25201 | 📄 |
| Cookie Policy EU | cookie-policy-eu | 71602 | 📄 |
| Terms & Privacy | terms-privacy | 19354 | 📄 |

---

## Utility Pages 🔧

| Strona | Slug | Intent |
|--------|------|--------|
| Koszyk | /strona-koszyka-jubiler-krakow-bigdiamond | 🔧 |
| Zamówienie | /strona-zamowienia | 🔧 |
| Moje konto | /zaloguj-sie | 🔧 |
| Thank you | /thank-you-page | 🔧 |

---

## Transactional Support Pages 📄

| Strona | Slug | Intent |
|--------|------|--------|
| FAQ | faq-bigdiamond-jubiler-krakow-najczesciej-zadawane-pytania | 📄 |
| Dostawa i płatności | dostawa-i-platnosci | 📄 |

---

## Page Classification Summary

| Family | Money Pages | Support Pages | Utility Pages | Mixed |
|--------|-------------|---------------|---------------|-------|
| Homepage | 0 | 1 | 0 | 1 ⚠️ |
| Category | 20 | 0 | 0 | 0 |
| Service | 4 | 3 | 0 | 1 ⚠️ |
| PDP | ∞ | ∞ | 0 | 0 |
| Editorial | 0 | 1 | 0 | 0 |
| Policy | 0 | 5 | 0 | 0 |
| Utility | 0 | 0 | 4 | 0 |

---

## Pages Requiring Rebuild

| Page | Issue | Priority |
|------|-------|----------|
| Homepage | Mixed intent, unclear CTA structure | HIGH |
| Złotnik (Page 22275) | Duplicate content with Pracownia | MEDIUM |

---

**End of file**
