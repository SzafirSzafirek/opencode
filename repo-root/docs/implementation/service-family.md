# Service Family - Standard for Service Pages

**Status:** STANDARD_DEFINED

**Last updated:** 2026-04-07

---

## Service Page Types

| Type | Intent | Examples |
|------|--------|----------|
| Money page | Transaction | Pracownia, Naprawa, Przetapianie |
| Support page | Educational | Diamenty laboratoryjne |
| Trust page | Evidence | Realizacje |

---

## Money Page Structure (Primary)

### 1. Hero Section

**Components:**
- Service name (H1)
- Brief description (1-2 sentences)
- Primary CTA: "Zamów konsultację" or "Skontaktuj się"
- Secondary CTA: "Zobacz realizacje"

### 2. Service Scope (SUPPORT)

**Components:**
- "Co oferujemy" heading
- List of specific services:
  - Pracownia: projekty, naprawy, grawerowanie, renowacja
  - Naprawa: czyszczenie, wymiana kamieni, rekonstrukcje
  - Przetapianie: recycling złota

### 3. Process Section (SUPPORT)

**Components:**
- "Jak to działa" heading
- Step-by-step process:
  1. Konsultacja
  2. Projektowanie
  3. Realizacja
  4. Odbiór

### 4. Trust Indicators (TRUST)

**Components:**
- "Dlaczego my" heading
- Key differentiators
- Certifications (if applicable)
- Photos of workshop/results

### 5. Pricing/Lead Time (MONEY)

**Components:**
- Lead time estimate: 2-6 tygodni (for custom)
- Pricing: "Cena ustalana indywidualnie" or estimate
- CTA: "Poproś o wycenę"

### 6. FAQ Section (SUPPORT)

**Components:**
- Relevant FAQ from `docs/ssot/faq-source.md`
- "Masz pytania?" heading
- Common questions about this service

### 7. Local Context (SUPPORT)

**Components:**
- Address: ul. Starowiślna 6/1B, Kraków
- "Odwiedź nas w salonie"
- Map (optional)

### 8. CTA Section (MONEY)

**Components:**
- "Gotowy/Gotowa na projekt?" heading
- Primary CTA: "Skontaktuj się"
- Phone: +48 574 470 119
- Email: biuro@bigdiamond.pl

---

## Support Page Structure

### 1. Educational Hero

**Components:**
- Topic name (H1)
- Brief intro

### 2. Content Sections

**Components:**
- Information content
- Benefits/explanation
- Comparison (if applicable)

### 3. Related Products/Services

**Components:**
- Link to relevant category
- Link to money service page

### 4. CTA

**Components:**
- "Chcesz dowiedzieć się więcej?"
- Contact CTA

---

## Evidence Page Structure (Realizacje)

### 1. Gallery Hero

**Components:**
- "Nasze realizacje" heading
- Brief intro

### 2. Project Gallery

**Components:**
- Photo grid of completed projects
- Project descriptions (optional)

### 3. CTA

**Components:**
- "Chcesz taki projekt?"
- Link to service page

---

## Schema Requirements

| Page | Schema Type | Source |
|------|-------------|--------|
| Money pages | Service | Rank Math (auto) |
| Support pages | Article | Rank Math (auto) |

---

## Dependencies

| Dependency | Source |
|------------|--------|
| Service info | `docs/ssot/service-catalog.md` |
| Lead times | `docs/ssot/lead-times.md` |
| FAQ content | `docs/ssot/faq-source.md` |
| Claims | `docs/policies/claims-matrix.md` |

---

## Implementation

**Files:**
- `inc/service-pages.php`
- Page-specific templates

---

**End of file**
