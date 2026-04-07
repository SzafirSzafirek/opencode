---
name: lighthouse-budget
description: Lighthouse budget - limity performance i Core Web Vitals
---

# Lighthouse Budget

## Status

NEEDS_REVIEW - wymaga potwierdzenia z właścicielem biznesu

## Cele Core Web Vitals

| Metric | Target |
|--------|--------|
| LCP | < 2.5s |
| CLS | < 0.1 |
| INP | < 200ms |
| FCP | < 1.8s |

## Lighthouse Scores

| Category | Target |
|----------|--------|
| Performance | > 85 |
| Accessibility | > 90 |
| Best Practices | > 90 |
| SEO | > 95 |

## Budget limits

| Resource | Limit |
|----------|-------|
| Total page weight | < 1MB |
| JS total | < 300KB |
| CSS total | < 100KB |
| Images | WebP preferred |

## Narzędzia

- Lighthouse (Chrome DevTools)
- PageSpeed Insights
- WebPageTest

## Audyt

```bash
# Uruchom lighthouse na stronie
# https://pagespeed.web.dev/
```

## Zmniejszanie rozmiaru

- Minifikacja CSS/JS
- Lazy loading images
- WebP format
- Font-display: swap
- Preload critical resources
