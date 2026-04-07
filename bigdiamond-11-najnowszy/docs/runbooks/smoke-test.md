# Smoke Test

**Status:** FINAL

**Last updated:** 2026-04-07

---

## Cel

Weryfikacja że critical paths działają po zmianach. Każdy flow kończy się PASS/FAIL.

---

## Input

- Dostęp do strony (local URL lub staging URL)
- WP-CLI access via `./run-wp.sh`
- Znajomość critical user flows

---

## Procedura

### 1. Basic Load Tests

```bash
# Homepage load
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/
# Expected: 200

# Category load
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/pierscionki/
# Expected: 200

# PDP load (get first product ID first)
./run-wp.sh post list --post_type=product --posts_per_page=1 --fields=ID,post_title
# Then test that product URL
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/sklep/product-slug/
# Expected: 200
```

**Result:** ___ PASS / FAIL

---

### 2. PHP Error Check

```bash
tail -50 app/public/wp-content/debug.log 2>/dev/null || echo "No debug.log"
grep -i "error\|fatal\|warning" app/public/wp-content/debug.log 2>/dev/null | tail -20
```

**Result:** ___ PASS (no errors) / FAIL (errors found)

---

### 3. Checkout Flow - Payment Methods

#### 3.1 Add to Cart

```bash
# Add a simple product to cart (use product ID from step 1)
# Visit product page in browser and add to cart
# Or use WooCommerce REST API if configured
```

**Result:** ___ PASS / FAIL

#### 3.2 Cart Edit/Remove

```bash
# Visit cart page
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/koszyk/
# Click remove item, verify cart updates
```

**Result:** ___ PASS / FAIL

#### 3.3 Checkout Open

```bash
# Proceed to checkout
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/koszyk/
# Click checkout button
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/kasa/
```

**Result:** ___ PASS / FAIL

#### 3.4 Payment Method - imoje (Szybki przelew / BLIK / Card)

```bash
# Select imoje payment method
# Verify redirect to imoje or inline payment form loads
# Note: Actual payment testing requires sandbox or test mode
```

**Result:** ___ PASS / FAIL

#### 3.5 Payment Method - Przelew tradycyjny (BACS)

```bash
# Select "Przelew bankowy" method
# Verify BACS details shown in checkout
```

**Result:** ___ PASS / FAIL

#### 3.6 Payment Method - Pobranie (COD)

```bash
# Select "Płatność przy odbiorze" method
# Verify +25 zł surcharge shown
```

**Result:** ___ PASS / FAIL

#### 3.7 Payment Method - Odbiór osobisty

```bash
# Select "Local pickup" shipping
# Verify no shipping charge
# Select "Odbiór osobisty" at checkout
```

**Result:** ___ PASS / FAIL

---

### 4. Shipping Methods

#### 4.1 DPD Shipping

```bash
# Select Kurier DPD at checkout
# Verify price: 19,99 zł
```

**Result:** ___ PASS / FAIL

#### 4.2 DPD Pobranie

```bash
# Select Kurier DPD COD
# Verify price: 25,00 zł
```

**Result:** ___ PASS / FAIL

#### 4.3 InPost Paczkomat

```bash
# Select InPost Paczkomat 24/7
# Verify price: 16,99 zł
```

**Result:** ___ PASS / FAIL

#### 4.4 Free Shipping Threshold

```bash
# Add items totaling > 1000 zł
# Verify free shipping option appears
```

**Result:** ___ PASS / FAIL

---

### 5. Service Pages

#### 5.1 Pracownia Złotnicza CTA

```bash
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/pracownia-zlotnicza-jubiler-krakow-bigdiamond/
# Verify contact CTA present
```

**Result:** ___ PASS / FAIL

#### 5.2 Contact Form

```bash
# Visit contact page
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/kontakt-bigdiamond-jubiler-w-krakowie/
# Submit test inquiry (if form is functional)
```

**Result:** ___ PASS / FAIL

---

### 6. Mobile Smoke

```bash
# Test responsive with curl (desktop user-agent)
curl -s -o /dev/null -w "%{http_code}" https://bigdiamond.pl/ --user-agent "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)"
```

**Result:** ___ PASS / FAIL

---

### 7. Order Creation Sanity

```bash
# Create test order via WP-CLI (dry run)
./run-wp.sh eval 'echo "WooCommerce version: " . WC()->version;'
# Check WooCommerce is functioning
```

**Result:** ___ PASS / FAIL

---

## Output

```
Smoke Test Report - [DATE]
==========================

Basic Load Tests:
- Homepage: [PASS/FAIL] (HTTP [CODE])
- Category: [PASS/FAIL] (HTTP [CODE])
- PDP: [PASS/FAIL] (HTTP [CODE])

PHP Errors:
- [PASS/FAIL] - [N errors]

Checkout Flows:
- Add to Cart: [PASS/FAIL]
- Cart Edit/Remove: [PASS/FAIL]
- Checkout Open: [PASS/FAIL]
- imoje payment: [PASS/FAIL]
- BACS payment: [PASS/FAIL]
- COD payment: [PASS/FAIL]
- Local pickup: [PASS/FAIL]

Shipping:
- DPD: [PASS/FAIL] (19,99 zł)
- DPD COD: [PASS/FAIL] (25,00 zł)
- InPost: [PASS/FAIL] (16,99 zł)
- Free shipping (>1000 zł): [PASS/FAIL]

Service Pages:
- Pracownia Złotnicza: [PASS/FAIL]
- Contact form: [PASS/FAIL]

Mobile: [PASS/FAIL]

Order Creation: [PASS/FAIL]

OVERALL: [PASS/FAIL]
```

---

## Blocker Criteria

Test FAIL if ANY of:
- Homepage returns non-200
- PHP fatal errors in debug.log
- Add to cart broken
- Checkout fails to open
- Payment method selection broken
- Shipping method selection broken

---

## Rollback

Jeśli smoke test FAIL po zmianach:

1. Przywróć pliki z backup:
```bash
cp -r wp-content-backup/bigdiamond-prestige-YYYYMMDD/* app/public/wp-content/themes/bigdiamond-prestige/
```

2. Uruchom ponownie smoke test

3. Jeśli nadal FAIL → eskaluj do chief-operator

---

**End of file**
