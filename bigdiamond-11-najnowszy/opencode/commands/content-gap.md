---
name: /content-gap
description: Analiza content gaps - missing topics, competitor gaps, search intent misalignment
agent: plan-architect
subtask: true
when: Przy audycie SEO, planowaniu content strategy, identyfikacji missing topics
prerequisites:
  - Dostęp do docs/ssot/page-intent-map.md
  - Znajomość existing content
  - Rozumienie customer journey
---

# Content Gap

## Cel

Identyfikacja content gaps:
- Missing topics (powinien być content, ale nie ma)
- Competitor gaps (konkurencja ma, my nie)
- Search intent gaps (content jest, ale nie odpowiada na intent)
- Journey gaps (brakuje content dla某些 stages)

## Dostępne Tryby

- `full-site` - cała strona
- `products` - tylko produkt-related
- `service-pages` - tylko usługi
- `informational` - tylko content marketing

## Procedura

### 1. Page Intent Map Check

Sprawdź `docs/ssot/page-intent-map.md`:
- Jakie intenty są zdefiniowane?
- Które intenty mają content?
- Które intenty są uncovered?

### 2. Customer Journey Mapping

Zidentyfikuj journey stages:
- Awareness: "co to jest...", "jak wybrać..."
- Consideration: "porównanie...", "recenzje..."
- Decision: "kup teraz...", "cena..."
- Post-purchase: "jak dbać...", "naprawa..."

### 3. Topic Inventory

```bash
# Lista wszystkich stron
./run-wp.sh post list --post_type=page --posts_per_page=200 --fields=post_title,post_name,post_content
./run-wp.sh post list --post_type=post --posts_per_page=200 --fields=post_title,post_name

# Lista kategorii
./run-wp.sh term list product_cat
```

### 4. Gap Analysis

Dla każdego journey stage sprawdź:

#### Awareness (Top of Funnel)
- Czy są artykuły wyjaśniające produkty/usługi?
- Czy są poradniki ("jak wybrać...")?
- Czy są comparison pages?

#### Consideration (Middle of Funnel)
- Czy są case studies / portfolio?
- Czy są testimonials/reviews?
- Czy są education content o materiałach?

#### Decision (Bottom of Funnel)
- Czy są CTA na każdej stronie?
- Czy są trust elements?
- Czy pricing jest clear?

#### Post-Purchase
- Czy są care instructions?
- Czy są FAQs?
- Czy są information o naprawie/serwisie?

### 5. Generate Report

```markdown
## Content Gap Analysis - YYYY-MM-DD
Scope: full-site

### Page Intent Map Status
- page-intent-map.md: NEEDS_REVIEW

### Journey Coverage

| Stage | Coverage | Pages | Gaps |
|-------|----------|-------|------|
| Awareness | PARTIAL | 3 | Missing "jak dbać o biżuterię" |
| Consideration | GOOD | 8 | Missing material comparison |
| Decision | GOOD | 12 | - |
| Post-purchase | WEAK | 2 | Missing care guides |

### Top Content Gaps

| Topic | Intent | Priority | Existing Pages |
|-------|--------|----------|----------------|
| Pielęgnacja biżuterii | Awareness | HIGH | None |
| Złoto vs Srebro | Consideration | MEDIUM | None |
| ... | ... | ... | ... |

### Recommendations
1. [HIGH] Create "Jak dbać o biżuterię złotą" guide
2. [MEDIUM] Create "Złoto vs Srebro - porównanie" page
3. ...

### Action Items
- [ ] NEEDS_REVIEW: Update page-intent-map.md
- [ ] Create care guide for gold jewelry
- [ ] ...
```

## Content Types Template

| Type | Purpose | Example |
|------|---------|---------|
| Guide | Educational | "Jak wybrać pierścionek zaręczynowy" |
| FAQ | Quick answers | "Ile kosztuje naprawa?" |
| Comparison | Decision support | "Złoto 585 vs 750" |
| Service page | Service offering | "Pracownia złotnicza" |
| Blog post | Awareness | "Trendy w biżuterii 2026" |
| Product | Transaction | PDP (product detail page) |

## Zasady

- **User intent first** - focus na what users search for
- **Journey-based** - mapuj do customer journey
- **SSOT-backed** - use page-intent-map.md as template
- **Prioritized** - priorytetyzuj gaps by impact

## Powiązane

- `/map-site` - mapowanie struktury
- `/internal-linking` - jak content będzie linked
- `/service-page` - tworzenie service pages
- `/category` - category content strategy
