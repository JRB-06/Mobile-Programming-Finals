# Los Pollos Hermanos: Flutter final project (single-seller online pharmacy)

Pharmacists are Admin-managed catalog records (a `pharmacists` table, `products.pharmacist_id`), not users: no login, no role, no Stores. Customers pick a pharmacist on Home, then browse that pharmacist's Products. The Cart is global and checkout creates one Order.

Two-person team. **Backend** owns `supabase/`, `lib/models/`, `lib/data/`. **Frontend/design** owns `lib/app/`, `lib/features/`. The contract between them is `docs/technical/modules.md` (models plus repository interfaces). Changing a signature is a cross-team change: call it out in the PR.

- Screen flow: `docs/ARCHITECTURE.md`. Requirements: `docs/PRD.md`. Technical design: `docs/technical/architecture.md`. Domain terms: `docs/GLOSSARY.md`. Env setup and Windows gotchas: `docs/SETUP.md`.
- Role security lives in Supabase RLS. Router guards and hidden buttons are UX only.
- Supabase is the source of truth. sqflite is an offline cache plus local-only data (cart, drafts, recent searches).
- All products, payments, addresses and cards are fictional mock data. Store card brand + last4 only.
- Run with `flutter run --dart-define-from-file=env.json` (`env.json` is git-ignored). Use `dart run build_runner watch -d` for freezed/riverpod codegen.

## Agent skills

### Issue tracker

Issues and specs live in GitHub Issues on JRB-06/Mobile-Programming-Finals, via the `gh` CLI. See `docs/agents/issue-tracker.md`.

### Triage labels

Default vocabulary: needs-triage, needs-info, ready-for-agent, ready-for-human, wontfix. See `docs/agents/triage-labels.md`.

### Domain docs

Single-context: `docs/GLOSSARY.md` + `docs/adr/`. See `docs/agents/domain.md`.

### Writing

Whenever you write or edit docs, PR descriptions, commit messages or issue bodies, run `pstack:unslop` on the text before it is saved, committed or posted.
