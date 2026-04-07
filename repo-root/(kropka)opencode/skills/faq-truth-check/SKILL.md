---
name: faq-truth-check
description: Walidacja FAQ - zgodność z faq-source.md i faq-validation.md
---

# FAQ Truth Check

## Zasady

1. FAQ musi być zgodny z `docs/ssot/faq-source.md`
2. Odpowiedzi muszą być factual i verificable
3. Nie dodawać FAQ bez źródła w SSOT

## Walidacja

1. Znajdź FAQ na stronie
2. Porównaj z faq-source.md
3. Sprawdź czy odpowiedzi są aktualne
4. Waliduj przeciw faq-validation.md

## Typowe FAQ

- Czas realizacji
- Gwarancja
- Płatność i wysyłka
- Zwroty i reklamacje
- Personalizacja

## Format FAQ

```html
<div class="faq-item">
  <h3>Pytanie</h3>
  <p>Odpowiedź</p>
</div>
```

## Narzędzia

```bash
grep -r "faq" app/public/wp-content/themes/bigdiamond-prestige/inc/ --include="*.php"
grep -r "accordion" app/public/wp-content/themes/bigdiamond-prestige/inc/ --include="*.php"
```
