# Los Pollos Hermanos: Flutter final project (multi-store pharmacy)

Two-person team. **Backend** owns `supabase/`, `lib/models/`, `lib/data/`. **Frontend/design** owns `lib/app/`, `lib/features/`. The contract between them is `docs/design/modules.md` (models plus repository interfaces). Changing a signature is a cross-team change: call it out in the PR.

- Screen flow: `ARCHITECTURE.md`. Requirements: `docs/PRD.md`. Technical design: `docs/design/architecture.md`. Domain terms: `docs/GLOSSARY.md`. Env setup and Windows gotchas: `docs/SETUP.md`.
- Role security lives in Supabase RLS. Router guards and hidden buttons are UX only.
- Supabase is the source of truth. sqflite is an offline cache plus local-only data (cart, drafts, recent searches).
- All products, payments, addresses and cards are fictional mock data. Store card brand + last4 only.
- Run with `flutter run --dart-define-from-file=env.json` (`env.json` is git-ignored). Use `dart run build_runner watch -d` for freezed/riverpod codegen.
