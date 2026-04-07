# Merchant Verification Report

**Status:** CURRENT

**Generated:** 2026-04-07

---

## Current Canonical Merchant State

### Verified Components

| Component | Status | Evidence |
|-----------|--------|----------|
| WooCommerce | ACTIVE | Plugin list, version 10.3.8 |
| Rank Math SEO | ACTIVE | Plugin list, version 1.0.265 |
| imoje | ACTIVE | DB: `enabled: yes`, Live site logos |
| inpost-for-woocommerce | ACTIVE | Plugin list, version 1.8.4 |
| google-listings-and-ads | ACTIVE | Owner confirmation |

---

## Owner Overrides Applied

| Item | Old Status | New Status | Reason |
|------|------------|------------|--------|
| imoje | INACTIVE/BLOCKED (docs) | ACTIVE | Owner confirmation + DB + Live site |
| google-listings-and-ads | INACTIVE (docs) | ACTIVE | Owner confirmation |

---

## Runtime Evidence

### Plugin Status (DB)

```bash
./run-wp.sh plugin list --status=active
```

**Result:**
- inpost-for-woocommerce: active (1.8.4)
- seo-by-rank-math: active (1.0.265)
- woocommerce: active (10.3.8)

**Note:** imoje shows as installed but NOT in active list (plugin loaded differently)

### Payment Gateway Status (DB)

```bash
./run-wp.sh eval 'echo json_encode(array(
"bacs" => get_option("woocommerce_bacs_settings", []),
"cod" => get_option("woocommerce_cod_settings", []),
"imoje" => get_option("woocommerce_imoje_settings", [])
), JSON_PRETTY_PRINT);'
```

**Result:**
- bacs: `enabled: yes`
- cod: `enabled: yes`
- imoje: `enabled: yes, sandbox: no`

### Shipping Methods (DB)

All shipping methods enabled:
- easypack_parcel_machines (InPost)
- easypack_shipping_courier_c2c (DPD)
- easypack_parcel_machines_cod_c2c (DPD COD)
- local_pickup
- free_shipping

---

## Live Site Evidence

**URL:** https://bigdiamond.pl/dostawa-i-platnosci/

### Payment Methods Visible

- imoje logos (ING Bank Śląski)
- BLIK logo
- Visa logo
- Mastercard logo
- "Kup teraz, zapłać później" option
- "Raty" option

### Shipping Methods Visible

- Wolt Drive (Kraków ekspresowa)
- InPost Paczkomat 24/7: 16,99 zł
- Kurier DPD: 19,99 zł
- Kurier DPD Pobranie: 25,00 zł
- Odbiór osobisty: 0,00 zł
- Darmowa dostawa od 1000 zł

---

## Unresolved Discrepancies

| Item | Status | Required Action |
|------|--------|-----------------|
| GMC ID | NEEDS_OWNER_CONFIRMATION | Owner to provide GMC ID |
| Facebook Pixel ID | NEEDS_OWNER_CONFIRMATION | Owner to confirm if active |
| imoje test mode | NEEDS_TECHNICAL_RECHECK | Verify `sandbox: no` in production |
| Payment methods on checkout | NEEDS_VISUAL_RECHECK | Verify all methods appear at checkout |

---

## Manual Checks Required

### WooCommerce Admin

- [ ] Verify imoje gateway enabled in WooCommerce → Settings → Payments
- [ ] Verify BACS gateway enabled
- [ ] Verify COD gateway enabled
- [ ] Check shipping zone configuration
- [ ] Verify free shipping threshold: 1000 zł

### Rank Math Admin

- [ ] Verify LocalBusiness schema
- [ ] Verify WooCommerce integration
- [ ] Check FAQ schema on FAQ page
- [ ] Verify Service schema on service pages

### Google Merchant Center

- [ ] Login to GMC
- [ ] Verify account ID
- [ ] Verify products feed configured
- [ ] Check for any issues

### Live Site Checkout

- [ ] Complete test order with imoje
- [ ] Complete test order with BACS
- [ ] Complete test order with COD
- [ ] Verify shipping options at checkout
- [ ] Verify free shipping threshold works

---

## Next Manual Checks

1. **imoje actual payment flow** - Requires sandbox or real transaction test
2. **GMC product feed** - Needs owner access
3. **Facebook Pixel** - Needs owner confirmation if active
4. **Checkout UI** - Visual verification needed

---

**End of file**
