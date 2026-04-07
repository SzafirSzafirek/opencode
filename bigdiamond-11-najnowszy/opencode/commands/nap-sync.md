---
name: /nap-sync
description: Synchronizacja NAP (Name, Address, Phone) - weryfikacja spójności across all sources
agent: merchant-data-guard
subtask: true
when: Przed release, przy zmianach w NAP, przy audycie local SEO
prerequisites:
  - Dostęp do docs/ssot/nap.md
  - Dostęp do docs/policies/local-seo-consistency-policy.md
---

# NAP Sync

## Cel

Synchronizacja i weryfikacja NAP (Name, Address, Phone) across:
- WordPress (WooCommerce settings, theme settings)
- Google Business Profile
- Facebook Page
- Inne directory listings
- Schema.org structured data

## Dostępne Tryby

- `--check` - sprawdzenie spójności bez zmian
- `--sync` - synchronizacja zmian
- `--verify` - pełna weryfikacja z evidence

## Procedura Check

### 1. SSOT Check

Sprawdź `docs/ssot/nap.md`:
- Status: CURRENT / NEEDS_REVIEW / MISSING
- Zawartość: business name, address, phone, hours, etc.

### 2. WordPress Check

```bash
./run-wp.sh option get blogname
./run-wp.sh option get woocommerce_store_address
./run-wp.sh option get woocommerce_store_city
./run-wp.sh option get woocommerce_store_postcode
./run-wp.sh option get woocommerce_store_phone
./run-wp.sh option getwoocommerce_store_email
```

Sprawdź również:
- Theme customizer settings
- SEO plugin settings (Rank Math)
- Contact page content

### 3. Schema Check

```bash
grep -r "LocalBusiness\|address\|phone" app/public/wp-content/themes/bigdiamond-prestige/inc/ --include="*.php"
grep -r "postalCode\|streetAddress" app/public/wp-content/ --include="*.php" | grep -v vendor
```

### 4. Generate Report

```markdown
## NAP Consistency Report - YYYY-MM-DD

### SSOT Status
- nap.md: NEEDS_REVIEW

### Sources Checked

| Source | Name | Address | Phone | Status |
|--------|------|---------|-------|--------|
| SSOT | BigDIAMOND | [SSOT addr] | [SSOT phone] | REFERENCE |
| WooCommerce | [Woo value] | [Woo addr] | [Woo phone] | MATCH/MISMATCH |
| Schema | [Schema] | [Schema] | [Schema] | MATCH/MISMATCH |
| Rank Math | [RM value] | [RM addr] | [RM phone] | MATCH/MISMATCH |

### Discrepancies
- [ ] WooCommerce phone: SSOT says "+48 123 456 789", Woo says "+48 987 654 321"
- [ ] Schema address: missing postalCode

### Action Items
- [ ] NEEDS_REVIEW: Verify actual business NAP data
- [ ] Update nap.md with verified data
- [ ] Sync WooCommerce settings with SSOT
```

## Procedura Sync

### 1. Verify NAP

Przed sync upewnij się że masz zweryfikowane NAP data:
- Skontaktuj się z klientem/business owner
- Lub użyj oficjalnego źródła (Google Business Profile)

### 2. Update SSOT

Zaktualizuj `docs/ssot/nap.md`:
```markdown
# NAP - NEEDS_REVIEW
Last Verified: YYYY-MM-DD
Source: [source of truth]

## Business NAP
- Name: [verified name]
- Address: [verified address]
- Phone: [verified phone]
- Email: [verified email]
- Hours: [verified hours]

## Status
CURRENT
```

### 3. Apply to WordPress

```bash
./run-wp.sh option update woocommerce_store_address "..."
./run-wp.sh option update woocommerce_store_city "..."
./run-wp.sh option update woocommerce_store_postcode "..."
./run-wp.sh option update woocommerce_store_phone "..."
```

### 4. Update Schema

Edytuj odpowiednie pliki w theme/plugin:
- `inc/site-shell.php` (LocalBusiness schema)
- SEO plugin settings

### 5. Verify

Uruchom `/nap-sync --verify`

## Zasady

- **One source of truth** - SSOT jest jedynym źródłem
- **Verify before sync** - zweryfikuj NAP przed zmianami
- **Document all sources** - dokumentuj skąd pochodzi każda wartość
- **Consistency everywhere** - NAP musi być spójny everywhere

## Powiązane

- `/merchant-data` - broader merchant data sync
- `/schema` - schema audit (LocalBusiness schema)
- `/policy-sync` - local-seo-consistency-policy
- `/truth-check` - general truth check
