---
name: jewelry-product-seo
description: SEO dla produktów biżuterii - title, description, keywords, schema
---

# Jewelry Product SEO

## Specyfika produktów biżuteryjnych

- Materiał (złoto, srebro, platyna)
- Kamień (diament, szafir, rubin, itp.)
- Typ (pierścionek, kolczyki, naszyjnik, bransoletka)
- Waga
- Rozmiar

## Title Template

```
[Produkt] [Materiał] [Kamień] | [Marka] - Sklep Kraków
```

Przykład:
```
Pierścionek zaręczynowy złoty 585 diament 0.50ct | BigDIAMOND
```

## Meta Description

- Max 155-160 znaków
- Zawiera: produkt, materiał, kamień, lokalizację
- Call to action

## Schema Product

```json
{
  "@type": "Product",
  "name": "[nazwa produktu]",
  "description": "[opis]",
  "offers": {
    "@type": "Offer",
    "priceCurrency": "PLN"
  }
}
```

## Atrybuty do wypełnienia

- `pa_material` - materiał (złoto 585, srebro 925)
- `pa_kamien` - kamień (diament, szafir)
- `pa_waga` - waga w gramach
- `pa_rozmiar` - rozmiar
