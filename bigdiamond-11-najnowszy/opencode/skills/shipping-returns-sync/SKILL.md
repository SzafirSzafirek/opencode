---
name: shipping-returns-sync
description: Synchronizacja polityki wysyłki i zwrotów z SSOT i merchant platforms
---

# Shipping & Returns Sync

## Zasady

1. Polityka wysyłki musi być jasna
2. Polityka zwrotów musi być zgodna z prawem EU
3. Terminy muszą być realistic
4. Cen y muszą być widoczne przed checkout

## Elementy polityki

- Czas realizacji (lead times)
- Koszty wysyłki
- Metody wysyłki
- Śledzenie przesyłki
- Polityka zwrotów (14 dni w EU)
- Reklamacje

## WooCommerce settings

```bash
./run-wp.sh option get woocommerce_shipping_cost_requires_address
./run-wp.sh option get woocommerce_enable_shipping_calc
```

## SSOT

Wg `docs/ssot/shipping-and-returns.md` - NEEDS_REVIEW

## E-commerce compliance

- Prawo do zwrotu 14 dni (EU)
- Informacja o kosztach zwrotu
- Jasne warunki
