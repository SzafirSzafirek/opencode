---
name: /truth-check
description: Sprawdzenie spójności treści z SSOT - claims, NAP, product data, policies
agent: truth-policy-guard
subtask: true
when: Przed release, po zmianach w treści, przy audycie content quality
prerequisites:
  - Dostęp do SSOT files w docs/ssot/
  - Dostęp do policies w docs/policies/
  - Znajomość content structure
---

# Truth Check

## Cel

Kompleksowe sprawdzenie spójności treści z SSOT files:
- NAP consistency
- Claims validation (claims-matrix)
- Product data consistency
- Policy compliance

## Procedura

### 1. Wybierz Scope

Dostępne scopes:
- `full-site` - wszystkie strony
- `homepage` - tylko homepage
- `products` - tylko produkty
- `service-pages` - tylko service pages
- `faq` - tylko FAQ
- `nap` - tylko NAP
- `merchant` - tylko merchant data

### 2. SSOT Inventory Check

Sprawdź które SSOT files istnieją:
```bash
ls -la docs/ssot/
```

Status matrix:
| SSOT File | Status | Last Verified |
|-----------|--------|---------------|
| nap.md | NEEDS_REVIEW | - |
| merchant-data.md | CURRENT | 2026-04-07 |
| ... | ... | ... |

### 3. Scope-Specific Checks

#### Homepage
- Czy hero copy pochodzi z SSOT?
- Czy trust band claims są dozwolone (claims-matrix)?
- Czy CTA links są poprawne?

#### Products
- Czy product descriptions są zgodne z product-attributes.md?
- Czy materials/stones są zgodne z materials-stones.md?
- Czy claims (np. "highest quality") są dozwolone?

#### Service Pages
- Czy service descriptions są zgodne z service-catalog.md?
- Czy pricing info jest zgodny z SSOT?
- Czy FAQ są zgodne z faq-source.md?

#### NAP
- Uruchom `/nap-sync --check`

#### Merchant Data
- Uruchom `/merchant-data --audit`

### 4. Claims Matrix Check

Sprawdź każdy claim w tekście przeciw `docs/policies/claims-matrix.md`:
- ALLOWED - może być użyty
- FORBIDDEN - nie może być użyty
- NEEDS_REVIEW - wymaga weryfikacji

### 5. Generate Report

```markdown
## Truth Check Report - YYYY-MM-DD
Scope: <scope>

### SSOT Status
| File | Status |
|------|--------|
| nap.md | NEEDS_REVIEW |
| ... | ... |

### Claims Findings
| Page | Claim | Status | Notes |
|------|-------|--------|-------|
| homepage | "najwyższa jakość" | FORBIDDEN | Use specific quality claim |
| ... | ... | ... | ... |

### Action Items
- [ ] Update nap.md with verified NAP data
- [ ] Remove forbidden claim from homepage
- [ ] ...
```

## Zasady

- **Evidence-based** - wszystko poparte evidence z SSOT
- **Mark unknown** - oznacz jako NEEDS_REVIEW
- **No assumptions** - nie zakładaj że coś jest poprawne bez weryfikacji
- **Consistency first** - sprawdź consistency przed changes

## Powiązane

- `/faq-truth` - FAQ-specific check
- `/nap-sync` - NAP-specific check
- `/merchant-data` - merchant data check
- `/policy-sync` - policy sync
