# Baseline

## Cel
Utworzenie lub aktualizacja kompletnego baseline projektu dokumentującego aktualny stan runtime.

## Input
- Dostęp do Local WP-CLI (`./run-wp.sh`)
- Dostęp do Local MySQL (`./run-sql.sh`)

## Procedura

### 1. Stack Inventory
```bash
./run-wp.sh --version
./run-wp.sh plugin list --status=active --format=table
./run-wp.sh theme list --status=active
```

### 2. Database Status
```bash
./run-sql.sh "SELECT COUNT(*) as table_count FROM information_schema.tables WHERE table_schema = 'local';"
./run-sql.sh "SELECT table_name, (data_length + index_length) as size_bytes FROM information_schema.tables WHERE table_schema = 'local' ORDER BY size_bytes DESC LIMIT 10;"
```

### 3. SSOT Status
Sprawdź `docs/ssot/` - które pliki istnieją i ich status (CURRENT / NEEDS_REVIEW / MISSING).

### 4. Policies Status
Sprawdź `docs/policies/` - które pliki istnieją i ich status.

## Output
`docs/baseline/YYYY-MM-DD-baseline.md` zawierający:
- Timestamp
- Full stack inventory
- SSOT status matrix
- Policies status matrix
- Action items

## Blocker
- Brak dostępu do WP-CLI lub MySQL

## Rollback
Not applicable - to jest read-only inventory.
