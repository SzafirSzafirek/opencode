# Runtime Inventory

**Data audytu:** 30 marca 2026  
**Srodowisko:** Local staging copy BigDIAMOND  
**Tryb:** read-only  
**Baza danych:** `local`  
**Prefiks tabel:** `ab12CD34_`

## Runtime Source of Truth

- Konfiguracja WordPress: `app/public/wp-config.php`
- SQL transport: `run-sql.sh`
- WP-CLI transport: `run-wp.sh`
- Baseline do porownania: `docs/db-audit/2026-03-24/10-execution-report.md`

## Aktywne komponenty runtime

### Aktywne pluginy

- `imoje` 4.15.1
- `inpost-for-woocommerce` 1.8.4
- `seo-by-rank-math` 1.0.265
- `woocommerce` 10.3.8

### MU-plugin i drop-in

- `automation-by-installatron` (must-use)
- `advanced-cache.php` (drop-in)

## Snapshot bazy

### Metryki ogolne

| Metryka | Wartosc |
| :--- | ---: |
| Liczba tabel | 60 |
| Rozmiar bazy | 220.97 MB |
| Liczba opcji (`ab12CD34_options`) | 1317 |
| Liczba opcji autoload-like (`yes`/`on`/`auto`) | 950 |
| Rozmiar autoload-like | 0.25 MB |
| Liczba wpisow `postmeta` | 293687 |
| Liczba wpisow `posts` | 31924 |
| Liczba uzytkownikow | 109 |
| Liczba zamowien HPOS (`ab12CD34_wc_orders`) | 158 |
| Liczba transientow w `options` | 95 |

### Kluczowe typy postow

| Typ | Liczba |
| :--- | ---: |
| `attachment` | 25652 |
| `product` | 5637 |
| `shop_order` | 125 |
| `product_variation` | 112 |
| `shop_coupon` | 1 |

### Najwieksze tabele

| Tabela | Rozmiar |
| :--- | ---: |
| `ab12CD34_postmeta` | 148.28 MB |
| `ab12CD34_posts` | 39.67 MB |
| `ab12CD34_wc_product_attributes_lookup` | 10.06 MB |
| `ab12CD34_term_relationships` | 6.03 MB |
| `ab12CD34_rank_math_analytics_objects` | 3.03 MB |
| `ab12CD34_wc_product_meta_lookup` | 2.86 MB |
| `ab12CD34_options` | 2.63 MB |
| `ab12CD34_wc_orders_meta` | 2.02 MB |

## Walidacje wykonane

### Integralnosc relacyjna

| Test | Wynik |
| :--- | ---: |
| `postmeta_without_post` | 0 |
| `term_relationships_without_object` | 0 |
| `commentmeta_without_comment` | 0 |
| `usermeta_without_user` | 0 |

### Cron runtime

Aktywne hooki w `wp-cron` obejmuja przede wszystkim WooCommerce, Rank Math i core WordPress. Dwa hooki `jetpack_*` nadal istnieja mimo braku aktywnego pluginu Jetpack:

- `jetpack_clean_nonces`
- `jetpack_v2_heartbeat`

### Action Scheduler

Podsumowanie grup:

| Status | Liczba | Grupa |
| :--- | ---: | :--- |
| `complete` | 29 | `woocommerce` |
| `complete` | 3 | `count` |
| `complete` | 3 | `(none)` |
| `complete` | 3 | `ActionScheduler` |
| `failed` | 9 | `gla` |
| `failed` | 3 | `wp_mail_smtp` |
| `pending` | 8 | `woocommerce` |
| `pending` | 3 | `gla` |
| `pending` | 2 | `wp_mail_smtp` |
| `pending` | 1 | `rank-math` |
| `pending` | 1 | `count` |
| `pending` | 1 | `(none)` |
| `pending` | 1 | `ActionScheduler` |

### Fizyczna spojnosc tabel

`wp db check` nie nadaje sie do tego srodowiska, bo probuje laczyc sie przez zly socket (`/tmp/mysql.sock`). Zamiast tego uruchomiono bezposrednio:

```bash
"/Users/jakub/Library/Application Support/Local/lightning-services/mysql-8.0.35+4/bin/darwin-arm64/bin/mysqlcheck" \
  --socket="/Users/jakub/Library/Application Support/Local/run/78YSqlpK-/mysql/mysqld.sock" \
  -u root -proot local
```

Wynik: wszystkie 60 tabel zwrocily status `OK`.
