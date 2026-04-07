# Merchant Sync

## Cel
Synchronizacja merchant data (Google Merchant, Facebook, payment) z SSOT.

## Input
- Zaktualizowane dane w `docs/ssot/merchant-data.md`
- Dostęp do WooCommerce admin
- Dostęp do merchant platforms

## Procedura

### 1. SSOT Update
1. Zaktualizuj `docs/ssot/merchant-data.md`
2. Ustaw status: CURRENT + timestamp
3. Zweryfikuj wszystkie pola (name, address, phone, website)

### 2. WooCommerce Sync
```bash
./run-wp.sh option update woocommerce_store_address "..."
./run-wp.sh option update woocommerce_store_city "..."
./run-wp.sh option update woocommerce_store_postcode "..."
./run-wp.sh option update woocommerce_store_phone "..."
```

### 3. Google Merchant Center
- Zaloguj do GMC panel
- Zaktualizuj product data zgodnie z SSOT
- Zweryfikuj feed

### 4. Facebook Catalog
- Zaktualizuj poprzez Meta Business Suite
- Zweryfikuj sync

### 5. Verification
Uruchom `/merchant-data --verify` i sprawdź:
- WooCommerce settings vs SSOT
- Product prices vs SSOT
- NAP consistency

## Output
- SSOT updated
- All platforms synchronized
- Verification report

## Blocker
- SSOT nie zweryfikowany z actual business data
- Discrepancy między platforms
- Missing required fields

## Rollback
Przywróć poprzednie wartości w WooCommerce i merchant platforms z backup configuration.
