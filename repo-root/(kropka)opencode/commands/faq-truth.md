---
name: /faq-truth
description: Walidacja FAQ przeciw faq-source.md i faq-validation.md policies
agent: truth-policy-guard
subtask: true
when: Przy zmianach w FAQ, przed release, przy audycie treści
prerequisites:
  - Dostęp do docs/ssot/faq-source.md
  - Dostęp do docs/policies/faq-validation.md
  - Znajomość page structure (service pages, editorial pages)
---

# FAQ Truth

## Cel

Walidacja FAQ questions i answers przeciw:
1. SSOT (`docs/ssot/faq-source.md`) - source of truth
2. Policy (`docs/policies/faq-validation.md`) - validation rules

## Procedura

### 1. Sprawdź SSOT Status

Sprawdź czy `docs/ssot/faq-source.md` istnieje i jaki ma status:
- CURRENT - zweryfikowane
- NEEDS_REVIEW - wymaga weryfikacji
- MISSING - plik nie istnieje

### 2. Pobierz FAQ z Strony

```bash
./run-wp.sh post list --post_type=page --posts_per_page=50 --fields=post_title,post_content
```

Lub użyj grep do znalezienia FAQ blocks:
```bash
grep -r "faq" app/public/wp-content/themes/bigdiamond-prestige/inc/ --include="*.php"
grep -r "accordion" app/public/wp-content/themes/bigdiamond-prestige/inc/ --include="*.php"
```

### 3. Porównaj z SSOT

Dla każdego FAQ item:
- Question - czy jest zgodny z SSOT?
- Answer - czy jest zgodny z SSOT?
- Status - CURRENT / NEEDS_UPDATE / MISSING_IN_SSOT

### 4. Waliduj Przeciw Policy

Wg `docs/policies/faq-validation.md`:
- Czy format jest poprawny?
- Czy nie ma forbidden claims?
- Czy odpowiedzi są wystarczająco szczegółowe?

### 5. Generuj Report

```markdown
## FAQ Truth Report - YYYY-MM-DD

### SSOT Status
- faq-source.md: NEEDS_REVIEW (nie istnieje lub nie zweryfikowane)

### Findings

| Page | FAQ Item | SSOT Status | Policy Status | Action |
|------|----------|-------------|---------------|--------|
| pracownia-zlotnicza | "Ile kosztuje..." | MISSING_IN_SSOT | OK | Add to SSOT |
| ... | ... | ... | ... | ... |

### Action Items
- [ ] NEEDS_REVIEW: faq-source.md wymaga aktualizacji
- [ ] ...
```

## Zasady

- **SSOT first** - SSOT jest source of truth
- **Policy compliance** - sprawdź przeciw faq-validation.md
- **Mark unknown** - oznacz jako NEEDS_REVIEW jeśli nie możesz zweryfikować
- **No hallucinations** - nie dodawaj FAQ których nie ma w SSOT

## Powiązane

- `/truth-check` - ogólna walidacja treści
- `/policy-sync` - synchronizacja policies
- `/service-page` - FAQ jest część service pages
