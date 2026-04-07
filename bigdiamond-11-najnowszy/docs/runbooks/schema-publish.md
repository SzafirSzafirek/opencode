# Schema Publish

**Status:** FINAL

**Last updated:** 2026-04-07
**Canonical Schema Engine:** Rank Math SEO

---

## Decision Tree

```
Is schema type covered by Rank Math?
├── YES → Use Rank Math configuration
│         (No custom JSON-LD needed)
│
├── YES but Rank Math output incorrect/incomplete?
│   └── Custom JSON-LD override via policy approval
│       (Document reason in schema-publish.md)
│
└── NO (Rank Math doesn't cover this type)?
    └── Custom JSON-LD with policy approval
        (Requires explicit approval from policy owner)
```

---

## Rank Math Schema Types

Rank Math automatically generates Schema for:

| Strona | Schema Types | Rank Math Coverage |
|--------|-------------|-------------------|
| Homepage | LocalBusiness | ✓ Full |
| Contact | LocalBusiness | ✓ Full |
| PDP | Product | ✓ Full |
| FAQ | FAQPage | ✓ Full |
| Service pages | Service | ✓ Full |
| Category | CollectionPage | ⚠ Partial |
| Blog posts | Article | ✓ Full |

---

## Rank Math Configuration Steps

### 1. Pre-Publication Audit

Check `docs/ssot/schema-source-of-truth.md`:
- [ ] Template is complete
- [ ] All required fields present
- [ ] No blocked claims
- [ ] Status: CURRENT

### 2. LocalBusiness Configuration

Rank Math → General Settings → Local Business:

- [ ] Name: "BigDIAMOND"
- [ ] Address: "ul. Starowiślna 6/1B, 31-032 Kraków"
- [ ] Phone: "+48 574 470 119"
- [ ] Email: "biuro@bigdiamond.pl"
- [ ] Hours: Mon-Fri 10:00-19:00, Sat 10:00-14:00
- [ ] Logo uploaded
- [ ] Image uploaded

### 3. WooCommerce Integration

Rank Math → WooCommerce:

- [ ] Product Schema enabled
- [ ] Brand: "BigDIAMOND"
- [ ] Price currency: PLN
- [ ] Seller: BigDIAMOND

### 4. FAQ Schema

Use Rank Math FAQ block (not manual JSON-LD):

- [ ] Add FAQ block to page
- [ ] Add questions/answers
- [ ] Verify Schema generates automatically

### 5. Service Schema

Rank Math auto-detects service pages. Verify:

- [ ] Service pages have correct schema type
- [ ] Address/phone consistent with LocalBusiness
- [ ] Description accurate

---

## Custom JSON-LD Exceptions

Custom JSON-LD is ALLOWED only when:

1. **Rank Math doesn't cover the schema type**
2. **Controlled override needed (with policy approval)**
3. **Special rich result requirements**

### Exception Process

1. Document reason for custom JSON-LD
2. Get policy approval
3. Implement in appropriate hook location:
   - Homepage: `inc/site-shell.php` or `inc/homepage.php`
   - PDP: `inc/woocommerce/single-product-layout.php`
   - Service pages: `inc/service-pages.php`

### Exception Template

```json
{
  "@context": "https://schema.org",
  "@type": "[TYPE]",
  "[fields]": "[values]",
  "_meta": {
    "exception": true,
    "reason": "[why not Rank Math]",
    "approved_by": "[owner]",
    "date": "[YYYY-MM-DD]"
  }
}
```

---

## JSON-LD Validation

Before publishing any Schema:

```bash
# Validate at https://validator.schema.org/
# Or use Google Rich Results Test: https://search.google.com/test/rich-results
```

---

## Verification Commands

```bash
# Check for JSON-LD in theme files
grep -r "application/ld+json" app/public/wp-content/themes/bigdiamond-prestige/inc/

# Check Rank Math Schema output
# Visit page and view source, search for ld+json
```

---

## Implementation Locations

| Page Type | Primary Location | Notes |
|-----------|-----------------|-------|
| Homepage | Rank Math (auto) | Verify in Rank Math settings |
| PDP | Rank Math (auto from WooCommerce) | Verify WooCommerce integration |
| FAQ | Rank Math FAQ block | Use block, not manual JSON-LD |
| Service pages | Rank Math (auto) | Verify detection |
| Contact | Rank Math (auto) | Verify in Rank Math settings |
| Custom (exception) | `inc/site-shell.php` or page-specific | Requires policy approval |

---

## Blocked Claims

The following MUST NOT appear in Schema descriptions:

| Claim | Why Blocked |
|-------|-------------|
| "30-50% niższa cena" | NEEDS_OWNER_CONFIRMATION |
| "85% mniej wody" | NEEDS_OWNER_CONFIRMATION |
| "70% ślad węglowy" | NEEDS_OWNER_CONFIRMATION |
| "certyfikat SCS-007" | NEEDS_OWNER_CONFIRMATION |
| "najlepszy jubiler" | Superlative without evidence |
| "ekskluzywna biżuteria" | Unverified claim |

---

## Post-Publication Checklist

- [ ] Schema validates at validator.schema.org
- [ ] No blocked claims present
- [ ] All required fields populated
- [ ] Consistent with page content
- [ ] SSOT updated (if changed)

---

## Rollback

If Schema issues detected:

1. Remove JSON-LD block
2. Restore previous Rank Math configuration (if changed)
3. Re-validate

```bash
# If custom JSON-LD was added:
# Remove from appropriate hook/template file
# Clear cache: ./run-wp.sh wc tool run clear_transients
```

---

**End of file**
