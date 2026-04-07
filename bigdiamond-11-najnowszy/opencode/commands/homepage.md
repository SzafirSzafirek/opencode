---
name: /homepage
description: Praca z homepage - manual-merge surface, data-driven z real pages/terms/products
agent: plan-architect
subtask: true
when: Przy zmianach na homepage, optymalizacji home, dodawaniu nowych sekcji
prerequisites:
  - Znajomość inc/homepage.php
  - Znajomość assets/css/homepage.css
  - Rozumienie data-driven approach
---

# Homepage Work

## Charakterystyka Surface

**Homepage to manual-merge surface** - dane pochodzą z real pages, terms, products, contact data. Nie są to hardcorowane wartości.

## Owned by

- `inc/homepage.php` - logika renderowania
- `assets/css/homepage.css` - style
- `assets/js/theme.js` - shared shell behavior

## Sekcje Homepage

Wg `docs/layout-system.md`:
1. Hero
2. Entry cards
3. Featured products
4. Story split z craft/services cards
5. Trust band
6. Visit/contact block
7. Shared prefooter/footer

## Procedura Pracy

### 1. Analiza Obecnego Stanu

- Przeczytaj `inc/homepage.php` - zrozum skąd pochodzą dane
- Sprawdź jakie strony/terms/products są używane
- Zidentyfikuj sekcje które wymagają zmian

### 2. Zmiany Vizualne (CSS)

1. Zidentyfikuj sekcję do zmiany
2. Edytuj `assets/css/homepage.css`
3. Uruchom `node --check assets/css/homepage.css` (jeśli istnieje)
4. Zweryfikuj wizualnie

### 3. Zmiany w Strukturze (PHP)

1. Przeczytaj pełny `inc/homepage.php`
2. Zidentyfikuj gdzie dodać zmianę
3. Stosuj hook-first jeśli możliwe
4. Uruchom `php -l inc/homepage.php`
5. Uruchom `composer run phpcs`

### 4. Zmiany w Danych

1. Identyfikuj source data (strona, term, produkt)
2. Nie dodawaj hardcorowanych wartości
3. Jeśli potrzebujesz nowych danych, dodaj source page/term
4. Zaktualizuj SSOT jeśli dotyczy

## Zasady

- **Preserve slug-driven sourcing** - nie hardcoruj
- **Avoid hardcoded promo copy** - używaj real content
- **Keep custom section order** - chyba że redesign to zmienia
- **Read full file before editing** - inc/homepage.php jest high-risk

## Walidacja

Po zmianach:
1. Homepage się ładować bez błędów
2. Wszystkie sekcje renderują się poprawnie
3. Mobile layout jest OK
4. Performance nie pogorszył się znacząco

## Powiązane

- `/smoke` - smoke tests po zmianach
- `/perf` - performance check
