# Merchant Sync Policy

**Status:** PARTIAL_EVIDENCE

## Uwaga wstępna

Ta polityka wymaga uzupełnienia przez właściciela biznesu. Poniżej dane wykryte w projekcie.

## Zasady synchronizacji

1. Merchant data musi być spójna na wszystkich platformach
2. SSOT jest źródłem prawdy
3. Wszelkie zmiany muszą być dokumentowane
4. Claimy zablokowane (BLOCKED) nie mogą być publikowane bez odblokowania
5. **Email separation:** public customer-facing email (biuro@bigdiamond.pl) musi być oddzielone od internal WP admin_email. Admin email służy tylko do celów operacyjnych WordPress i nie jest częścią public merchant truth.

## Platformy

### Wykryte w projekcie

| Platforma | Status | Dowód |
|-----------|--------|-------|
| WooCommerce | ✓ active | `run-wp.sh plugin list` |
| Rank Math SEO | ✓ active | `run-wp.sh plugin list` |
| imoje | ⛔ BLOCKED | Plugin inactive, gateway not enabled |
| inpost-for-woocommerce | ✓ active | `run-wp.sh plugin list` (1.8.4) |
| Google Merchant Center | ⚠ CANNOT_VERIFY | Plugin `google-listings-and-ads` nieaktywny |
| Google Business Profile | ⚠ NEEDS_OWNER | Brak bezpośredniego dostępu |
| Facebook Pixel | ⚠ NEEDS_OWNER | Brak pluginu facebook-for-woocommerce |

### Niepotwierdzone technicznie

| Platforma | Status | Co wymaga potwierdzenia |
|-----------|--------|------------------------|
| Google Merchant Center | NEEDS_OWNER | Czy GMC jest aktywne? ID konta? |
| Google Business Profile | NEEDS_OWNER | Dostęp do GBP, weryfikacja |
| Facebook Pixel | NEEDS_OWNER | Pixel ID, verify |
| Facebook Catalog | NEEDS_OWNER | Catalog ID |
| Ceneo | NEEDS_OWNER | Czy są obecni? |
| Opineo | NEEDS_OWNER | Czy są obecni? |

## imoje Resolution

### Konflikt

| Source | imoje Status |
|--------|--------------|
| SSOT (payment-methods.md) | Listed as active operator |
| WooCommerce gateway list | Only cod, bacs enabled |
| Plugin status | imoje 4.15.1 inactive |

### Decyzja

**imoje jest BLOCKED dla publicznych claimów** dopóki:
1. Owner potwierdzi że imoje przetwarza płatności przez inną integrację, LUB
2. Plugin imoje zostanie aktywowany i skonfigurowany

### Tymczasowo dozwolone metody

| Metoda | WooCommerce | Status |
|--------|-------------|--------|
| COD (Cash on Delivery) | enabled | ✓ CAN PUBLISH |
| BACS (Bank Transfer) | enabled | ✓ CAN PUBLISH |

## Proces synchronizacji

### Przed zmianą

1. Zaktualizuj SSOT (docs/ssot/merchant-data.md)
2. Ustaw status: NEEDS_REVIEW
3. Zweryfikuj zmianę z ownerem

### Po zmianie

1. Zastosuj zmiany na platformach (jeśli potwierdzone)
2. Zweryfikuj spójność
3. Zaktualizuj SSOT status: CONFIRMED / PARTIAL_EVIDENCE

## Zakres synchronizacji

| Dane | WooCommerce | Google Merchant | Google Business | Facebook |
|------|-------------|-----------------|-----------------|----------|
| NAP | ✓ CONFIRMED | NEEDS_OWNER | NEEDS_OWNER | NEEDS_OWNER |
| Godziny otwarcia | ✓ CONFIRMED | NEEDS_OWNER | NEEDS_OWNER | NEEDS_OWNER |
| Ceny produktów | ✓ CONFIRMED | NEEDS_OWNER | N/A | NEEDS_OWNER |
| Stany magazynowe | ✓ CONFIRMED | NEEDS_OWNER | N/A | NEEDS_OWNER |
| Opisy produktów | ✓ CONFIRMED | NEEDS_OWNER | N/A | NEEDS_OWNER |
| Zdjęcia produktów | ✓ CONFIRMED | NEEDS_OWNER | NEEDS_OWNER | NEEDS_OWNER |
| Metody płatności | ⚠ PARTIAL | NEEDS_OWNER | NEEDS_OWNER | NEEDS_OWNER |
| Metody wysyłki | ⚠ PARTIAL | NEEDS_OWNER | NEEDS_OWNER | NEEDS_OWNER |

## Status

`PARTIAL_EVIDENCE` — WooCommerce potwierdzony jako aktywny. imoje zablokowany (nieaktywny). Google Merchant Center, Google Business Profile, Facebook wymagają zewnętrznego potwierdzenia od właściciela biznesu.

(End of file - total 72 lines)
