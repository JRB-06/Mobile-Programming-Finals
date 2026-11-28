# We use Supabase's built-in email sender, not custom SMTP

The team chose the built-in sender for its zero setup. Its known limits: it only delivers to members of the Supabase project's team, and only a few emails per hour. For the demo, use team-member accounts or Google sign-in, or turn off "Confirm email" in Authentication settings. Configuring custom SMTP (e.g. Gmail with an app password) lifts the limit without code changes.
