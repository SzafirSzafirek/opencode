# Shipping and Returns - Wysyłka i Zwroty

**Status:** PARTIAL_EVIDENCE

## Wysyłka

### Koszty wysyłki (Polska)

| Metoda | Koszt | Czas dostawy | Źródło | Status |
|--------|-------|--------------|--------|--------|
| InPost Paczkomat 24/7 | 16,99 zł | 2-7 dni robocze | Page ID 72672 | ✓ POTWIERDZONE (woocommerce config) |
| Kurier DPD | 19,99 zł | 2-7 dni robocze | Page ID 72672 | ⚠ PARTIAL — zweryfikować w admin |
| Kurier DPD (Pobranie) | 25,00 zł | 2-7 dni robocze | Page ID 72672 | ⚠ PARTIAL — zweryfikować w admin |
| Odbiór osobisty (Kraków, ul. Starowiślna 6/1B) | 0 zł | Po potwierdzeniu | Page ID 72672 | ✓ POTWIERDZONE |

### WooCommerce Shipping Config

| Method ID | WooCommerce Config | Status |
|-----------|-------------------|--------|
| easypack_parcel_machines | InPost Paczkomat | ✓ active |
| easypack_shipping_courier_c2c | Kurier DPD | ✓ active |
| easypack_parcel_machines_cod_c2c | DPD COD | ✓ active |
| local_pickup | Odbiór osobisty | ✓ active |
| free_shipping | Darmowa dostawa | ✓ active (1000 zł threshold) |

**Uwaga:** Ceny skonfigurowane w WooCommerce nie były weryfikowane przez CLI. Powyższe wartości pochodzą z Page 72672.

### Publication Rules

| Price | Status | Can Publish |
|-------|--------|-------------|
| InPost: 16,99 zł | ✓ potwierdzona konfiguracja | ✓ TAK |
| DPD: 19,99 zł | ⚠ niezweryfikowana cena | ⚠ Zweryfikować w admin |
| DPD COD: +25 zł | ⚠ niezweryfikowana cena | ⚠ Zweryfikować w admin |
| Free shipping: 1000 zł | ✓ potwierdzona | ✓ TAK |
| Local pickup: 0 zł | ✓ potwierdzona | ✓ TAK |

### Darmowa dostawa

**Próg:** Zamówienia powyżej 1000 zł (opłacone z góry)
**Źródło:** Page ID 72672

### Obszar dostawy

- Polska: cały kraj
- Kraków: Wolt Drive (ekspresowa dostawa w kilkadziesiąt minut)
- Europa i świat: NEEDS_REVIEW — FAQ (page ID 24673) mówi "kraje Unii Europejskiej oraz wybrane państwa poza UE" ale brak szczegółów

### Śledzenie przesyłki

- DPD: standardowe śledzenie przez DPD
- InPost: standardowe śledzenie przez InPost
- Wolt Drive: przez aplikację Wolt

## Zwroty

### Polityka zwrotów

- **Termin odstąpienia od umowy:** 14 dni kalendarzowych od dnia objęcia produktu w posiadanie
- **Warunki:** produkt nieużywany, w oryginalnym opakowaniu
- **Koszty zwrotu:** ponosi kupujący
- **Źródło:** Page ID 25201 (Polityka Zwrotów)

### Procedura zwrotu

1. Złóż oświadczenie o odstąpieniu (pisemnie lub email: biuro@bigdiamond.pl)
2. Dołącz wypełniony formularz odstąpienia + dowód zakupu
3. Spakuj produkt bezpiecznie
4. Wyślij na adres:

```
BD Katarzyna Lichwa
ul. Starowiślna 6/1B
31-032 Kraków
```

5. Zwrot płatności: 14 dni kalendarzowych od otrzymania oświadczenia lub dowodu odesłania (zależnie co wcześniej)
6. Zwrot na to samo konto/kartę lub zgodę na inne rozwiązanie

**Źródło:** Page ID 25201

### Wyjątki od prawa odstąpienia

- Usługi wykonane za zgodą klienta
- Produkty nieprefabrykowane produkowane według specyfikacji klienta
- Produkty w zapieczętowanym opakowaniu (higiena) po otwarciu

## Reklamacje

- **Gwarancja:** 12 miesięcy na wszystkie wyroby i usługi złotnicze
- **Zakres:** wady materiałowe i produkcyjne
- **Wyłączenia:** uszkodzenia mechaniczne wynikające z niewłaściwego użytkowania
- **Procedura:** kontakt → opis wady → przesłanie produktu → rozpatrzenie
- **Źródło:** Page ID 24673 (FAQ)

### Kontakt ds. zwrotów i reklamacji

- **Telefon:** +48 574 470 119
- **Email:** biuro@bigdiamond.pl
- **Adres:** BD Katarzyna Lichwa, ul. Starowiślna 6/1B, 31-032 Kraków

## Status

`CONFIRMED (częściowo)` — koszty dostawy i polityka zwrotów potwierdzone z page 72672 i 25201. Gwarancja potwierdzona z page 24673. Wysyłka międzynarodowa wymaga uzupełnienia.

(End of file - total 77 lines)
