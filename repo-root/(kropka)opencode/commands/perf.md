---
name: /perf
description: Performance audit - Core Web Vitals, Lighthouse, page speed analysis
agent: reliability-guard
subtask: true
when: Przed release, przy optymalizacji speed, przy spadku performance
prerequisites:
  - Dostęp do strony (local lub staging)
  - Znajomość performance-critical assets
---

# Performance

## Cel

Performance audit obejmujący:
- Core Web Vitals (LCP, CLS, INP)
- Lighthouse audit
- Render-blocking resources
- Image optimization
- JS/CSS performance
- Server response time

## Procedura

### 1. Environment Check

Określ czy to:
- Local development
- Staging
- Production

### 2. Core Web Vitals Check

Zmierz CWV na kluczowych stronach:
- Homepage
- Category page
- PDP
- Cart
- Checkout

Metrics targets:
- LCP (Largest Contentful Paint): < 2.5s
- CLS (Cumulative Layout Shift): < 0.1
- INP (Interaction to Next Paint): < 200ms
- FCP (First Contentful Paint): < 1.8s

### 3. Lighthouse Audit

Dla każdej strony sprawdź:
- Performance score
- Accessibility score
- Best Practices score
- SEO score

### 4. Critical Path Analysis

Sprawdź:
- Render-blocking CSS/JS
- Preload/prefetch usage
- Image lazy loading
- Font loading strategy

### 5. Image Audit

```bash
# Znajdź duże obrazy
find app/public/wp-content/uploads -name "*.jpg" -size +500k 2>/dev/null

# Sprawdź WebP usage
grep -r "\.jpg\|\.png" app/public/wp-content/themes/bigdiamond-prestige/assets/ --include="*.php"
```

Sprawdź:
- Czy obrazy są w WebP?
- Czy mają width/height attributes?
- Czy są lazy-loaded?
- Czy są zoptymalizowane?

### 6. Generate Report

```markdown
## Performance Audit - YYYY-MM-DD

### Environment
- Type: local/staging/production
- URL: https://...

### Core Web Vitals

| Page | LCP | CLS | INP | FCP | Status |
|------|-----|-----|-----|-----|--------|
| Homepage | 2.1s | 0.05 | 120ms | 1.2s | PASS |
| /pierscionki/ | 3.2s | 0.12 | 180ms | 1.5s | FAIL |
| PDP | 2.8s | 0.08 | 200ms | 1.4s | WARN |

### Lighthouse Scores

| Page | Performance | Accessibility | Best Practices | SEO |
|------|-------------|---------------|----------------|-----|
| Homepage | 85 | 90 | 95 | 100 |
| ... | ... | ... | ... | ... |

### Critical Issues

1. [HIGH] LCP > 2.5s on /pierscionki/ - image not optimized
2. [MEDIUM] CLS > 0.1 on Homepage - font loading causes shift
3. [LOW] Render-blocking JS in footer

### Recommendations

1. Convert product images to WebP
2. Add font-display: swap
3. Defer non-critical JS
4. Add preload for hero image

### Action Items
- [ ] Convert images to WebP on category pages
- [ ] Fix font loading strategy
```

## Zasady

- **Mobile-first** - mierz na mobile conditions
- **Real content** - testuj z real content, nie empty pages
- **Repeatability** - używaj consistent methodology
- **Document baselines** - dokumentuj before/after

## Performance Budget

Dla BigDIAMOND (do potwierdzenia):
- Total page weight: < 1MB
- Time to Interactive: < 3s
- Largest Contentful Paint: < 2.5s

## Powiązane

- `/smoke` - basic smoke tests
- `/release` - release checklist (zawiera perf check)
- `/observe` - monitoring po release
