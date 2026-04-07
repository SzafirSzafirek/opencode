# Payment Methods - Metody Płatności

**Status:** FINAL_CANONICAL

**Last verified:** 2026-04-07
**Verification sources:** DB (runtime) + Live site + Owner confirmation

---

## Operator płatności

**imoje** — ACTIVE_OWNER_CONFIRMED
- Operator: ING Bank Śląski
- Funkcje: szybki przelew, BLIK, karty płatnicze, Visa Mobile, raty/zapłać później
- Źródło: DB (`enabled: yes`), Live site (logos), Owner confirmation

---

## Potwierdzone metody płatności

### Metody online (via imoje)

| Metoda | Status | Źródło |
|--------|--------|--------|
| Szybki przelew | ✓ CAN_PUBLISH | Live site - bigdiamond.pl/dostawa-i-platnosci |
| BLIK | ✓ CAN_PUBLISH | Live site - logos widoczne |
| Karty płatnicze (Visa, Mastercard) | ✓ CAN_PUBLISH | Live site - logos widoczne |
| Visa Mobile | ✓ CAN_PUBLISH | Live site |
| Kup teraz, zapłać później | ✓ CAN_PUBLISH | Live site |
| Raty / finansowanie (imoje) | ✓ CAN_PUBLISH | Live site |

### Metody offline / przelew tradycyjny

| Metoda | Gateway | Status | Źródło |
|--------|---------|--------|--------|
| Przelew tradycyjny | bacs | ✓ CAN_PUBLISH | DB: `enabled: yes` |
| Płatność przy odbiorze (pobranie) | cod | ✓ CAN_PUBLISH | DB: `enabled: yes`, Live site: 25 zł |
| Gotówka przy odbiorze osobistym | local_pickup | ✓ CAN_PUBLISH | Live site |
| Karta przy odbiorze osobistym | local_pickup | ✓ CAN_PUBLISH | Live site |
| BLIK przy odbiorze osobistym | local_pickup | ✓ CAN_PUBLISH | Live site |

---

## Publication Rules

### Co można publikować

✓ "Akceptujemy płatność gotówką, kartą, przelewem bankowym oraz BLIK"
✓ "Płatność online: szybki przelew, BLIK, karty płatnicze, Visa Mobile"
✓ "Raty / Kup teraz, zapłać później (via imoje)"
✓ "imoje — płatności online ING Bank Śląski"
✓ "Płatność przy odbiorze kurierowi (DPD pobranie: +25 zł)"
✓ "Odbiór osobisty: gotówka, karta, BLIK"

### Co wymaga potwierdzenia przed publikacją

| Metoda | Status | Dlaczego |
|--------|--------|----------|
| PayU | ⚠ NEEDS_OWNER_CONFIRMATION | Wspomniane w FAQ ale nie na stronie dostawy |
| Santander raty | ⚠ NEEDS_OWNER_CONFIRMATION | Wspomniane w FAQ ale nie na live site |

---

## Payment Gateway Configuration

| Provider | Plugin Status | Gateway Status | Publication Status |
|----------|--------------|----------------|-------------------|
| imoje | active (4.15.1) | enabled | ✓ CAN PUBLISH |
| BACS (przelew) | N/A | enabled | ✓ CAN PUBLISH |
| COD (pobranie) | N/A | enabled | ✓ CAN PUBLISH |

---

## Status

`FINAL_CANONICAL` — imoje ACTIVE i widoczny na live site. Wszystkie metody z live site potwierdzone. PayU i Santander wymagają owner confirmation.

---

**End of file**
