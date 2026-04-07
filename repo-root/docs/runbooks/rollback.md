# Rollback

## Cel
Przywrócenie do ostatniego stabilnego stanu.

## Input
- Dostęp do backup
- Wiedza co zostało zmienione

## Scenariusze

### A: Mała zmiana (CSS/JS only)
Files rollback - bez DB impact.

### B: Średnia zmiana (PHP, nowe funkcje)
Files + opcjonalnie DB rollback.

### C: Krytyczny (Produkcja, Bezpieczeństwo)
Full rollback + escalation.

## Procedura

### 1. Assessment
Szybka ocena:
- Co jest problemem?
- Jak kritičny?
- Ilu użytkowników affected?
- Czy to bezpieczeństwo/dane?

### 2. Decision Matrix
| Scenario | Action |
|----------|--------|
| A (CSS/JS) | Rollback files only |
| B (PHP/features) | Rollback + DB if needed |
| C (Critical) | Full rollback + escalation |

### 3. Execution

**Scenario A:**
```bash
cp -r wp-content-backup/bigdiamond-prestige-YYYYMMDD/* app/public/wp-content/themes/bigdiamond-prestige/
./run-wp.sh wc tool run clear_transients
```

**Scenario B:**
```bash
./run-sql.sh "mysqldump local > emergency-backup-$(date +%Y%m%d-%H%M%S).sql"
cp -r wp-content-backup/bigdiamond-prestige-YYYYMMDD/* app/public/wp-content/themes/bigdiamond-prestige/
mysql local < backup-YYYYMMDD-HHMMSS.sql
```

**Scenario C:**
```bash
./run-sql.sh "mysqldump local > emergency-$(date +%Y%m%d-%H%M%S).sql"
cp -r app/public/wp-content wp-content-emergency/
cp -r wp-content-backup/full-backup-YYYYMMDD/* app/public/
mysql local < backup-YYYYMMDD-HHMMSS.sql
./run-wp.sh wc tool run clear_transients
```

### 4. Verification
```bash
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/
./run-wp.sh post list --post_type=product --posts_per_page=5
```

## Blocker
- Brak backup
- Approval wymagany dla Scenario C

## Rollback
Rollback jest already the rollback procedure. Jeśli chcesz przywrócić do wcześniejszego stanu, użyj poprzedniego backup.
