# PDP Standard - Product Detail Page Standard

**Status:** STANDARD_DEFINED

**Last updated:** 2026-04-07

---

## Page Sections

### 1. Product Gallery (MONEY)

**Components:**
- Main image (large)
- Thumbnail gallery
- Zoom capability (if available)
- Image counter

**File:** Theme or WooCommerce template

### 2. Product Title & Price (MONEY)

**Components:**
- Product name (H1)
- Price (prominently displayed)
- Availability indicator

### 3. Short Description (SUPPORT)

**Components:**
- Brief product description
- Key selling points

### 4. Add to Cart (MONEY)

**Components:**
- Quantity selector
- Add to cart button
- Wishlist button (optional)

### 5. Specifications (SUPPORT)

**Components:**
- Material (from pa_material)
- Gold color (from pa_kolor-zlota)
- Stone type (from pa_kamien-centralny)
- Stone details (from pa_rodzaj-kamieni)
- Weight/dimensions

**Source:** `docs/ssot/product-attributes.md`

### 6. Shipping & Payment Info (SUPPORT)

**Components:**
- Shipping options (DPD, InPost, local pickup)
- Shipping costs
- Payment methods (imoje, BACS, COD)
- Lead time

**Source:** `docs/ssot/shipping-and-returns.md`, `docs/ssot/payment-methods.md`

### 7. Trust Badges (TRUST)

**Components:**
- 💍 Pierwsza korekta rozmiaru pierścionka gratis!
- 🚚 Darmowa dostawa od 1000 zł!
- 🎁 Eleganckie opakowanie prezentowe gratis!
- 12-miesięczna gwarancja

**Source:** `docs/ssot/guarantees-and-care.md`

### 8. Product Details (SUPPORT)

**Components:**
- Full description
- Care instructions
- Stone certification (if applicable)

### 9. FAQ Section (SUPPORT)

**Components:**
- Relevant FAQ for this product type
- Source: `docs/ssot/faq-source.md`

### 10. Related Products (MONEY)

**Components:**
- Related products grid
- Upsell/cross-sell

---

## Schema Requirements

| Element | Schema Type | Source |
|---------|-------------|--------|
| Product | Product | Rank Math (auto from WooCommerce) |
| Offers | Offer | Rank Math (auto) |
| Brand | Brand | Rank Math (BigDIAMOND) |
| Availability | URL | Rank Math (from stock) |

**Canonical source:** `docs/ssot/schema-source-of-truth.md`

---

## Metadata Requirements

| Element | Source |
|---------|--------|
| Title | Rank Math (auto) |
| Meta description | Rank Math (auto) |
| Open Graph | Rank Math |
| Schema | Rank Math WooCommerce integration |

---

## Attributes Display Map

| Attribute | Taxonomy | Display Name |
|-----------|----------|--------------|
| Material | pa_material | Materiał |
| Gold color | pa_kolor-zlota | Kolor złota |
| Stone | pa_kamien-centralny | Kamień centralny |
| Stone type | pa_rodzaj-kamieni | Rodzaj kamieni |
| Gold proof | pa_proba-zlota | Próba złota |

**Source:** `docs/ssot/product-attributes.md`

---

## Dependencies

| Dependency | Source |
|------------|--------|
| Product data | WooCommerce |
| Attributes | `docs/ssot/product-attributes.md` |
| Materials/stones | `docs/ssot/materials-stones.md` |
| Shipping | `docs/ssot/shipping-and-returns.md` |
| Payment | `docs/ssot/payment-methods.md` |
| Guarantees | `docs/ssot/guarantees-and-care.md` |

---

## Implementation

**Files:**
- `inc/woocommerce/single-product-layout.php` (shell)
- `inc/woocommerce/personalization.php` (customization options)
- WooCommerce template overrides (if needed)

---

**End of file**
