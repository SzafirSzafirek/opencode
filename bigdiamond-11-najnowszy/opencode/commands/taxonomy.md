---
name: /taxonomy
description: Praca z taksonomią - kategorie produktów, atrybuty, tagi, hierarchical structure
agent: plan-architect
subtask: true
when: Przy zmianach w strukturze kategorii, atrybutów produktów, reorganizacji taxonomy
prerequisites:
  - Dostęp do WP-CLI
  - Znajomość WooCommerce product taxonomy
  - Znajomość docs/ssot/product-attributes.md
---

# Taxonomy

## Cel

Praca z WooCommerce taxonomy:
- Product categories (product_cat)
- Product tags (product_tag)
- Product attributes (pa_*)
- Custom taxonomies

## Procedura

### 1. Inventory

```bash
# Lista kategorii
./run-wp.sh term list product_cat

# Lista tagów
./run-wp.sh term list product_tag

# Lista atrybutów
./run-wp.sh wc attribute list

# Lista produktów per kategoria
./run-wp.sh post list --post_type=product --posts_per_page=100 --fields=ID,post_title
```

### 2. SSOT Check

Sprawdź `docs/ssot/product-attributes.md`:
- Które atrybuty są zdefiniowane?
- Jakie są allowed values?
- Jaka jest hierarchical structure?

### 3. Category Operations

#### Create Category
```bash
./run-wp.sh term create product_cat --name="Nazwa" --description="Opis"
```

#### Update Category
```bash
./run-wp.sh term update product_cat <ID> --name="Nowa Nazwa" --description="Nowy opis"
```

#### Delete Category
```bash
./run-wp.sh term delete product_cat <ID>
```

#### Set Parent
```bash
./run-wp.sh term update product_cat <ID> --parent=<parent_id>
```

### 4. Attribute Operations

#### List Attributes
```bash
./run-wp.sh wc attribute list
```

#### Create Attribute
```bash
./run-wp.sh wc attribute create "material" --label="Materiał" --type=select
```

#### Add Terms to Attribute
```bash
./run-wp.sh wp term create pa_material --name="Złoto 585"
./run-wp.sh wp term create pa_material --name="Srebro 925"
```

### 5. Bulk Operations

Dla bulk updates użyj WP-CLI eval lub custom script:

```bash
./run-wp.sh eval-file bulk-taxonomy-update.php
```

## Struktura Taksonomii

Wg SSOT i projektu:
```
product_cat
├── Biżuteria
│   ├── Pierscionki
│   ├── Kolczyki
│   ├── Bransoletki
│   ├── Naszyjniki
│   └── Obrączki
├── Usługi
│   ├── Pracownia złotnicza
│   ├── Biżuteria na zamówienie
│   └── Naprawa biżuterii
└── [inne]
```

## Atrybuty Produktów

Typowe atrybuty dla biżuterii:
- `pa_material` - Materiał (Złoto 585, Srebro 925, etc.)
- `pa_kamien` - Kamień (Diament, Szafir, etc.)
- `pa_kolor` - Kolor (Złoty, Srebrny, Różowe złoto)
- `pa_rozmiar` - Rozmiar
- `pa_waga` - Waga

## Zasady

- **SSOT first** - używaj SSOT jako template
- **Preserve hierarchy** - nie psuj parent-child relationships
- **Bulk with care** - bulk operations mogą być niebezpieczne
- **Backup before** - zrób backup przed bulk changes

## Walidacja

Po zmianach:
1. Sprawdź czy produkty mają poprawne kategorie
2. Sprawdź czy atrybuty są poprawnie przypisane
3. Uruchom `/smoke` tests
4. Zweryfikuj w WooCommerce admin

## Powiązane

- `/category` - praca z category pages
- `/product-template` - praca z PDP
- `/bulk-ops` - bulk operations
- `/truth-check` - walidacja taxonomy vs SSOT
