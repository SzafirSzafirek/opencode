---
name: jewelry-category-seo
description: SEO dla kategorii biżuterii - archiwum, listingi, filtrowanie
---

# Jewelry Category SEO

## Struktura kategorii

Wg WooCommerce:
- `product_cat` - główne kategorie
- `product_tag` - tagi produktów

## Typowe kategorie

- Pierscionki
- Kolczyki
- Bransoletki
- Naszyjniki
- Obrączki
- Biżuteria na zamówienie
- Usługi

## SEO dla kategorii

### Title
```
[Kategoria] | [Marka] - Sklep z biżuterią Kraków
```

### Meta description
```
Sklep z [kategorią] - szeroki wybór [materiał]. Biżuteria z gwarancją jakości. Dostawa Kraków i okolice.
```

### Content na stronie kategorii

- Opis kategorii
- Filtry (materiał, kamień, cena)
- Sortowanie
- Breadcrumbs

## Schema dla kategorii

```json
{
  "@type": "ItemList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "url": "https://example.com/kategoria/produkt1"
    }
  ]
}
```

## URL structure

```
/product_cat/pierscionki/
/product_cat/kolczyki/
/product_cat/bransoletki/
```
