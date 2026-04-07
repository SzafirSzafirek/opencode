---
name: /smoke
description: Smoke tests - podstawowe testy weryfikujące że critical paths działają
agent: reliability-guard
subtask: true
when: Po każdej zmianie, przed release
prerequisites:
  - Dostęp do strony
  - Znajomość critical user flows
---

# Smoke Tests

## Cel

Weryfikacja że critical paths działają po zmianach:
- Strona się ładuje bez błędów
- Critical functions działają
- No JS errors w console
- Forms działają
- Navigation działa

## Critical Paths

### E-commerce Flow
1. Homepage → Category → PDP → Add to Cart → Cart → Checkout
2. Homepage → Service Page → Contact Form

### Content Flow
1. Homepage → Blog → Single Post
2. Category → Pagination

### Technical Flow
1. Page loads without PHP errors
2. No 404 resources
3. Images load correctly
4. CSS renders correctly

## Procedura

### 1. Basic Load Tests

Sprawdź czy strony ładują się:

```bash
# Homepage
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/

# Category
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/product_cat/pierscionki/

# PDP (znajdź product ID)
./run-wp.sh post list --post_type=product --posts_per_page=1 --fields=ID
# Następnie:
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/?p=<ID>

# Cart
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/koszyk/
```

### 2. PHP Error Check

```bash
# Sprawdź error log
tail -50 app/public/wp-content/debug.log 2>/dev/null || echo "No debug.log"

# Sprawdź PHP errors
grep -i "error\|fatal\|warning" app/public/wp-content/debug.log 2>/dev/null | tail -20
```

### 3. Resource Check

Sprawdź czy critical resources ładują się:
- CSS files
- JS files
- Images
- Fonts

### 4. Console Errors Check

Użyj Playwright lub manual browser check:
- Brak JavaScript errors
- Brak Failed resource loads

### 5. Basic Functionality Check

- [ ] Homepage renders correctly
- [ ] Navigation links work
- [ ] Category page shows products
- [ ] PDP shows product details
- [ ] Add to cart works
- [ ] Cart page works
- [ ] Forms submit (contact, etc.)
- [ ] Mobile menu works
- [ ] Footer links work

### 6. Generate Report

```markdown
## Smoke Test Report - YYYY-MM-DD

### Basic Load Tests
| Page | Status | HTTP Code |
|------|--------|-----------|
| Homepage | PASS | 200 |
| /pierscionki/ | PASS | 200 |
| PDP | PASS | 200 |
| /koszyk/ | PASS | 200 |
| /kasa/ | PASS | 200 |

### PHP Errors
- None found

### Resource Check
- CSS: All loaded
- JS: All loaded
- Images: 1 missing (product ID 123 - need to fix)

### Console Errors
- None

### Functionality
- [x] Homepage
- [x] Navigation
- [x] Category page
- [x] PDP
- [x] Add to cart
- [ ] Cart - ISSUE: quantity selector not working
- [x] Mobile menu

### Action Items
- [ ] Fix missing image on product ID 123
- [ ] Investigate cart quantity selector issue

### Overall Status: PASS / FAIL / WARN
```

## Zasady

- **Fast** - smoke tests muszą być szybkie (< 5 min)
- **Critical paths only** - nie wszystko, tylko najważniejsze
- **Pass/fail clear** - jasne критерии pass/fail
- **Document issues** - dokumentuj wszystkie znalezione problemy

## Kiedy Smoke Tests Fail

1. **NIE kontynuuj** z release
2. **Napraw problemy** lub
3. **Escalate** do chief-operator jeśli problem jest poważny
4. **Dokumentuj** wszystkie failures

## Powiązane

- `/perf` - detailed performance audit
- `/release` - release checklist
- `/rollback` - jeśli smoke tests fail po release
- `/observe` - monitoring
