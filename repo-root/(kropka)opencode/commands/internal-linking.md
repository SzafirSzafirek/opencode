---
name: /internal-linking
description: Audit internal linking - link equity distribution, orphaned content, topical authority
agent: plan-architect
subtask: true
when: Przy audycie SEO, przed/po zmianach w strukturze, przy budowaniu topical authority
prerequisites:
  - Dostęp do WP-CLI
  - Znajomość page structure
---

# Internal Linking

## Cel

Audit internal linking patterns:
- Link equity distribution
- Orphaned content identification
- Topical authority building
- Navigation consistency
- Anchor text analysis

## Dostępne Tryby

- `full-site` - cała strona
- `homepage` - tylko homepage links
- `products` - tylko product links
- `service-pages` - tylko service page links

## Procedura

### 1. Page Inventory

```bash
./run-wp.sh post list --post_type=page --posts_per_page=200 --fields=ID,post_title,post_name,post_status
./run-wp.sh post list --post_type=product --posts_per_page=200 --fields=ID,post_title,post_name
```

### 2. Crawl Internal Links

Dla każdej strony sprawdź:
- Links out (internal links na stronie)
- Links in (ile stron linkuje do tej strony)
- Anchor text distribution

### 3. Orphaned Content Check

Orphaned content = strony bez żadnych internal links do nich.

```bash
# Zidentyfikuj strony bez linków przychodzących
# (wymaga external tool lub script)
```

### 4. Link Equity Analysis

Sprawdź czy:
- Important pages mają enough internal links
- Deep pages są accessible w < 3 clicks
- Product pages są linked from category pages
- Service pages są linked from homepage/navigation

### 5. Navigation Structure Check

```bash
./run-wp.sh menu list 2>/dev/null
```

Sprawdź:
- Czy wszystkie important pages są w navigation?
- Czy menu hierarchy odzwierciedla content hierarchy?
- Czy breadcrumb są poprawne?

### 6. Generate Report

```markdown
## Internal Linking Audit - YYYY-MM-DD
Scope: full-site

### Summary
- Total pages: 150
- Orphaned pages: 5
- Pages with < 3 internal links: 12
- Pages with > 10 internal links: 8

### Orphaned Content
| Page | Type | Last Updated |
|------|------|--------------|
| /old-service/ | page | 2024-01-15 |
| ... | ... | ... |

### Top Pages by Incoming Links
| Page | Incoming Links | Position |
|------|----------------|----------|
| Homepage | 45 | 1 |
| /pierscionki/ | 23 | 2 |
| ... | ... | ... |

### Deep Pages (>3 clicks from homepage)
| Page | Click Depth | Recommendation |
|------|------------|----------------|
| /product/... | 4 | Add link from /pierscionki/ |
| ... | ... | ... |

### Action Items
- [ ] Add internal links to 5 orphaned pages
- [ ] Fix breadcrumb on /service-page/
```

## Zasady

- **Topical clusters** - linkuj related content razem
- **Anchor text diversity** - nie nadużywaj exact match anchors
- **Navigation + content** - używaj both navigation i content links
- **Preserve UX** - linki muszą mieć sens dla użytkownika

## Best Practices dla BigDIAMOND

- Homepage → Category pages → Product pages hierarchy
- Service pages linked from homepage i navigation
- Related products na PDP
- Service cards na homepage linkują do service pages
- Blog posts linkują do products/services gdzie relevant

## Powiązane

- `/map-site` - mapowanie struktury strony
- `/content-gap` - analiza content gaps
- `/truth-check` - walidacja link content
- `/smoke` - smoke tests
