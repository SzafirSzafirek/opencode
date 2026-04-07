---
name: /baseline
description: Utwórz lub aktualizuj baseline projektu - pełny inwentarz runtime, pluginów, theme, SSOT status
agent: plan-architect
subtask: true
when: Pierwsza sesja OpenCode lub po znaczących zmianach infrastrukturalnych
prerequisites:
  - Dostęp do Local WP-CLI
  - Dostęp do Local MySQL
  - Znajomość stacka
---

# Baseline

## Cel

Utwórz kompletny baseline projektu dokumentujący aktualny stan:
- Stack (WordPress, WooCommerce, PHP, MySQL)
- Active plugins i wersje
- Theme i wersja
- SSOT files i ich status (CURRENT / NEEDS_REVIEW)
- Policies files i ich status
- Database status (tabele, rozmiar, HPOS)
- High-risk files

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

### 3. SSOT Status Check

Sprawdź które SSOT files istnieją i jaki mają status:
- CURRENT - zweryfikowane i aktualne
- NEEDS_REVIEW - wymaga weryfikacji
- MISSING - plik nie istnieje

### 4. Policies Status Check

Sprawdź które policies files istnieją:
- CURRENT - zweryfikowane
- NEEDS_REVIEW - wymaga weryfikacji
- MISSING - plik nie istnieje

### 5. High-Risk Files Check

Zweryfikuj istnienie i daty modyfikacji high-risk files:
- inc/homepage.php
- inc/assets.php
- inc/site-shell.php
- inc/woocommerce/hooks.php
- inc/woocommerce/personalization.php
- assets/css/woocommerce-single-product.css
- assets/js/theme.js
- assets/js/woocommerce-single-product.js

## Output

Zapisz baseline do `docs/baseline/YYYY-MM-DD-baseline.md` z:
- Timestamp
- Full stack inventory
- SSOT status matrix
- Policies status matrix
- High-risk files inventory
- Action items (co wymaga uwagi)

## Przykładowy Output Structure

```markdown
# Baseline - YYYY-MM-DD

## Stack
- WordPress: X.X
- WooCommerce: X.X (HPOS: yes/no)
- PHP: X.X
- MySQL: X.X
- Theme: bigdiamond-prestige vX.X

## Active Plugins
| Plugin | Version | Status |
|--------|---------|--------|
| woocommerce | 10.3.8 | active |
| ... | ... | ... |

## SSOT Status
| File | Status | Last Verified |
|------|--------|--------------|
| nap.md | NEEDS_REVIEW | - |
| merchant-data.md | CURRENT | 2026-04-07 |
| ... | ... | ... |

## Action Items
- [ ] NEEDS_REVIEW: nap.md - brak danych w repo
- [ ] ...
```
