# Release Checklist

**Status:** FINAL

**Last updated:** 2026-04-07

---

## Cel

Kompletna procedura przed wdrożeniem zmian na produkcję.

---

## Pre-Release Gates

### Gate 1: Truth Gate

- [ ] docs/ssot/merchant-data.md updated (imoje status corrected)
- [ ] docs/ssot/payment-methods.md updated (all ACTIVE methods confirmed)
- [ ] docs/ssot/product-attributes.md updated (DB-confirmed values)
- [ ] docs/ssot/materials-stones.md updated (canonical dictionary)
- [ ] No speculative values left as canonical
- [ ] Historical snapshots NOT modified (preserved as-is)

**Gate 1 Status:** ___ PASS / FAIL

---

### Gate 2: Schema Gate

- [ ] docs/ssot/schema-source-of-truth.md finalized (Rank Math as canonical)
- [ ] docs/policies/schema-publication-policy.md aligned
- [ ] No blocked claims in live Schema
- [ ] Rank Math LocalBusiness verified
- [ ] FAQPage Schema verified

**Gate 2 Status:** ___ PASS / FAIL

---

### Gate 3: Merchant Gate

- [ ] imoje ACTIVE confirmed (DB + Live site)
- [ ] All payment methods from live site documented
- [ ] Shipping methods verified
- [ ] docs/ssot/shipping-and-returns.md current

**Gate 3 Status:** ___ PASS / FAIL

---

### Gate 4: Smoke Gate

- [ ] Homepage load: PASS
- [ ] Category load: PASS
- [ ] PDP load: PASS
- [ ] Add to Cart: PASS
- [ ] Checkout open: PASS
- [ ] Payment methods (imoje, BACS, COD, local pickup): PASS
- [ ] Shipping methods (DPD, InPost, local pickup): PASS
- [ ] PHP errors check: PASS
- [ ] Mobile smoke: PASS

**Gate 4 Status:** ___ PASS / FAIL

Full smoke test in: `docs/runbooks/smoke-test.md`

---

### Gate 5: Rollback Gate

- [ ] Backup procedure documented
- [ ] Rollback commands ready
- [ ] Backup location known

**Backup location:** `/app/public/wp-content/backups/`

**Rollback command:**
```bash
cp -r /app/public/wp-content/backups/bigdiamond-prestige-YYYYMMDD/* /app/public/wp-content/themes/bigdiamond-prestige/
./run-wp.sh wc tool run clear_transients
```

**Gate 5 Status:** ___ PASS / FAIL

---

## Pre-Release Checklist

### Code Changes

- [ ] All code changes implemented
- [ ] Changes verified in local/staging
- [ ] No debug code left

### Documentation Updates

- [ ] SSOT files updated (if applicable)
- [ ] Policies updated (if applicable)
- [ ] Implementation docs updated (if applicable)

### Testing

- [ ] Smoke tests PASS (see Gate 4)
- [ ] No PHP errors in debug.log
- [ ] WooCommerce functioning

### Backup

- [ ] Full backup created
- [ ] Backup verified

---

## Deployment Steps

### 1. Create Backup

```bash
# Create timestamped backup
cp -r /app/public/wp-content/themes/bigdiamond-prestige /app/public/wp-content/backups/bigdiamond-prestige-$(date +%Y%m%d-%H%M%S)
```

### 2. Deploy Changes

```bash
# Via git pull or rsync
git pull
# OR
rsync -av --delete source/ destination/
```

### 3. Clear Cache

```bash
./run-wp.sh wc tool run clear_transients
./run-wp.sh cache flush
```

### 4. Post-Deploy Smoke Test

Run full smoke test from `docs/runbooks/smoke-test.md`

---

## Post-Release

- [ ] Smoke test PASS on production
- [ ] Monitor error logs
- [ ] Verify no 500 errors

---

## Release Report

Generated report location: `/app/public/wp-content/docs/release/YYYY-MM-DD-release-report.md`

**Report template:**

```markdown
# Release Report - [DATE]

## Changes
- [List of files changed]

## Gate Status
- Truth Gate: [PASS/FAIL]
- Schema Gate: [PASS/FAIL]
- Merchant Gate: [PASS/FAIL]
- Smoke Gate: [PASS/FAIL]
- Rollback Gate: [PASS/FAIL]

## Smoke Test Results
[From smoke-test.md output]

## Rollback Plan
[If needed]

## Notes
[Any issues or observations]
```

---

## Blocker Criteria

Release is BLOCKED if ANY gate FAILs:
- Smoke test FAIL
- Critical truth check violation
- No valid backup

---

## Rollback Procedure

If issues detected post-release:

1. **Immediate rollback:**
```bash
# Stop deployment
# Restore from backup
cp -r /app/public/wp-content/backups/bigdiamond-prestige-YYYYMMDD/* /app/public/wp-content/themes/bigdiamond-prestige/
./run-wp.sh wc tool run clear_transients
```

2. **Investigate issue**

3. **Fix and re-test**

4. **Redeploy only after all gates pass**

---

**End of file**
