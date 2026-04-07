---
name: /rollback
description: Rollback procedure - przywrócenie do ostatniego stabilnego stanu
agent: reliability-guard
subtask: true
when: Gdy coś pójdzie nie tak po release, przy krytycznym błędzie
prerequisites:
  - Dostęp do backup
  - Znajomość co zostało zmienione
  - Chief-operator approval (dla krytycznych rollbacków)
---

# Rollback

## Cel

Przywrócenie do ostatniego stabilnego stanu:
- Przywrócenie bazy danych
- Przywrócenie plików
- Weryfikacja przywrócenia
- Dokumentacja incidentu

## Ważne

**Rollback to ostatnia opcja** - najpierw spróbuj naprawić problem jeśli to możliwe.

**Approval wymagany** dla krytycznych rollbacków (produkcja, dane klientów).

## Scenariusze Rollback

### Scenario A: Mała zmiana (CSS/JS)
- Szybki rollback plików
- Bez impact na DB
- Możliwe bez approval

### Scenario B: Średnia zmiana (PHP, nowe funkcje)
- Rollback plików
- Rollback DB (jeśli DB zmiany)
- Wymaga documentation

### Scenario C: Krytyczny (Produkcja, Bezpieczeństwo)
- Natychmiastowy rollback
- Chief-operator approval
- Full incident report
- Stakeholder notification

## Procedura

### 1. Assessment

Szybka ocena:
- Co jest problemem?
- Jak kritičny jest problem?
- Ile użytkowników jest affected?
- Czy to jest bezpieczeństwo/dane?

### 2. Decision

| Scenario | Action |
|----------|--------|
| A (CSS/JS) | Rollback files only |
| B (PHP/features) | Rollback + DB if needed |
| C (Critical) | Full rollback + escalation |

### 3. Execution

#### Scenario A: Files Only

```bash
# Znajdź poprzednią wersję
ls -la wp-content-backup/

# Przywróć
cp -r wp-content-backup/bigdiamond-prestige-YYYYMMDD/* app/public/wp-content/themes/bigdiamond-prestige/

# Wyczyść cache
./run-wp.sh wc tool run clear_transients
```

#### Scenario B: Files + DB

```bash
# Backup obecnego stanu (przed rollback)
./run-sql.sh "mysqldump local > emergency-backup-$(date +%Y%m%d-%H%M%S).sql"

# Przywróć pliki
cp -r wp-content-backup/bigdiamond-prestige-YYYYMMDD/* app/public/wp-content/themes/bigdiamond-prestige/

# Przywróć DB
mysql -u root -proot local < backup-YYYYMMDD-HHMMSS.sql
```

#### Scenario C: Full Emergency

```bash
# Backup everything
./run-sql.sh "mysqldump local > emergency-$(date +%Y%m%d-%H%M%S).sql"
cp -r app/public/wp-content wp-content-emergency/

# Full restore
cp -r wp-content-backup/full-backup-YYYYMMDD/* app/public/

# DB restore
mysql -u root -proot local < backup-YYYYMMDD-HHMMSS.sql

# Clear all caches
./run-wp.sh wc tool run clear_transients
redis-cli FLUSHDB 2>/dev/null || true
```

### 4. Verification

Po rollback sprawdź:
- [ ] Strona ładuje się poprawnie
- [ ] Wszystkie strony działają
- [ ] Formularze działają
- [ ] E-commerce flow działa
- [ ] Brak PHP errors

```bash
./run-wp.sh post list --post_type=product --posts_per_page=5
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/
```

### 5. Generate Report

```markdown
## Rollback Report - YYYY-MM-DD HH:MM

### Incident
- Problem: [opis]
- Severity: CRITICAL / HIGH / MEDIUM / LOW
- Affected users: [number/estimate]
- Discovery time: HH:MM
- Rollback start: HH:MM
- Rollback complete: HH:MM
- Total downtime: X minutes

### Root Cause
[Initial analysis - co było przyczyną]

### Resolution
- Action: FULL ROLLBACK / PARTIAL ROLLBACK / HOTFIX
- Scope: All / Files only / DB only / Specific component

### Changes Rolled Back
- inc/homepage.php - reverted to YYYYMMDD version
- assets/css/homepage.css - reverted
- [DB migration] - reverted

### Post-Rollback Verification
- [x] Homepage loads
- [x] Products accessible
- [x] Cart works
- [x] No PHP errors

### Lessons Learned
[Co można zrobić inaczej aby uniknąć w przyszłości]

### Next Steps
- [ ] Investigate root cause
- [ ] Fix issue properly
- [ ] Test on staging before next release
- [ ] Update release process if needed

### Approval
- Rollback initiated by: [name]
- Approval (for critical): [chief-operator name]
```

## Zasady

- **Backup before rollback** - zawsze backup przed rollback
- **Speed over completeness** - szybki rollback > perfect rollback
- **Document everything** - wszystko musi być udokumentowane
- **Communicate** - informuj stakeholders
- **No shame in rollback** - rollback jest OK, problem jest gdy się go nie robi

## Rollback Triggers

Kiedy NIEZWŁOCZNIE rollback:
- [ ] Strona nie ładuje się (500 error)
- [ ] E-commerce nie działa (can't checkout)
- [ ] Dane klientów są exposed
- [ ] Bezpieczeństwo compromised
- [ ] Mass 404 errors
- [ ] Performance degraded > 50%

## Powiązane

- `/release` - release procedure
- `/smoke` - verification after rollback
- `/observe` - monitoring after rollback
- `/baseline` - przywrócenie do baseline (jeśli available)
