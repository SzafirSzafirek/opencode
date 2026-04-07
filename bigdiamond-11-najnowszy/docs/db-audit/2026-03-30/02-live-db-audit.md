# Szczegolowy audyt bazy po czyszczeniu

**Data:** 30 marca 2026  
**Zakres:** tylko lokalna baza `local`  
**Tryb:** read-only  
**Baseline:** `docs/db-audit/2026-03-24/10-execution-report.md`

## Executive summary

Stan po cleanupie jest ogolnie dobry. Baza ma **60 tabel** i zajmuje **220.97 MB**, wszystkie tabele przeszly fizyczna walidacje `mysqlcheck`, a podstawowe relacje WordPress/WooCommerce nie maja osieroconych rekordow. Nie widac osobnych tabel po wiekszosci nieaktywnych pluginow wskazanych w baseline z 24 marca 2026.

Najwazniejsze odchylenia po cleanupie nie sa juz tabelami, tylko pozostalosciami w runtime i w core tables:

- dwa hooki `jetpack_*` nadal siedza w `wp-cron`, mimo braku aktywnego Jetpacka,
- Action Scheduler nadal przetwarza lub retry-uje akcje po `google-listings-and-ads` i `wp-mail-smtp`,
- w `options` zostaly pojedyncze autoloadowane wpisy po nieaktywnych pluginach,
- w `postmeta` nadal sa niewielkie slady po `google-listings-and-ads`, `compressx`, `litespeed`, `wp-smush`, `forminator` i pojedyncze slady po Elementorze.

To nie wyglada na awarie ani na uszkodzenie danych, ale jest to nadal **niedoczyszczone residue**, ktore warto zamknac osobna decyzja cleanupowa.

## Pass

- Runtime potwierdzony: baza `local`, prefiks `ab12CD34_`, aktywne pluginy tylko `imoje`, `inpost-for-woocommerce`, `seo-by-rank-math`, `woocommerce`.
- Po cleanupie zostalo dokladnie **60 tabel**, czyli tyle samo co w baseline po sprzataniu.
- Rozmiar bazy wynosi **220.97 MB**, co jest zgodne z oczekiwanym poziomem po redukcji z ~414 MB netto opisanej w baseline.
- Wszystkie tabele przeszly fizyczny check przez `mysqlcheck` po poprawnym sockecie Local.
- Orphan checks dla `postmeta`, `term_relationships`, `commentmeta` i `usermeta` zwrocily `0`.
- Nie ma osobnych tabel po dawnych systemach import/export, MailerLite, Yoast SEO, Media Cleaner, EWWW, LiteSpeed ani innych ciezkich leftoverach wskazanych 24 marca 2026.
- Core i aktywny stos WooCommerce/Rank Math wygladaja spojnie: `wc_*`, `woocommerce_*`, `rank_math_*`, `actionscheduler_*` i tabele WordPress core sa obecne i zdrowe.

## Warnings

### 1. WP-Cron ma live leftovers po Jetpacku

W `wp-cron` nadal sa aktywne:

- `jetpack_clean_nonces`
- `jetpack_v2_heartbeat`

Jetpack nie jest aktywnym pluginem runtime, wiec to jest **pozostalosc aktywna w runtime**. Ryzyko jest srednie: samo istnienie hooka nie musi psuc frontu, ale oznacza niepelny cleanup i mozliwe puste przebiegi podczas crona.

### 2. Action Scheduler nadal ma pending/failed jobs po nieaktywnych pluginach

Najistotniejsze leftovery:

- `google-listings-and-ads`: **9 failed + 3 pending**
- `wp-mail-smtp`: **3 failed + 2 pending**

To jest **pozostalosc aktywna w runtime** oraz zarazem **potencjalne ryzyko funkcjonalne**. Te wpisy nie powinny dalej zyc, jesli pluginy pozostaja nieaktywne, bo zaciemniaja stan schedulera i utrudniaja diagnoze realnych problemow WooCommerce.

### 3. W `options` zostaly autoloadowane wpisy po nieaktywnych pluginach

Najbardziej czytelne przyklady:

- `woocommerce_mailerlite_settings`
- `_elementor_local_google_fonts`
- `_transient_jetpack_autoloader_plugin_paths`
- `jetpack_options`
- `yoast_migrations_free`
- `widget_elementor-library`
- `widget_wpforms-widget`

To jest **pozostalosc pasywna**. Rozmiar jest maly, ale zgodnie z zalozeniem audytu kazdy slad po nieaktywnych pluginach zostal oznaczony jako ryzyko do recznej decyzji.

### 4. W `postmeta` zostaly slady po nieaktywnych pluginach

Najwieksze grupy:

- `_wc_gla_*` po `google-listings-and-ads`: **27784 wiersze / 0.45 MB**
- `compressx_image_meta`: **64 wiersze / 0.14 MB**
- `wp-smush-*`: **254 wiersze / 0.07 MB**
- `litespeed-*`: **695 wierszy / 0.06 MB**
- `forminator_*`: **8 wierszy / 0.05 MB**
- pojedyncze klucze po Elementorze

To sa glownie **pozostalosc pasywna**, ale warto je wyciac, jesli te pluginy nie wroca do runtime.

## Cleanup candidates

Pelna lista zostala zapisana w `03-cleanup-candidates.csv`. Najwazniejsze grupy:

| Typ | Owner | Dowod live | Klasyfikacja | Ryzyko |
| :--- | :--- | :--- | :--- | :--- |
| `cron` | `jetpack` | 2 hooki `jetpack_*` w `wp-cron` | pozostalosc aktywna w runtime | medium |
| `action` | `google-listings-and-ads` | 12 akcji (`9 failed`, `3 pending`) | pozostalosc aktywna w runtime | medium |
| `action` | `wp-mail-smtp` | 5 akcji (`3 failed`, `2 pending`) | pozostalosc aktywna w runtime | medium |
| `option` | `woo-mailerlite` | `woocommerce_mailerlite_settings` autoload `on` | pozostalosc pasywna | low |
| `option` | `jetpack` | `jetpack_options`, `_transient_jetpack_autoloader_plugin_paths`, `woocommerce_setup_jetpack_opted_in` | pozostalosc pasywna | low |
| `option` | `elementor` | 8 autoload-like wpisow, najwiekszy `_elementor_local_google_fonts` | pozostalosc pasywna | low |
| `option` | `yoast` | `yoast_migrations_free` | pozostalosc pasywna | low |
| `option` | `wpforms` | `widget_wpforms-widget` | pozostalosc pasywna | low |
| `postmeta` | `google-listings-and-ads` | rodzina `_wc_gla_*`, 27784 wiersze | pozostalosc pasywna | low |
| `postmeta` | `compressx` | `compressx_image_meta`, 64 wiersze | pozostalosc pasywna | low |
| `postmeta` | `wp-smush` | `wp-smush-optimization-errors`, `wp-smush-lossy`, `wp-smush-animated` | pozostalosc pasywna | low |
| `postmeta` | `litespeed` | `litespeed-optimize-*`, `litespeed_vpi_*` | pozostalosc pasywna | low |
| `postmeta` | `forminator` | `forminator_form_meta`, `forminator_addon_mailerlite_*` | pozostalosc pasywna | low |

## Drift vs baseline (24 marca 2026)

### Wyglada na naturalny drift runtime

- Rozmiar bazy: **220.97 MB** vs raportowane ~219 MB netto po cleanupie. To miesci sie w normalnym dryfcie po kilku dniach pracy runtime.
- Liczba tabel: nadal **60**, czyli bez regresji.
- Liczba opcji: **1317** vs **1278** po cleanupie. Przyrost o 39 wyglada normalnie dla transientow, schedulerow i biezacej pracy WooCommerce.
- Zamowienia HPOS nadal sa obecne (**158**) i zgodne z baseline.

### Wyglada na niedoczyszczone residue albo residue, ktore nadal odzywa

- Hooki `jetpack_*` w `wp-cron`.
- Pending/failed jobs po `google-listings-and-ads`.
- Pending/failed jobs po `wp-mail-smtp`.
- Autoloadowane opcje po Jetpacku, Elementorze, Yoast SEO, WPForms i MailerLite.
- Rodzina `_wc_gla_*` oraz mniejsze meta-key leftovers po nieaktywnych pluginach.

### Uwaga metodologiczna

Baseline z 24 marca miesza dane z raportu opisowego i z `information_schema`, a `table_rows` dla InnoDB jest tylko estymacja. Dlatego obecny audyt rozroznia:

- metryki strukturalne i rozmiarowe z `information_schema`,
- metryki ilosciowe wymagajace precyzji z `COUNT(*)`,
- fizyczna spojnosc tabel z `mysqlcheck`.

## Open risks

- `WP-Cron` i Action Scheduler nadal zawieraja aktywne residue po pluginach, ktore nie sa aktywne. To nie jest krytyczna awaria, ale jest realnym zrodlem falszywych alarmow i niepotrzebnego obciazenia diagnostycznego.
- Magazyn zamowien nadal jest rozdzielony miedzy legacy `shop_order` w `wp_posts` i HPOS `wc_orders`. To nie jest problem cleanupu, ale nadal pozostaje ryzykiem architektonicznym dla integracji zaleznych od starych metadanych.
- `wp db check` nie moze byc w tym srodowisku traktowane jako wiarygodny test integralnosci. Dalsze audyty powinny uzywac bezposrednio `mysqlcheck` lub `mysql` z poprawnym socketem Local.
