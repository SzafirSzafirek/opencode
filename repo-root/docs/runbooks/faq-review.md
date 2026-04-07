# FAQ Review

## Cel
Walidacja FAQ na stronie przeciw SSOT i policy.

## Input
- URL strony z FAQ
- Dostęp do `docs/ssot/faq-source.md`
- Dostęp do `docs/policies/faq-validation.md`

## Procedura

### 1. SSOT Check
Sprawdź `docs/ssot/faq-source.md`:
- Status: CURRENT / NEEDS_REVIEW / MISSING
- Lista approved FAQ items

### 2. Policy Check
Sprawdź `docs/policies/faq-validation.md`:
- Format requirements
- Forbidden claims
- Minimum answer length

### 3. Page FAQ Extraction
```bash
./run-wp.sh post list --post_type=page --posts_per_page=50 --fields=post_title,post_content
```
Lub znajdź FAQ blocks w theme:
```bash
grep -r "faq\|accordion" app/public/wp-content/themes/bigdiamond-prestige/inc/ --include="*.php"
```

### 4. Comparison Matrix
| FAQ Item | SSOT Status | Policy Status | Action |
|----------|-------------|---------------|--------|
| Pytanie 1 | CURRENT | OK | - |
| Pytanie 2 | MISSING | OK | Add to SSOT |
| Pytanie 3 | CURRENT | FAIL | Fix answer |

## Output
Report z:
- SSOT status
- Findings per page
- Action items

## Blocker
- FAQ source missing w SSOT
- Forbidden claims found
- SSOT marked NEEDS_REVIEW

## Rollback
Not applicable - read-only audit. Dla zmian użyj `/faq-truth` command.
