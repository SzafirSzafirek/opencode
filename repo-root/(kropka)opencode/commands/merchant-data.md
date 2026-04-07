---
name: /merchant-data
description: Audit i synchronizacja danych merchant - Google Merchant, Facebook, payment data
agent: merchant-data-guard
subtask: true
when: Przed release, przy zmianach w merchant data, przy setup Google Merchant
prerequisites:
  - Dostęp do docs/ssot/merchant-data.md
  - Dostęp do docs/policies/merchant-sync-policy.md
  - Znajomość WooCommerce product data
---

# Merchant Data

## Cel

Audit i synchronizacja merchant data:
- Google Merchant Center product data
- Facebook Pixel / Catalog data
- Payment provider data
- NAP consistency across platforms

## Dostępne Tryby

- `--audit` - audit only, bez zmian
- `--sync` - audit + synchronization
- `--verify` - verify existing data against SSOT

## Procedura Audit

### 1. SSOT Check

Sprawdź `docs/ssot/merchant-data.md`:
- Status: CURRENT / NEEDS_REVIEW / MISSING
- Zawartość: business name, address, phone, website

### 2. Google Merchant Center Check

```bash
./run-wp.sh post list --post_type=product --posts_per_page=20 --fields=ID,post_title,_price,_stock_status
```

Sprawdź:
- Cena produktu zgadza się z SSOT?
- Status (_stock_status) jest aktualny?
- Title/description są zgodne z product-attributes.md?

### 3. WooCommerce Settings Check

```bash
./run-wp.sh option get woocommerce_store_address 2>/dev/null
./run-wp.sh option get woocommerce_store_city 2>/dev/null
./run-wp.sh option get woocommerce_store_phone 2>/dev/null
```

### 4. Payment Methods Check

Wg `docs/ssot/payment-methods.md` (jeśli istnieje):
- Które metody płatności są aktywne?
- Czy logo/metody są zgodne z SSOT?

## Procedura Sync

### 1. Prepare SSOT Update

Jeśli merchant data wymaga aktualizacji:
1. Zaktualizuj `docs/ssot/merchant-data.md`
2. Ustaw status: CURRENT + timestamp

### 2. Apply Changes

- WooCommerce Store Address → admin or WP-CLI
- Google Merchant Center → zewnętrzny panel GMC
- Facebook Pixel → Meta Business Suite

### 3. Verify

Po synchronizacji uruchom `/merchant-data --verify`

## Generate Report

```markdown
## Merchant Data Audit - YYYY-MM-DD

### SSOT Status
- merchant-data.md: NEEDS_REVIEW

### Findings

#### WooCommerce Settings
| Setting | SSOT Value | Actual Value | Status |
|---------|------------|--------------|--------|
| Store Address | [SSOT] | [Actual] | MATCH/MISMATCH |
| ... | ... | ... | ... |

#### Products
| Product | Price (SSOT) | Price (Actual) | Status |
|---------|--------------|----------------|--------|
| ... | ... | ... | ... |

### Discrepancies
- [ ] Store phone mismatch: SSOT says X, Woo says Y

### Action Items
- [ ] NEEDS_REVIEW: Verify merchant-data.md with actual business data
```

## Zasady

- **NAP first** - NAP jest fundamentem
- **Consistency across platforms** - wszystkie platformy muszą się zgadzać
- **Document discrepancies** - dokumentuj różnice
- **SSOT as source** - SSOT jest source of truth

## Powiązane

- `/nap-sync` - NAP-specific sync
- `/policy-sync` - policy sync
- `/schema` - schema audit
- `/truth-check` - general truth check
