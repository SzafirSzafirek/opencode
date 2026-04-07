# Schema Publication Policy

**Status:** PARTIAL_EVIDENCE

## Zasady publikacji

1. Schema musi być zgodna z docs/ssot/schema-source-of-truth.md
2. Wszystkie required fields muszą być obecne
3. Typ schema musi odpowiadać typowi strony i statusowi (confirmed/needs-review/blocked)
4. Claimy zablokowane (BLOCKED) NIE MOGĄ pojawiać się w Schema descriptions

## Stack schema

**Aktywny plugin:** seo-by-rank-math (Rank Math SEO) w wersji 1.0.265
**Źródło:** `run-wp.sh plugin list`

Rank Math generuje Schema automatycznie dla:
- LocalBusiness (dla strony głównej i kontaktowej)
- Product (dla PDP)
- FAQPage (dla stron FAQ)
- Service (dla service pages)

## Typy schema

| Strona | Schema Types | Status | Źródło |
|--------|-------------|--------|--------|
| Homepage | LocalBusiness | CONFIRMED — Rank Math | Zakładka Rank Math General Settings |
| PDP | Product | CONFIRMED — Rank Math WooCommerce integration | WooCommerce product schema |
| Service pages | Service | NEEDS_REVIEW — czy Rank Math automatycznie wykrywa | Wymaga weryfikacji w Rank Math |
| Category | CollectionPage | NEEDS_REVIEW | Wymaga weryfikacji |
| Blog posts | Article | NEEDS_REVIEW | Wymaga weryfikacji |
| FAQ | FAQPage | CONFIRMED — Page ID 24673 | Zawiera FAQ schema w kodzie strony |
| Contact | LocalBusiness | CONFIRMED — Page ID 15982 | Zakładka Rank Math |

## Kryteria publikacji

Schema może być publikowana gdy:

1. Jest zgodna z schema-source-of-truth.md
2. Jest zgodna z treścią strony
3. Status jest: confirmed
4. Wszystkie required fields są obecne

## Blokada publikacji

Schema jest blokowana gdy:

- Status: blocked
- Dane niezgodne z treścią strony
- Brakujące required fields
- Strona jest w statusie draft/private

## Walidacja

1. Użyj https://validator.schema.org/ przed publikacją
2. Użyj Google Rich Results Test
3. Sprawdź zgodność z treścią strony

## Rank Math Schema Configuration

**Ważne:** Rank Math automatycznie pobiera dane z:
- WooCommerce store options (dla LocalBusiness)
- WooCommerce product data (dla Product)
- Page content (dla FAQPage, Service)

Wszelkie zmiany w Schema powinny być realizowane przez:
1. Aktualizację danych w WooCommerce store settings
2. Aktualizację page content
3. Rank Math automatycznie zaktualizuje Schema

**Pliki odpowiedzialne za Schema w projekcie:**
- Rank Math (plugin) — automatyczna generacja
- docs/ssot/schema-source-of-truth.md — wzorzec danych

## Rank Math LocalBusiness Verification Checklist

**UWAGA:** Rank Math Schema configuration nie jest dostępny przez CLI. Weryfikacja wymaga ręcznego dostępu do admin:

- [ ] Rank Math → General Settings → Local Business
- [ ] Name: "BigDIAMOND" (nie "Jubiler Kraków Sklep BigDIAMOND")
- [ ] Address: "ul. Starowiślna 6/1B, 31-032 Kraków"
- [ ] Phone: "+48 574 470 119"
- [ ] Email: "biuro@bigdiamond.pl"
- [ ] Hours: Mon-Fri 10:00-19:00, Sat 10:00-14:00

## Blocked Claims in Schema

Następujące claimy NIE MOGĄ pojawiać się w Schema descriptions:

| Claim | Why Blocked |
|-------|-------------|
| "30-50% niższa cena" diamentów | Brak danych rynkowych |
| "85% mniej wody" | Brak certyfikacji SCS-007 |
| "70% ślad węglowy" | Brak certyfikacji SCS-007 |
| "najlepszy jubiler" | Superlative bez dowodów |
| "ekskluzywna biżuteria" | Nieprawdziwe twierdzenie |

## Status

`PARTIAL_EVIDENCE` — stack potwierdzony (Rank Math active). Konkretne strony i typy Schema wymagają weryfikacji w Rank Math admin. Claimy zablokowane w Schema.

(End of file - total 72 lines)
