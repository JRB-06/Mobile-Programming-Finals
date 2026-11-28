# Design handbook

This folder is for **designing Los Pollos Hermanos in Figma**. It describes what every screen must show and do, but not how it looks: the visual direction is **To be decided** and is yours to set.

Read in this order:

| File | What's in it |
|---|---|
| [brief.md](brief.md) | The product, who uses it, the theme, and what's fixed vs. open |
| [navigation.md](navigation.md) | Every screen per role, how they connect, and the nav bars |
| [screens.md](screens.md) | **The main reference.** For each screen: purpose, content (with example data), actions, states and rules |
| [components.md](components.md) | Reusable pieces to build once in Figma (cards, badges, chips, banners…) with their variants and states |
| [content.md](content.md) | Copy and formats: money, purity, statuses, dates, error and empty-state messages |

Also useful:
- `docs/ARCHITECTURE.md`: the flow you wrote, now extended.
- `docs/GLOSSARY.md`: the official names. Use these words in the UI, e.g. **Store**, not "shop".
- `docs/mock-data/`: real example data to put in mockups.

## Suggested Figma setup

- **Frame:** Pixel 8, **412 × 915**. That's the emulator we test on. Design at 1x; Flutter uses the same logical pixels (dp).
- **Note:** the final APK will also run on a **Samsung Galaxy Tab A7** (10.4" tablet, about **800 × 1280 dp** in portrait). Design for the Pixel first, and add one check frame at 800 × 1280 for a few key screens (Home, Store page, Product page, Cart). Content shouldn't just stretch edge to edge: cap the width of text and forms, and let grids add columns.
- **Pages:**
  - `Cover`
  - `Foundations` (color, type, spacing, icons)
  - `Components`
  - `Auth`
  - `Customer`
  - `Pharmacist`
  - `Admin`
  - `Prototype`
- **Frame names:** use the screen ids from screens.md (e.g. `C-04 Store page`). Then the code and the design can point at the same screen.
- **States:** draw each screen's loading, empty, error and offline states as extra frames next to it (`C-04 Store page / empty`), or reuse the shared state components.
- **Platform:** Android only, with Material 3 as the base. Flutter's widgets are Material, so Material-shaped components are cheapest to build. Custom styling on top is fine.

## What's fixed vs. open

| Fixed (the backend and requirements depend on it) | Open (your call) |
|---|---|
| The screens, their content, the actions, and the order of the flows | Colors, typography, shapes, illustration, imagery, motion |
| The three roles and what each can see | Layout inside each screen |
| The data each screen shows (names, prices, statuses…) | Icon set, logo, splash art |
| The Tier names and thresholds (Street / Pharma / Blue Sky) | How Tiers and statuses look |
| Money format `₱1,234.50` | Light or dark theme (dark mode is a stretch goal) |
| Minimum tap target **48 × 48** | Whether lists are cards, rows or grids |

When the visual direction is settled, record it in `DESIGN.md` at the repo root (colors, type scale, spacing, radii), so the Flutter theme can copy the exact values.
