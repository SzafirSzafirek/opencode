# Visual QA

## Cel
Weryfikacja wizualna po zmianach w CSS/UI.

## Input
- Lista zmian (jakie pliki zostały zmienione)
- Dostęp do local URL
- Playwright (opcjonalnie)

## Procedura

### 1. Before/After Comparison
Zrób screenshot przed zmianami (jeśli available).

### 2. Changed Files Review
Sprawdź zmienione pliki:
- `assets/css/*.css` - style
- `inc/*.php` - render logic
- `assets/js/*.js` - JS behavior

### 3. Page-by-Page Check
Dla każdej affected page:

#### Layout
- [ ] Header and navigation
- [ ] Footer
- [ ] Content alignment
- [ ] Spacing consistency
- [ ] Container widths

#### Components
- [ ] Buttons (size, color, hover)
- [ ] Forms (input styles, labels)
- [ ] Cards (shadows, borders, radius)
- [ ] Typography

#### Responsive
- [ ] Mobile (375px)
- [ ] Tablet (768px)
- [ ] Desktop (1280px)

### 4. Critical Paths
- [ ] Homepage → Category → PDP → Cart → Checkout
- [ ] Service pages
- [ ] Mobile menu

## Output
Report z:
- Screenshots (jeśli available)
- Visual bugs found
- Priority for each bug
- Action items

## Blocker
- Visual regression on critical path
- Broken functionality

## Rollback
Przywróć CSS/JS z backup jeśli visual regression jest kritična:
```bash
cp -r wp-content-backup/bigdiamond-prestige/assets/css/*.css app/public/wp-content/themes/bigdiamond-prestige/assets/css/
cp -r wp-content-backup/bigdiamond-prestige/assets/js/*.js app/public/wp-content/themes/bigdiamond-prestige/assets/js/
```
