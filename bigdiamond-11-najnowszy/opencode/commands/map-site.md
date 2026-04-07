---
name: /map-site
description: Mapuj strukturę strony - URLs, templates, page ownership, content inventory
agent: plan-architect
subtask: true
when: Przed audytem SEO, przed zmianami w strukturze, przy nowej sesji wymagającej zrozumienia architektury
prerequisites:
  - Dostęp do WP-CLI
  - Znajomość theme structure
---

# Map Site

## Cel

Utwórz kompletną mapę strony dokumentującą:
- Wszystkie public URLs
- Page templates i ownership
- Content types
- Taxonomy structure
- Navigation structure

## Procedura

### 1. Pages Inventory

```bash
./run-wp.sh post list --post_type=page --posts_per_page=100 --fields=post_title,post_name,post_status
./run-wp.sh post list --post_type=post --posts_per_page=100 --fields=post_title,post_name,post_status
```

### 2. Products Inventory

```bash
./run-wp.sh post list --post_type=product --posts_per_page=100 --fields=post_title,post_name,post_status
./run-wp.sh term list product_cat
./run-wp.sh term list product_tag
```

### 3. Custom Post Types

```bash
./run-wp.sh post list --post_type='any' --posts_per_page=100 --fields=post_type,post_title,post_name --post_status=publish --meta_key='_wp_page_template' 2>/dev/null || echo "No CPT found"
```

### 4. URL Structure Analysis

Zidentyfikuj:
- Homepage URL
- Shop/archive URL
- Cart URL (/koszyk/)
- Checkout URL (/kasa/ → /koszyk/)
- Account pages
- Service pages (na podstawie slug)
- Blog pages

### 5. Page Ownership Map

Dla każdej strony zidentyfikuj:
- Template/source (Elementor? Theme? Gutenberg?)
- Theme module owner (jeśli dotyczy)
- Content owner (kto zarządza treścią)

### 6. Navigation Structure

```bash
./run-wp.sh menu list 2>/dev/null || echo "No wp_nav_menu found"
```

## Output

Zapisz mapę do `docs/site-map/YYYY-MM-DD-site-map.md` z:
- URL inventory (tabela: URL, Type, Template, Owner)
- Taxonomy map
- Navigation structure
- Content gaps identification
- Recommendations

## Page Types Classification

| Type | Description | Example |
|------|-------------|---------|
| homepage | Strona główna | / |
| archive | Archiwum produktów/kategorii | /product_cat/... |
| pdp | Product Detail Page | /?p=123 lub produkt |
| service | Strona usługi | /usługa/... |
| editorial | Blog/post | /... |
| static | Strona statyczna | /o-nas |
| checkout | Cart/Checkout/Account | /koszyk/, /konto/ |
