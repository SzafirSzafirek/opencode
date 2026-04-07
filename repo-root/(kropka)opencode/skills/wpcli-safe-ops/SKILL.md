---
name: wpcli-safe-ops
description: Bezpieczne operacje WP-CLI - jak unikać katastrof przy masowych operacjach
---

# WP-CLI Safe Ops

## Zasady

1. Zawsze backup przed operacją
2. Używaj `--dry-run` gdzie możliwe
3. Operacje_chunkowane (nie wszystko na raz)
4. Loguj wszystko

## Podstawowe polecenia

```bash
# Backup bazy
./run-sql.sh "mysqldump local > backup-$(date +%Y%m%d).sql"

# Lista produktów
./run-wp.sh post list --post_type=product --posts_per_page=5

# Aktualizacja posta
./run-wp.sh post update <ID> --post_title="Nowy tytuł"

# Term operations
./run-wp.sh term list product_cat
```

## Unikanie katastrof

- Nigdy nie używaj `wp db export` bez backup
- Masowe delete: zawsze z `--post_type` i limit
- Sprawdź co kasujesz z `--dry-run` przed

## Walidacja

```bash
# Sprawdź syntax
php -l <file>.php

# PHPCS
composer run phpcs
```
