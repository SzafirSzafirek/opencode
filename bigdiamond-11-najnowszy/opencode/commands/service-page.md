---
name: /service-page
description: Praca z service/local pages - render-layer page patterns, structured prose
agent: plan-architect
subtask: true
when: Przy zmianach w stronach usługowych (pracownia złotnicza, biżuteria na zamówienie, naprawa)
prerequisites:
  - Znajomość inc/service-pages.php
  - Znajomość assets/css/service-pages.css
  - Znajomość SSOT service-catalog.md
---

# Service Page Work

## Charakterystyka Surface

**Service pages to render-layer page patterns** - rendering jest kontrolowany przez `inc/service-pages.php` na podstawie page slugs.

## Owned by

- `inc/service-pages.php` - render orchestration
- `assets/css/service-pages.css` - styles

## Znane Service Pages

Wg nazewnictwa w projekcie:
- `pracownia-zlotnicza` - pracownia złotnicza
- `bizuteria-na-zamowienie` - biżuteria na zamówienie
- `naprawa-bizuterii` - naprawa biżuterii

## Sekcje Service Page

Wg `docs/layout-system.md`:
- Hero/page intro
- Structured prose
- Related services
- Proof/local block
- CTA band
- FAQ accordion (gdzie applicable)

## Procedura Pracy

### 1. Analiza Obecnego Stanu

```bash
./run-wp.sh post list --post_type=page --posts_per_page=100 --fields=post_title,post_name,post_content
```

- Przeczytaj `inc/service-pages.php`
- Zidentyfikuj slugs obsługiwane przez service-pages module
- Sprawdź `docs/ssot/service-catalog.md` (jeśli istnieje)

### 2. Zmiany CSS

1. Edytuj `assets/css/service-pages.css`
2. Dodaj style dla specyficznych sekcji

### 3. Zmiany w Render Logic

1. Przeczytaj pełny `inc/service-pages.php`
2. Wprowadź zmiany w render layer
3. Uruchom `php -l inc/service-pages.php`
4. Nie zmieniaj DB content dla layout fixes

### 4. Zmiany w Treści

1. Identyfikuj source content
2. Używaj real headings i SEO content
3. Aktualizuj SSOT service-catalog.md jeśli dotyczy
4. Nie dodawaj niepotwierdzonych claims

## Zasady

- **Preserve real headings and SEO content** - nie nadpisuj treści SEO
- **Use render-layer modules** - nie edytuj DB content dla layout fixes
- **Validate against SSOT** - sprawdź claims przeciw policies
- **Service-specific content** - każda usługa ma specyficzne requirements

## Walidacja

1. Service page ładuje się poprawnie
2. Wszystkie sekcje renderują się
3. FAQ accordion działa (jeśli present)
4. Mobile layout OK
5. CTAs kierują do poprawnych destinations

## Powiązane

- `/smoke` - smoke tests
- `/faq-truth` - walidacja FAQ
- `/truth-check` - walidacja treści
- `/policy-sync` - sprawdzenie policies
