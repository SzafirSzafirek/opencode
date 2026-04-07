---
name: nap-consistency
description: NAP consistency - spójność Name, Address, Phone across all platforms
---

# NAP Consistency

## Zasady NAP

1. NAP musi być identyczny everywhere
2. Wszystkie odniesienia muszą się zgadzać
3. Regularna weryfikacja

## Gdzie NAP powinien być

- Google Business Profile
- Strona internetowa (header, footer, contact)
- Facebook Page
- Mapa Google
- Directory listings (Foursquare, Yelp, Zumi)
- Schema.org JSON-LD

## Walidacja NAP

```bash
# Sprawdź w theme
grep -r "Kraków" app/public/wp-content/themes/bigdiamond-prestige/inc/ --include="*.php"

# Sprawdź w WooCommerce
./run-wp.sh option get woocommerce_store_address
./run-wp.sh option get woocommerce_store_city
./run-wp.sh option get woocommerce_store_phone
```

## Typowe problemy

- Różne numery telefonów
- Różne adresy email
- Brak adresu w some places
- Stary adres po przeprowadzce
