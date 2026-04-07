# Raport z wykonania czyszczenia i optymalizacji bazy danych

**Data wykonania:** 24 marca 2026
**Środowisko:** Local (Staging kopia BigDIAMOND)
**Wykonawca:** Manus AI

## Podsumowanie operacji

Przeprowadzono trójetapowe czyszczenie i optymalizację bazy danych na podstawie wcześniej wygenerowanych raportów audytowych. Operacje wykonano bezpośrednio na instancji MySQL zarządzanej przez aplikację Local.

Przed rozpoczęciem prac utworzono pełny zrzut bazy danych (264 MB) jako zabezpieczenie:
`app/sql/pre-cleanup-2026-03-24.sql`

### Rezultaty w liczbach

| Metryka | Przed czyszczeniem | Po czyszczeniu | Różnica |
| :--- | :--- | :--- | :--- |
| **Rozmiar bazy danych** | ~444 MB (414 MB netto) | **230 MB** (219 MB netto) | **-214 MB (ok. 48% redukcji)** |
| **Liczba tabel** | 214 | **60** | **-154 tabele** |
| **Liczba opcji (wp_options)** | 2339 | **1278** | **-1061 opcji** |
| **Wiersze postmeta** | 299 385 | **230 020** | **-69 365 wierszy** |
| **Liczba postów** | 35 407 | **32 360** | **-3 047 postów** |

## Przebieg czyszczenia

### Wave 1 (Niskie ryzyko)
Pierwsza fala skupiła się na elementach bezpiecznych do usunięcia, nie posiadających żadnych zależności.
1. Usunięto 57 wygasłych i osieroconych transientów.
2. Wyczyszczono 38 osieroconych zadań cron z nieaktywnych wtyczek (m.in. Jetpack, Elementor, Yoast, WP Rocket, All In One WP Security).
3. Usunięto 31 tabel sierocych, w tym ciężkie pozostałości po MailerLite (76 MB), Media Cleaner (23 MB), EWWW Image Optimizer (11 MB) oraz starych skryptach eksportujących.

### Wave 2 (Średnie ryzyko)
Druga fala wyeliminowała pozostałości po złożonych, ale nieaktywnych systemach.
1. Usunięto 110 tabel należących do wtyczek importu/eksportu (WP All Import/Export, WebToffee), starego SEO (Yoast), cache (LiteSpeed) oraz wtyczek AI i RODO.
2. Usunięto 1041 opcji z tabeli `wp_options`, w tym bardzo duże zrzuty danych autoload (np. biblioteki Elementora ważące ponad 600 KB).

### Wave 3 (Głębokie czyszczenie i optymalizacja)
Trzecia fala to chirurgiczne usuwanie powiązań i odzyskiwanie miejsca.
1. Usunięto 966 postów typu `oembed_cache` (generowanych automatycznie, bezpiecznych do usunięcia).
2. Usunięto szkice, kosz i rewizje postów wraz z ich powiązanymi metadanymi.
3. Wyczyszczono ponad 69 tysięcy wierszy `postmeta` pozostawionych przez nieaktywne wtyczki (głównie Elementor i Yoast SEO).
4. Wyczyszczono logi Action Scheduler.
5. Wykonano polecenie `OPTIMIZE TABLE` na wszystkich 60 pozostałych tabelach, co pozwoliło odzyskać pofragmentowane miejsce na dysku (zmniejszenie rozmiaru z 239 MB do 219 MB netto).

## Walidacja końcowa

Po zakończeniu wszystkich operacji przeprowadzono testy walidacyjne:
- System WordPress odpowiada prawidłowo.
- Główne wtyczki (WooCommerce, InPost, imoje, Rank Math) są aktywne.
- Liczba produktów (5636) i wariantów (112) pozostała nienaruszona.
- Liczba zamówień HPOS (158) i użytkowników (109) nie uległa zmianie.
- Załączniki i media (25652) są bezpieczne.

## Rekomendacje na przyszłość

1. **HPOS i InPost:** Zamówienia w WooCommerce są obecnie podzielone między stary system (`shop_order` w tabeli wp_posts) a nowy HPOS (`wc_orders`). Ponieważ wtyczka InPost nadal odwołuje się do starych metadanych, stare zamówienia nie zostały usunięte. Wymagana jest synchronizacja i pełne przejście na HPOS w przyszłości.
2. **Motyw potomny:** Logika niefokusowana na wygląd (bezpieczeństwo, optymalizacja, personalizacja WooCommerce) nadal znajduje się w motywie `bigdiamond-prestige`. Zaleca się przeniesienie jej do dedykowanego pluginu MU.
