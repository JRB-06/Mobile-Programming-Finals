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

### Skills

Use one skill per job. These picks override the session-start instructions of superpowers, pstack and the Matt Pocock skills. The superpowers rule to brainstorm before any task does not apply, and multi-file work does not go through pstack:poteto-mode. When a skill below conflicts with this file, this file wins.

| Job | Use | Skip |
|-----|-----|------|
| Set up a repo, once | /setup-matt-pocock-skills | |
| Turn the agreed design into a spec | /to-spec | superpowers writing-plans. The backend plan in `docs/superpowers/plans/` is reference only. |
| Split the spec into GitHub tickets | /to-tickets | |
| Build one ticket | /implement, which runs tdd and code-review itself. Run /clear after. | pstack poteto-mode, superpowers executing-plans and subagent-driven-development |
| Build test-first outside a ticket | mattpocock tdd | superpowers test-driven-development, pstack tdd |
| Shape a tricky module before coding, such as `place_order` or the Cart | pstack architect | superpowers brainstorming |
| Find a bug you don't understand | mattpocock diagnosing-bugs | superpowers systematic-debugging |
| Understand existing code or why it is built that way | pstack how, why, teach | |
| Check work before calling it done | pstack principle-prove-it-works | superpowers verification-before-completion |
| Review backend work before merge, for security, RLS and money | pstack thermos | superpowers requesting-code-review |
| Write a PR body | mattpocock pr | |
| Get a PR to green | pstack babysit, fix-ci | |
| Resolve conflicts with the partner's branch | pstack fix-merge-conflicts | |
| Review a build afterwards, especially a rough one | mattpocock retro | pstack reflect, correct |
| Catch up after a break | pstack recall or ketchup | |
| Restate something plainly | pstack bro or mattpocock wait-what | |

### Writing

Whenever you write or edit docs, PR descriptions, commit messages or issue bodies, run `pstack:unslop` on the text before it is saved, committed or posted. and ommit the co-authored with x on commits and generated with x on PRs.
