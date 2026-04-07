# Homepage Architecture

**Status:** DRAFT_REBUILD

**Last updated:** 2026-04-07

---

## Current State

**Issues identified:**
- Mixed intent throughout page
- Hero uses product photos instead of clear value proposition
- Trust badges buried
- CTA structure unclear
- No clear visual hierarchy

---

## Target State: Section Order

### 1. Hero Section (MONEY)

**Purpose:** Immediate value proposition + primary CTA

**Components:**
- Headline: Clear value proposition (not product photo)
- Subheadline: Supporting statement
- Primary CTA: "Zobacz Kolekcję" or service CTA
- Trust indicator (optional): "Jubiler w Krakowie od [YEAR]"

**CTA targets:**
- Primary: /sklep/ (product category)
- Secondary: /kontakt/ (service inquiry)

---

### 2. Trust Block (TRUST)

**Purpose:** Build confidence

**Components:**
- 💍 Pierwsza korekta rozmiaru pierścionka gratis!
- 🚚 Darmowa dostawa od 1000 zł!
- 🎁 Eleganckie opakowanie prezentowe gratis!

**Position:** Immediately after hero or floating

---

### 3. Category Showcase (MONEY)

**Purpose:** Navigate to product categories

**Components:**
- Grid of top categories:
  - Pierscionki → /pierscionki/
  - Kolczyki → /kolczyki-zlote/
  - Naszyjniki → /naszyjniki-bigdiamond-pl-bizuteria-od-jubiler-krakow/
  - Bransoletki → /bransoletki-jubiler-krakow-bigdiamond/
  - Obrączki (konfigurator) → /obraczki-slubne-konfigurator/
  - Biżuteria na zamówienie → /bizuteria-handmade-od-bigdiamond-pl-jubiler-krakow/

**Design:** Clean grid, product images, category names

---

### 4. Featured Products (MONEY)

**Purpose:** Showcase selected products

**Components:**
- "Nasza kolekcja" heading
- Product grid (4-8 products)
- Add to cart capability
- Price and basic info

---

### 5. Service Introduction (SUPPORT + MONEY)

**Purpose:** Introduce services

**Components:**
- Section heading: "Nasza Pracownia Złotnicza"
- Brief description of capabilities
- Photo gallery (realizations)
- CTA: "Zamów konsultację" → /kontakt/
- CTA: "Zobacz realizacje" → /realizacje-na-zamowienie-bigdiamond-jubiler-krakow/

---

### 6. Trust/About Section (TRUST)

**Purpose:** Build authority

**Components:**
- "Dlaczego BigDIAMOND?" heading
- Key differentiators:
  - 100+ lat tradycji
  - Własna pracownia złotnicza
  - Certyfikowane kamienie (IGI/GIA)
  - Personalizacja
- Photo of workshop/team (optional)

---

### 7. Social Proof (TRUST)

**Purpose:** Build credibility

**Components:**
- Customer reviews/testimonials
- TripAdvisor/Google rating badge
- Trust badges

---

### 8. Blog/Editorial Teaser (SUPPORT)

**Purpose:** SEO + additional value

**Components:**
- "Skarbnica Wiedzy" heading
- Latest 3 blog posts
- CTA: "Czytaj więcej" → /blog-bigdiamond-najnowsze-trendy-jubilerskie-w-krakowie/

---

### 9. Contact/Location (SUPPORT)

**Purpose:** Enable contact

**Components:**
- Map embed
- Address: ul. Starowiślna 6/1B, 31-032 Kraków
- Phone: +48 574 470 119
- Email: biuro@bigdiamond.pl
- Hours: Pon-Pt 10:00-19:00, Sob 10:00-14:00
- CTA: "Skontaktuj się" → /kontakt-bigdiamond-jubiler-w-krakowie/

---

### 10. Footer (UTILITY)

**Standard footer:**
- Navigation links
- Policy pages
- Social links
- Copyright

---

## Sections to REMOVE from Homepage

| Element | Reason |
|---------|--------|
| Product photos in hero | Confuses intent |
| Duplicate category navigation | Causes confusion |
| Excessive trust badges | Buried trust signals |
| Multiple CTAs without hierarchy | No clear path |

---

## Component Map

| Component | Intent | File Location |
|-----------|--------|---------------|
| Hero | Money | `inc/homepage.php` |
| Trust badges | Trust | `inc/homepage.php` |
| Category showcase | Money | `inc/homepage.php` |
| Featured products | Money | `inc/homepage.php` |
| Service intro | Support/Money | `inc/homepage.php` |
| About section | Trust | `inc/homepage.php` |
| Blog teaser | Support | `inc/homepage.php` |
| Contact block | Support | `inc/site-shell.php` |
| Footer | Utility | `inc/site-shell.php` |

---

## Dependencies

| Dependency | Source |
|------------|--------|
| Product images | WooCommerce |
| Category data | `docs/ssot/product-attributes.md` |
| Service info | `docs/ssot/service-catalog.md` |
| Trust claims | `docs/ssot/guarantees-and-care.md` |
| Schema | `docs/ssot/schema-source-of-truth.md` |

---

## Next Steps

1. Review section order with stakeholder
2. Define exact content per section
3. Implement in `inc/homepage.php`
4. Test user flows
5. Verify no regression in existing functionality

---

**End of file**
