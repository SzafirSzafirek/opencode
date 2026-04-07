# Merchant Data - Dane Merchant

**Status:** CURRENT_CANONICAL

**Last verified:** 2026-04-07
**Verification sources:** DB (runtime) + Live site + Owner confirmation

---

## Historical Discrepancy

| Date | imoje Status | Source |
|------|-------------|--------|
| 2026-03-30 | INACTIVE/BLOCKED (docs) | Historical audit snapshot |
| 2026-04-07 | ACTIVE_OWNER_CONFIRMED | DB + Live site + Owner |

**Resolution:** Owner confirmed imoje = ACTIVE. DB shows `enabled: yes`. Live site (bigdiamond.pl/dostawa-i-platnosci/) displays imoje logos and payment method descriptions. Historical snapshot was incorrect/outdated.

---

## Merchant Stack (Canonical)

| Component | Status | Version | Notes |
|-----------|--------|---------|-------|
| WooCommerce | ACTIVE_OWNER_CONFIRMED | 10.3.8 | Core e-commerce |
| Rank Math SEO | ACTIVE_OWNER_CONFIRMED | 1.0.265 | SEO + Schema engine |
| imoje | ACTIVE_OWNER_CONFIRMED | 4.15.1 | Payment gateway |
| inpost-for-woocommerce | ACTIVE_OWNER_CONFIRMED | 1.8.4 | Shipping |
| google-listings-and-ads | ACTIVE_OWNER_CONFIRMED | — | Merchant Center |

---

## WooCommerce Store Configuration

| Pole | Wartość | Źródło | Status |
|------|---------|---------|--------|
| Store address | ul. Starowiślna 6/1B | WooCommerce settings | ✓ DB_CONFIRMED |
| Store city | Kraków | WooCommerce settings | ✓ DB_CONFIRMED |
| Store postcode | 31-032 | WooCommerce settings | ✓ DB_CONFIRMED |
| Store country | PL | WooCommerce settings | ✓ DB_CONFIRMED |
| Store phone | +48 574 470 119 | Theme/fallback | ✓ LIVE_CONFIRMED |
| Store email (public) | biuro@bigdiamond.pl | Live site (Kontakt, Polityka Zwrotów) | ✓ LIVE_CONFIRMED |
| Currency | PLN | WooCommerce settings | ✓ DB_CONFIRMED |

---

## Payment Gateways

| Gateway | Gateway ID | Status | Publication | Źródło |
|---------|------------|--------|------------|--------|
| imoje | imoje | ✓ ACTIVE | ✓ CAN PUBLISH | DB: `enabled: yes`, Live site logos |
| Przelew bankowy | bacs | ✓ ACTIVE | ✓ CAN PUBLISH | DB: `enabled: yes` |
| Płatność przy odbiorze | cod | ✓ ACTIVE | ✓ CAN PUBLISH | DB: `enabled: yes` |

**imoje configuration confirmed:**
```json
{
  "enabled": "yes",
  "sandbox": "no",
  "title": "Proste i łatwe płatności online",
  "merchant_id": "q6q1x6vkpkslrtqtk4h9",
  "service_id": "083a1c77-69c9-4751-8650-8d6f57b7fa22"
}
```

---

## Shipping Methods

| Method | WooCommerce ID | Status | Źródło |
|--------|---------------|--------|--------|
| InPost Paczkomat 24/7 | easypack_parcel_machines | ✓ active | DB |
| Kurier DPD | easypack_shipping_courier_c2c | ✓ active | DB |
| DPD COD | easypack_parcel_machines_cod_c2c | ✓ active | DB |
| Local pickup | local_pickup | ✓ active | DB |
| Free shipping | free_shipping | ✓ active | DB (1000 zł threshold) |
| Wolt Drive | — | ✓ active | Live site |

---

## Google Merchant Center

| Pole | Status | Źródło |
|------|--------|--------|
| Plugin | ACTIVE_OWNER_CONFIRMED | Owner confirmation |
| GMC ID | NEEDS_OWNER_CONFIRMATION | Nie znaleziono w projekcie |
| Domain | bigdiamond.pl | Wszystkie strony |

**Uwaga:** Plugin `google-listings-and-ads` jest zainstalowany i aktywowany wg owner confirmation. Weryfikacja GMC ID wymaga dostępu do panelu Google Merchant Center.

---

## Facebook Pixel / Catalog

| Pole | Status |
|------|--------|
| Pixel ID | NEEDS_OWNER_CONFIRMATION |
| Catalog ID | NEEDS_OWNER_CONFIRMATION |

---

## Publication Status Summary

| Kategoria | Status |
|-----------|--------|
| imoje jako metoda płatności | ✓ PUBLISH_OK |
| imoje jako operator ratalny | ✓ PUBLISH_OK |
| Przelew bankowy | ✓ PUBLISH_OK |
| Pobranie | ✓ PUBLISH_OK |
| Wolt Drive | ✓ PUBLISH_OK |
| DPD / InPost shipping | ✓ PUBLISH_OK |

---

## Required Technical Re-checks

| Item | Status | Reason |
|------|--------|--------|
| GMC ID verification | NEEDS_TECHNICAL_RECHECK | Brak w projekcie, wymaga access |
| imoje sandbox mode | NEEDS_TECHNICAL_RECHECK | Potwierdzić `sandbox: no` w prod |
| Facebook Pixel | NEEDS_TECHNICAL_RECHECK | Brak w active plugins |

---

**End of file**
