# Product Attributes - Atrybuty Produktów

**Status:** DB_CONFIRMED

**Last verified:** 2026-04-07
**Verification source:** WooCommerce DB taxonomy (via WP-CLI)

---

## Canonical Global Attributes

### Materiał (pa_material)

| Internal Value | Display Name | Status |
|----------------|--------------|--------|
| zloto-585 | Złoto 585 | ✓ DB_CONFIRMED |
| srebro-925 | Srebro 925 | ✓ DB_CONFIRMED |
| srebro-925-pozlacane | Srebro próby 925, pozłacane | ✓ DB_CONFIRMED |
| szkielko | Szkiełko | ✓ DB_CONFIRMED |
| zywica | Żywica | ✓ DB_CONFIRMED |

**Notes:**
- Złoto 585 = 14 karat, 58.5% czystego złota
- Srebro 925 = próba 925 (sterling silver)
- Homepage mentions "platyna" but NO platina in DB taxonomy — NOT CONFIRMED

### Próba złota (pa_proba-zlota)

| Internal Value | Display Name | Status |
|----------------|--------------|--------|
| 585 | 585 | ✓ DB_CONFIRMED |
| 750 | 750 | ✓ LIVE_CONFIRMED (FAQ page mentions 585/750) |

**Notes:**
- Złoto 750 widoczne w copy (FAQ page), potwierdzone jako wartość przy materiałach

### Kamień centralny (pa_kamien-centralny)

| Internal Value | Display Name | Status |
|----------------|--------------|--------|
| diament | Diament | ✓ DB_CONFIRMED |
| diament-laboratoryjny | Diament Laboratoryjny | ✓ DB_CONFIRMED |
| szafir | Szafir | ✓ DB_CONFIRMED |
| rubin | Rubin | ✓ DB_CONFIRMED |
| szmaragd | Szmaragd | ✓ DB_CONFIRMED |
| ametyst | Ametyst | ✓ DB_CONFIRMED |
| topaz | Topaz | ✓ DB_CONFIRMED |
| cyrkon | Cyrkonia | ✓ DB_CONFIRMED |
| bialy-szafir | Biały Szafir | ✓ DB_CONFIRMED |
| rozowy-szafir | Różowy Szafir | ✓ DB_CONFIRMED |
| szafir-rozowy | Szafir Różowy | ✓ DB_CONFIRMED |
| czarny-diament | Czarny Diament | ✓ DB_CONFIRMED |
| cytryn | Cytryn | ✓ DB_CONFIRMED |
| granat | Granat | ✓ DB_CONFIRMED |
| koral | Koral | ✓ DB_CONFIRMED |
| kwarc-dymny | Kwarc Dymny | ✓ DB_CONFIRMED |
| morganit | Morganit | ✓ DB_CONFIRMED |
| oliwin | Oliwin | ✓ DB_CONFIRMED |
| rodolit | Rodolit | ✓ DB_CONFIRMED |
| rozowy-topaz | Różowy Topaz | ✓ DB_CONFIRMED |
| rozowy-turmaling | Różowy Turmalin | ✓ DB_CONFIRMED |
| tanzanit | Tanzanit | ✓ DB_CONFIRMED |
| topaz-london-blue | Topaz London Blue | ✓ DB_CONFIRMED |
| zielony-turmaling | Zielony Turmalin | ✓ DB_CONFIRMED |
| zolty-turmaling | Żółty Turmalin | ✓ DB_CONFIRMED |

### Rodzaj kamieni (pa_rodzaj-kamieni)

| Internal Value | Display Name | Status |
|----------------|--------------|--------|
| diamenty-laboratoryjne | Diamenty laboratoryjne | ✓ DB_CONFIRMED |
| diamenty-naturalne | Diamenty naturalne | ✓ DB_CONFIRMED |
| amestyst | Ametyst | ✓ DB_CONFIRMED |
| cyrkonie | Cyrkonie | ✓ DB_CONFIRMED |
| kolorowe-kamienie-naturalne | Kolorowe Kamienie Naturalne | ✓ DB_CONFIRMED |
| bez-kamieni | Bez kamieni | ✓ DB_CONFIRMED |

### Kolor złota (pa_kolor-zlota)

| Internal Value | Display Name | Status |
|----------------|--------------|--------|
| zolte-zloto | Żółte złoto | ✓ DB_CONFIRMED |
| biale-zloto | Białe złoto | ✓ DB_CONFIRMED |
| rozowe-zloto | Różowe złoto | ✓ DB_CONFIRMED |

---

## Deprecated / Legacy Values

| Value | Reason | Status |
|-------|--------|--------|
| Srebro 830 | NOT in DB taxonomy | ⚠ LEGACY |
| Platyna 950 | NOT in DB taxonomy | ⚠ LEGACY |
| Cyrkonia | Use "cyrkonie" (plural) | ⚠ LEGACY |

**Historical note:** Srebro 830 and Platyna were mentioned in old draft docs but are NOT present in current DB taxonomy. They should not be used as canonical values unless owner confirms otherwise.

---

## Unknown / Not Confirmed

| Item | Notes | Status |
|------|-------|--------|
| Topaz (generic) | Topaz varieties confirmed (London Blue, Różowy) but generic "Topaz" needs check | ⚠ NEEDS_RECHECK |
| Cyrkonia singular | Use plural "cyrkonie" per DB | ⚠ NEEDS_RECHECK |

---

## Product Categories (Confirmed)

**Źródło:** `run-wp.sh term list product_cat`

| Term ID | Nazwa | Slug | Count |
|---------|-------|------|-------|
| 32 | Pierscionki | pierscionki | 3365 |
| 28 | Kolczyki ze złota | kolczyki-zlote | 876 |
| 27 | Złote Zawieszki | zawieszki-zloto | 533 |
| 90 | Złote Naszyjniki | zlote-naszyjniki | 206 |
| 79 | Pierścionki Handmade | pierscionki-wyroby-dwuczesciowe | 247 |
| 77 | Handmade | na-zamowienie | 450 |
| 533 | Kolczyki | kolczyki-na-zamowienie | 103 |
| 26 | Bransoletki złote | bransoletki-zlote | 90 |
| 83 | Sygnety | sygnety | 44 |
| 82 | Zawieszki | zawieszki | 22 |
| 3121 | Naszyjniki | naszyjniki | 17 |
| 3094 | Bransoletki | bransoletki | 17 |
| 89 | Złote Łańcuszki | zlote-lancuszki | 17 |
| 3129 | Srebrne kolczyki | srebrne-kolczyki | 15 |
| 3005 | Biżuteria Disney | bizuteria-disney | 18 |
| 534 | Złote Monety | zlote-monety | 1 |
| 3204 | Bransoletki ze srebra | bransoletki-ze-srebra | 1 |
| 3199 | Srebrne naszyjniki | srebrne-naszyjniki | 3 |
| 3125 | Srebrne zawieszki | srebrne-zawieszki | 35 |
| 81 | Sztabki złota | sztabki-zlota | 27 |

---

## Status

`DB_CONFIRMED` — Atrybuty materiał, kamień centralny, rodzaj kamieni, kolor złota pobrane bezpośrednio z WooCommerce taxonomy. Kategorie potwierdzone. Srebro 830 i Platyna NIE są w DB — nie używać jako canonical.

---

**End of file**
