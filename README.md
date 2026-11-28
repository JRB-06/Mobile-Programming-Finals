# Los Pollos Hermanos

**Los Pollos Hermanos** is a closed-market pharmacy e-commerce application for Android. Customers pick a pharmacist, then browse that pharmacist's products. It is a final project for the Mobile Programming course.

Customers search for a pharmacist, browse that pharmacist's products, manage a local cart, and place one Order. Pharmacists are Los Pollos Hermanos employees: Admin-managed catalog records with no login. Admins manage pharmacists, products, categories, stock, orders and customers.

> All products, medicines, payments, addresses, cards, stores, and prices are mock data. No real pharmacy or payment information is used.

## Key Features

- Email/password and Google authentication
- Customer and Admin roles; pharmacists are records, not accounts
- Pharmacist directory: select a pharmacist to see their products
- Purity-based tiers: Street, Pharma, and Blue Sky
- Product variants with individual prices and stock
- Offline shopping cart and cached catalog data
- Checkout split into one order per store
- Mock card validation and payment decline testing
- Order tracking, cancellation, and delivered-item reviews
- Pharmacist store and inventory management
- Admin approval, moderation, category, shipping, and statistics tools
- Supabase Row Level Security and database-enforced stock, money, and role rules

## Tech Stack

| Area | Technology |
|---|---|
| Mobile app | Flutter 3.50.1, Dart 3.14, Android |
| Backend | Supabase: Auth, Postgres, Storage, RPC |
| Security | Postgres Row Level Security and `security definer` functions |
| Local storage | sqflite for cart and offline cache |
| State management | Riverpod 3 |
| Routing | go_router |
| Models | freezed and json_serializable |
| Images | image_picker and cached_network_image |
| Formatting | intl |
| Connectivity | connectivity_plus |
| Testing | flutter_test and mocktail |

The Android target is compile/target SDK 36, minimum SDK 24, using JDK 17. The emulator target is a Pixel 8-style device with Android API 35.

## Architecture

The app is organized around repositories that separate feature code from Supabase and sqflite:

```text
Features/screens
      |
  Riverpod
      |
Repositories
   |       |
sqflite  Supabase
         Auth + Postgres + Storage
```

- Supabase is the source of truth.
- sqflite stores the local-only cart and cached catalog data.
- PostgreSQL RPC functions perform checkout, cancellation, status changes, and role changes atomically.
- Router guards improve navigation and role UX, but Supabase RLS provides the real security boundary.

Architecture and design details are available in:

- [Requirements](docs/PRD.md)
- [Screen architecture](docs/ARCHITECTURE.md)
- [Technical architecture](docs/technical/architecture.md)
- [Module interfaces](docs/technical/modules.md)
- [Domain glossary](docs/GLOSSARY.md)
- [Design handbook](docs/design/README.md)
- [Setup guide](docs/SETUP.md)
- [Architecture decisions](docs/adr/)

## Project Status

The repository currently contains the product requirements, screen flow, technical design, module contracts, mock data, and development setup. Flutter and Supabase implementation can proceed against the documented repository interfaces.

## Team and Responsibilities


- **Backend:** `supabase/`, `lib/models/`, and `lib/data/`
- **Frontend/design:** `lib/app/`, `lib/features/`, and design documentation

The repository interfaces and models in [modules.md](docs/technical/modules.md) are the cross-team contract. Any signature change should be called out clearly in a pull request.

## Contributors

- [JRB-06](https://github.com/JRB-06)
- [Zyxary](https://github.com/Zyxary)

## Mock Data

Mock datasets for users, addresses, cards, categories, stores, products, variants, orders, and reviews are in [docs/mock-data](docs/mock-data/). The data is intended for development, design previews, and demonstration only.