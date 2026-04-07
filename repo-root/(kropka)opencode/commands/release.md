---
name: /release
description: Release checklist - kompletna procedura przed wdrożeniem zmian
agent: chief-operator
subtask: true
when: Przed każdym release, przed wdrożeniem na produkcję
prerequisites:
  - Wszystkie zmiany są gotowe
  - Backup został wykonany
  - Smoke tests przeszły
---

# Release

## Cel

Kompletna procedura release przed wdrożeniem:
- Weryfikacja completeness
- Backup verification
- Smoke tests
- Performance check
- Documentation update
- Communication plan

## Pre-Release Checklist

### 1. Change Verification
- [ ] Wszystkie planned changes są implemented
- [ ] Kod jest w git/backup
- [ ] Testowano na staging/local

### 2. SSOT Update (jeśli dotyczy)
- [ ] Zaktualizowano docs/ssot/ jeśli są nowe dane
- [ ] Status ustawiony na CURRENT
- [ ] Timestamp dodany

### 3. Policies Update (jeśli dotyczy)
- [ ] Zaktualizowano docs/policies/ jeśli są nowe reguły
- [ ] Timestamp dodany

### 4. Backup
- [ ] Backup bazy danych
- [ ] Backup plików (wp-content)
- [ ] Backup wersji przed zmianami

```bash
# Database backup
./run-sql.sh "mysqldump local > backup-$(date +%Y%m%d-%H%M%S).sql"

# Files backup
cp -r app/public/wp-content/themes/bigdiamond-prestige wp-content-backup/
```

### 5. Smoke Tests
- [ ] Uruchom `/smoke` - wszystkie tests PASS

### 6. Performance Check
- [ ] Uruchom `/perf` - metryki w budget

### 7. Truth Check
- [ ] Uruchom `/truth-check` - no critical violations

### 8. Documentation
- [ ] CHANGELOG.md updated (jeśli istnieje)
- [ ] README.md updated (jeśli dotyczy)
- [ ] Nowe pliki dodane do repo/inventor

## Release Execution

### 1. Deploy Changes

Method A - Git (jeśli używany):
```bash
git pull origin main
```

Method B - Manual:
```bash
# Copy changed files to production
rsync -avz --exclude='node_modules' theme/* production:/path/to/theme/
```

### 2. Clear Cache (jeśli dotyczy)
```bash
# WooCommerce cache
./run-wp.sh wc tool run clear_transients

# Object cache (Redis)
# redis-cli FLUSHDB

# CDN cache (jeśli używany)
# Purge CloudFlare/etc
```

### 3. Verify Deployment
```bash
./run-wp.sh --version
grep "VERSION" app/public/wp-content/themes/bigdiamond-prestige/style.css
```

## Post-Release

### 1. Smoke Tests (production)
- [ ] `/smoke` na produkcji

### 2. Monitor
- [ ] Uruchom `/observe`

### 3. Rollback Plan
Jeśli coś pójdzie nie tak:
```bash
# Przywróć z backup
./run-sql.sh "DROP DATABASE local; CREATE DATABASE local;"
mysql -u root -p local < backup-YYYYMMDD-HHMMSS.sql
```

## Generate Report

```markdown
## Release Report - YYYY-MM-DD

### Changes
- Feature A: inc/homepage.php - changed X
- Feature B: assets/css/homepage.css - added Y

### Pre-Release Checklist
- [x] Backup: DONE
- [x] Smoke tests: PASS
- [x] Performance: PASS
- [x] Truth check: PASS (1 warning)

### Deployment
- Method: git pull
- Time: 14:30-14:35
- Status: SUCCESS

### Post-Release
- Smoke tests: PASS
- Performance: 2.1s LCP (within budget)

### Rollback Plan
- Backup location: /backups/...
- Rollback command: ...

### Sign-off
- Release approved by: [name]
- Time: 14:40
```

## Zasady

- **Never skip checklist** - nawet dla "małych" zmian
- **Backup first** - zawsze backup przed zmianami
- **Smoke tests mandatory** - nie release bez smoke tests
- **Document everything** - wszystko musi być udokumentowane

## Powiązane

- `/smoke` - smoke tests
- `/perf` - performance check
- `/observe` - monitoring po release
- `/rollback` - procedure awaryjna
