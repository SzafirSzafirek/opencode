# Category Family - Standard for Category Pages

**Status:** STANDARD_DEFINED

**Last updated:** 2026-04-07

---

## Page Structure

### 1. Category Hero (MONEY)

**Components:**
- Category name (H1)
- Category description (if available)
- Product count

### 2. Filter/Sort Bar (UTILITY)

**Components:**
- Sort dropdown (price, name, date)
- Filter toggles (if applicable)
- Mobile-friendly layout

### 3. Product Grid (MONEY)

**Components:**
- Product cards with:
  - Image
  - Product name
  - Price
  - Quick add to cart (optional)

### 4. Trust Block (TRUST)

**Components:**
- 💍 Pierwsza korekta rozmiaru pierścionka gratis!
- 🚚 Darmowa dostawa od 1000 zł!
- 🎁 Eleganckie opakowanie prezentowe gratis!

### 5. Category FAQ Block (SUPPORT)

**Components:**
- Relevant FAQ for this category
- Source: `docs/ssot/faq-source.md`

### 6. Internal Linking (SUPPORT)

**Components:**
- Link to related categories
- Link to service pages (if applicable)

---

## Schema Requirements

| Element | Schema Type | Source |
|---------|-------------|--------|
| Category page | CollectionPage | Rank Math (auto) |
| Product list | ItemList | Rank Math (auto) |

---

## Metadata Requirements

| Element | Source |
|---------|--------|
| Title | Rank Math (auto from category) |
| Meta description | Rank Math (auto) |
| Canonical URL | Self-referencing |
| Open Graph | Rank Math |

---

## Dependencies

| Dependency | Source |
|------------|--------|
| Category data | `docs/ssot/product-attributes.md` |
| Products | WooCommerce |
| FAQ content | `docs/ssot/faq-source.md` |

---

## Implementation

**File:** `inc/homepage.php` or category-specific template

---

**End of file**
