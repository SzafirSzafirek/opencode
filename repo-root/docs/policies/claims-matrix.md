# Claims Matrix

**Status:** PARTIAL_EVIDENCE

## Zasady ogólne

1. Każdy claim musi być możliwy do zweryfikowania
2. Zakaz twierdzeń wprowadzających w błąd
3. Superlatives tylko z dowodami
4. Claimy zablokowane (BLOCKED) nie mogą być publikowane bez potwierdzenia

## Macierz walidacyjna - CONFIRMED

| Claim | Status | Źródło | Gdzie wolno | Uwagi |
|-------|--------|--------|-------------|-------|
| "2-6 tygodni" czas realizacji | ✓ CONFIRMED | Page ID 24673 (FAQ) | Wszędzie przy omawianiu czasu realizacji | Gdy czas jest krótszy |
| "certyfikaty IGI/GIA" | ✓ CONFIRMED | Page ID 24673 | Przy każdym diamentem | Gdy produkt nie ma certyfikatu — nie używaj |
| "12 miesięcy gwarancji" | ✓ CONFIRMED | Page ID 24673 | Wszędzie przy omawianiu gwarancji | Gdy dotyczy used products |
| "1000 zł" próg darmowej dostawy | ✓ CONFIRMED | Page ID 72672 | Przy koszyku i dostawie | Gdy próg jest inny |
| "złoto 585/750" | ✓ CONFIRMED | FAQ + materials-stones | Przy opisie produktów | Gdy produkt jest inny |
| "ręcznie robiona" | ✓ CONFIRMED | Page ID 16488 | Przy opisie procesu | Usługi custom |
| "przetapianie złota" | ✓ CONFIRMED | Page ID 27379 | Przy opisie usługi | Usługa dostępna |

## Macierz walidacyjna - BLOCKED

| Claim | Status | Źródło | Dlaczego zablokowane | Warunek odblokowania |
|-------|--------|--------|---------------------|---------------------|
| "30-50% niższa cena" diamentów lab. | ⛔ BLOCKED | Page ID 24673 | Brak danych rynkowych porównawczych | Weryfikacja z cennikiem/danymi rynkowymi |
| "85% mniej wody" diamenty lab. | ⛔ BLOCKED | Page ID 24673 | Brak weryfikacji SCS-007 | Certyfikacja SCS-007 od hodowli |
| "70% ślad węglowy redukowany" | ⛔ BLOCKED | Page ID 24673 | Brak weryfikacji SCS-007 | Certyfikacja SCS-007 od hodowli |
| "najlepszy jubiler Kraków" | ⛔ BLOCKED | Superlative | Brak dowodów | Ranking, nagroda, recenzje |
| "unikalna biżuteria" | ⛔ BLOCKED | Jakość | Nieprawdziwe lub nieprawdziwe | Konkretny dowód unikalności |
| "ekskluzywna biżuteria" | ⛔ BLOCKED | Jakość | Nieprawdziwe twierdzenie | Konkretny dowód ekskluzywności |
| "najwyższa jakość" | ⛔ BLOCKED | Superlative | Brak dowodów | Certyfikaty, standardy |
| "100% pewność" przy identyfikacji diamentów | ⛔ BLOCKED | FAQ Q8 | Technicznie niemożliwe | Usunąć lub zastąpić "certyfikowana identyfikacja" |
| imoje (jako aktywna metoda) | ⛔ BLOCKED | Plugin inactive | Plugin nieaktywny w WooCommerce | Aktywacja i konfiguracja imoje |

## Macierz walidacyjna - NEEDS_OWNER_CONFIRMATION

| Claim | Status | Źródło | Co wymaga potwierdzenia |
|-------|--------|--------|------------------------|
| "doświadczeni złotnicy" | ⚠ USE WITH CAUTION | Page content | Liczba lat doświadczenia, portfolio |
| "ekologiczne diamenty" | ⚠ VERIFY SOURCE | Page 24673 | Źródło certyfikacji środowiskowej |

## Proces walidacji

1. Znajdź wszystkie claims w copy
2. Sprawdź status w macierzy
3. Jeśli BLOCKED — **nie publikuj** dopóki owner nie potwierdzi
4. Jeśli CONFIRMED — możesz publikować zgodnie z warunkami
5. Jeśli NEEDS_OWNER_CONFIRMATION — publikuj tylko z zastrzeżeniem lub poproś o potwierdzenie

## Publication Rules

### Payment Claims
- ✓ MOŻNA: "Akceptujemy BLIK, karty, przelew bankowy"
- ✓ MOŻNA: "Płatność przy odbiorze"
- ⛔ NIE WOLNO: "imoje" jako marka bez potwierdzenia aktywności
- ⛔ NIE WOLNO: "Płatności ratalne" bez potwierdzenia operatora

### Shipping Claims
- ✓ MOŻNA: "InPost Paczkomat 16,99 zł"
- ✓ MOŻNA: "Darmowa dostawa od 1000 zł"
- ✓ MOŻNA: "Odbiór osobisty — gratis"
- ⚠ OSTROŻNIE: "Kurier DPD 19,99 zł" — zweryfikować ceny w admin

### Environmental Claims
- ⛔ NIE WOLNO: "85% mniej wody" bez SCS-007
- ⛔ NIE WOLNO: "70% mniejszy ślad węglowy" bez SCS-007
- ⚠ OSTROŻNIE: "Ekologiczne diamenty" — tylko z zastrzeżeniem o źródle

## Status

`PARTIAL_EVIDENCE` — część claimów zweryfikowana, część zablokowana. Wymagane potwierdzenie od właściciela dla odblokowania claimów środowiskowych i operacyjnych.

(End of file - total 62 lines)
