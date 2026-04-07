# Ecommerce Copy Boundaries

**Status:** PARTIAL_EVIDENCE

## Zasady ogólne

1. Copy musi być zgodne z prawem ochrony konsumenta
2. Ceny muszą być widoczne i klarowne
3. Zakaz wprowadzających w błąd praktyk
4. Claimy zablokowane (BLOCKED) nie mogą być publikowane

## Ceny

### Transparentność cen

- Cena regular i cena promo muszą być wyraźnie widoczne
- Cena za jednostkę gdzie relevant
- Koszty wysyłki widoczne przed checkout
- **Źródło:** Page ID 72672 — ceny dostawy widoczne na stronie dostawy

### Promocje

- Obniżka ceny: stara i nowa cena
- Termin promocji: jasno określony
- Warunki promocji: czytelne

## Informacje o produkcie

### Wymagane

| Element | Status | Źródło |
|---------|--------|--------|
| Nazwa produktu | Wymagane | WooCommerce PDP |
| Cena z VAT | Wymagane, widoczna | WooCommerce |
| Zdjęcie | Wymagane | PDP |
| Opis (materiał, kamień, wymiary) | Wymagane | PDP |
| Dostępność | Wymagane | WooCommerce |

### Zabronione

- Wprowadzające w błąd opisy
- Fake stock
- Nieprawdziwe certyfikaty
- Claimy z claims-matrix.md ze statusem BLOCKED

## Payment Method Claims

### ✓ MOŻNA publikować

- "Akceptujemy płatność gotówką, kartą, przelewem bankowym"
- "Możliwość płatności przy odbiorze (COD)"
- "Płatność BLIK" — tylko po technicznej weryfikacji
- "Szybki przelew z większości banków w Polsce"

### ⛔ NIE WOLNO publikować

- "imoje" jako marka — plugin nieaktywny
- "Płatności ratalne przez imoje" — imoje nieaktywny
- "PayU raty" — niepotwierdzone
- "Santander raty" — niepotwierdzone

## Shipping Claims

### ✓ MOŻNA publikować

- "InPost Paczkomat 24/7 — 16,99 zł"
- "Kurier DPD — 19,99 zł" (po weryfikacji w admin)
- "Darmowa dostawa od 1000 zł"
- "Odbiór osobisty w Krakowie — gratis"
- "Płatność za pobraniem — +25 zł" (po weryfikacji)

### ⚠ OSTROŻNIE

- Ceny wysyłki — zweryfikować w WooCommerce admin przed publikacją
- Czas dostawy "2-7 dni roboczych" — standard, można publikować

## Call to Action

| Dopuszczalne | Status |
|--------------|--------|
| "Zamów teraz" | ✓ DOZWOLONE |
| "Sprawdź dostępność" | ✓ DOZWOLONE |
| "Złóż zamówienie" | ✓ DOZWOLONE |
| "Skontaktuj się" | ✓ DOZWOLONE |
| "Zobacz szczegóły" | ✓ DOZWOLONE |
| "Zarezerwuj termin" | ✓ DOZWOLONE |

## Porównania

### ✓ Dopuszczalne

- Porównanie z konkurencją na podstawie faktów
- Porównanie kolekcji własnych produktów

### ⛔ Zabronione

- Bez podstawy porównanie z konkurencją
- Sugestie że konkurencja jest gorsza
- Claimy ze statusem BLOCKED w claims-matrix.md

## Status

`PARTIAL_EVIDENCE` — struktura zachowana. Dodano publication rules dla payment methods i shipping. Wymagana weryfikacja cen wysyłki w admin.

(End of file - total 61 lines)
