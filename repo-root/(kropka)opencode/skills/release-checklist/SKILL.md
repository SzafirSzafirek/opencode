---
name: release-checklist
description: Release checklist - kompletna procedura przed wdrożeniem
---

# Release Checklist

## Przed release

### 1. Zmiany zweryfikowane
- Wszystkie planned changes implemented
- Kod gotowy
- Testowane na staging

### 2. Backup
- [ ] Backup bazy danych
- [ ] Backup plików
- [ ] Wersja przed zmianami

```bash
./run-sql.sh "mysqldump local > backup-$(date +%Y%m%d-%H%M%S).sql"
```

### 3. SSOT i Policies
- [ ] Zaktualizowane jeśli dotyczy
- [ ] Status: CURRENT
- [ ] Timestamp

### 4. Smoke tests
- [ ] `/smoke` - wszystkie PASS

### 5. Performance
- [ ] `/perf` - metryki w budget

### 6. Truth check
- [ ] `/truth-check` - no critical violations

## Deployment

1. Deploy changes
2. Clear cache
3. Verify deployment

## Po release

1. Smoke tests na produkcji
2. Monitor `/observe`

## Rollback plan

```bash
mysql -u root -proot local < backup-YYYYMMDD-HHMMSS.sql
```
