# NAP - Name, Address, Phone

**Status:** EVIDENCE_FOUND

## Nazwa firmy

**Nazwa handlowa:** BigDIAMOND
**Źródło:** `blogname` (WP option), header/footer strony

**Nazwa prawna:** BD Katarzyna Lichwa
**Źródło:** Page ID 25201 (Polityka Zwrotów) — treść strony

## Adres

**Ulica:** ul. Starowiślna 6/1B
**Miasto:** Kraków
**Kod pocztowy:** 31-032
**Region:** Małopolskie
**Kraj:** Polska
**Źródło:** WooCommerce store options (`woocommerce_store_address`, `woocommerce_store_city`, `woocommerce_store_postcode`) + Page ID 25201

## Telefon

**Numer:** +48 574 470 119
**Źródło:** Page ID 15982 (Kontakt) — treść strony

## Email

**Email kontaktowy:** biuro@bigdiamond.pl
**Źródło:** Page ID 15982 (Kontakt), Page ID 25201 (Polityka Zwrotów)

## Godziny otwarcia

| Dzień | Godziny |
|-------|---------|
| Poniedziałek–Piątek | 10:00–19:00 |
| Sobota | 10:00–14:00 |
| Niedziela | Zamknięte |

**Źródło:** Page ID 15982 (Kontakt) — treść strony

## Gdzie NAP jest używane

- WooCommerce store address
- Schema.org LocalBusiness
- Google Business Profile
- Facebook Page
- Footer strony
- Header strony
- Polityka zwrotów (strona)
- Strona kontaktowa

## Status

`EVIDENCE_FOUND` — dane zweryfikowane z trzema niezależnymi źródłami w projekcie:
1. WooCommerce store options (address, city, postcode)
2. Page ID 15982 (Kontakt) — phone, email, hours, address text
3. Page ID 25201 (Polityka Zwrotów) — legal name, address

## Rozjazd adresu

| Source | Address | Status |
|--------|---------|--------|
| WooCommerce / SSOT | ul. Starowiślna 6/1B | CANONICAL |
| Page 15982 (Kontakt) text | ul. Starowiślna 6 | ⚠ needs-owner-confirmation |
| Google Maps embed | ul. Starowiślna 6 | Map pin location |

**Analiza:** Adres "6/1B" jest używany w WooCommerce i na stronach prawnych (Polityka Zwrotów) jako oficjalny adres pocztowy. Strona kontaktowa używa "6" w tekście, ale link do Google Maps prawdopodobnie prowadzi do "6". Jest to typowa praktyka gdy lokalizacja Google Maps nie rozróżnia jednostek.

**Decyzja:** Oznaczono jako `needs-owner-confirmation`. Nie nadpisano arbitralnie.

**TODO:** Zweryfikować z właścicielem biznesu:
- Czy oficjalny adres to "ul. Starowiślna 6/1B" czy "ul. Starowiślna 6"?
- Czy Google Maps powinien wskazywać na "6" czy "6/1B"?

## WooCommerce Store Phone

**Status:** `NOT_SET` — opcja `woocommerce_store_phone` nie jest ustawiona.

Theme używa hardcoded fallback (`homepage.php` line 716) = "+48 574 470 119".

**TODO:** Ustawienie opcji jest opcjonalne — fallback działa poprawnie.

## Rank Math Schema

**Status:** `CANNOT_VERIFY_VIA_CLI` — Rank Math przechowuje schema configuration w sposób niedostępny przez WP-CLI.

Schema LocalBusiness jest generowana przez Rank Math na podstawie:
- `blogname` = "Jubiler Kraków Sklep BigDIAMOND"
- WooCommerce store address
- Page 15982 (Kontakt) content

**TODO:** Zweryfikować Rank Math LocalBusiness Schema ręcznie w admin panel:
1. Rank Math → General Settings → Local Business
2. Upewnić się że name = "BigDIAMOND"
3. Upewnić się że address = "ul. Starowiślna 6/1B, 31-032 Kraków"
4. Upewnić się że phone = "+48 574 470 119"
5. Upewnić się że email = "biuro@bigdiamond.pl"

(End of file - total 54 lines)
