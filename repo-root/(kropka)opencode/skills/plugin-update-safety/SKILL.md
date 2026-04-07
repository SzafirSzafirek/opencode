---
name: plugin-update-safety
description: Bezpieczna aktualizacja pluginów - procedury i rollback
---

# Plugin Update Safety

## Przed aktualizacją

1. Sprawdź changelog
2. Przeczytaj reviews
3. Przetestuj na staging jeśli możliwe
4. Zrób backup

## Procedura aktualizacji

```bash
# Backup przed
./run-sql.sh "mysqldump local > plugin-backup-$(date +%Y%m%d).sql"

# Aktualizacja
./run-wp.sh plugin update <plugin-name>

# Weryfikacja
./run-wp.sh plugin list --status=active
```

## Po aktualizacji

1. Uruchom smoke tests
2. Sprawdź czy strona działa
3. Sprawdź logi błędów

## Rollback

```bash
# Przywróć wtyczkę
./run-wp.sh plugin deactivate <plugin>
./run-wp.sh plugin activate <plugin>

# Pełny rollback DB
mysql -u root -proot local < plugin-backup-YYYYMMDD.sql
```

## Wymagane pluginy

Wg `docs/db-audit/2026-03-24/01-runtime-inventory.md`:
- woocommerce (active)
- imoje (active)
- seo-by-rank-math (active)
- bigdiamond-image-seo-ai (inactive ale required)
