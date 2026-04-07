---
name: krakow-local-seo
description: Local SEO dla Krakowa - Google Business Profile, NAP, local citations
---

# Krakow Local SEO

## Lokalizacja

- Miasto: Kraków
- Województwo: Małopolskie
- Kraj: Polska

## NAP dla Local SEO

NAPE muszą być spójne:
- Google Business Profile
- Strona internetowa
- Facebook Page
- Directory listings (Foursquare, Yelp, etc.)
- Mapy (Google Maps, Apple Maps)

## Schema dla Local Business

```json
{
  "@type": "LocalBusiness",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Kraków",
    "addressRegion": "Małopolskie",
    "addressCountry": "PL"
  }
}
```

## Citation sources

- Google Business Profile
- Facebook
- Instagram
- Yelp
- Foursquare
- TripAdvisor
- Zumi
- Panorama Firm

## Walidacja

```bash
# Sprawdź NAP w schema
grep -r "Kraków" app/public/wp-content/themes/bigdiamond-prestige/inc/
```
