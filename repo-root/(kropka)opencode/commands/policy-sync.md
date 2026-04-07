---
name: /policy-sync
description: Synchronizacja policies - claims-matrix, ecommerce-copy, schema-publication, etc.
agent: truth-policy-guard
subtask: true
when: Przy zmianach w policies, przed release, przy audycie compliance
prerequisites:
  - Dostęp do docs/policies/
  - Znajomość content structure
---

# Policy Sync

## Cel

Synchronizacja i weryfikacja policies:
- claims-matrix.md - dozwolone/niedozwolone claims
- faq-validation.md - reguły FAQ
- ecommerce-copy-boundaries.md - granice copy e-commerce
- schema-publication-policy.md - polityka schema
- merchant-sync-policy.md - synchronizacja merchant
- local-seo-consistency-policy.md - local SEO consistency

## Procedura

### 1. Policy Files Check

Sprawdź które policies istnieją i jaki mają status:

```bash
ls -la docs/policies/
```

| Policy | Status | Last Verified |
|--------|--------|--------------|
| claims-matrix.md | NEEDS_REVIEW | - |
| faq-validation.md | CURRENT | 2026-04-07 |
| ... | ... | ... |

### 2. Content Audit Against Policies

#### Claims Matrix Check

Przeskanuj treść pod kątem forbidden claims:
```bash
grep -r "najlepszy\|najwyższy\|gwarantowany\|100%" app/public/wp-content/ --include="*.php" --include="*.html" 2>/dev/null | grep -v vendor
```

#### Ecommerce Copy Boundaries

Sprawdź czy copy stosuje się do boundaries:
- Czy są unsubstantiated superlatives?
- Czy są fear-based claims?
- Czy są fake urgency claims?

#### Schema Publication Policy

Sprawdź czy schema publication followuje policy:
- Czy wymagane schema types są obecne?
- Czy forbidden fields nie są używane?
- Czy publication frequency jest zgodna?

### 3. Generate Report

```markdown
## Policy Sync Report - YYYY-MM-DD

### Policies Status
| Policy | Status | Last Verified |
|--------|--------|--------------|
| claims-matrix.md | NEEDS_REVIEW | - |
| faq-validation.md | CURRENT | 2026-04-07 |
| ... | ... | ... |

### Findings

#### Claims Matrix Violations
| Page | Claim | Policy | Action |
|------|-------|--------|--------|
| homepage | "najlepsza jakość" | FORBIDDEN | Remove or substantiate |
| product/... | "gwarantowany efekt" | FORBIDDEN | Remove |

#### FAQ Validation
| Page | Issue | Policy Rule |
|------|-------|-------------|
| service-page | FAQ too short | Min 2 sentences per answer |

### Action Items
- [ ] NEEDS_REVIEW: Update claims-matrix.md with verified claims
- [ ] Remove "najlepsza jakość" from homepage
```

## Zasady

- **Policies are constraints** - policies ograniczają co może być opublikowane
- **Evidence-based** - wszystko musi być poparte evidence
- **Mark violations** - dokumentuj każde naruszenie
- **Fix or document** - napraw lub udokumentuj why not fixed

## Powiązane

- `/truth-check` - general truth check
- `/faq-truth` - FAQ-specific validation
- `/merchant-data` - merchant policy compliance
- `/schema` - schema policy compliance
