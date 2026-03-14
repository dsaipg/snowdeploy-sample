# Team Alpha — SQL Repo

This repository holds all Snowflake SQL managed by **Team Alpha** and deployed via the SQL Deployment Portal.

## Folder Structure

```
├── tables/
│   ├── core/         ← Production dimension and fact tables
│   └── staging/      ← Staging / raw landing tables
├── views/            ← CREATE OR REPLACE VIEW statements
├── procedures/       ← Stored procedures and Snowflake Tasks
├── migrations/       ← Numbered, sequential ALTER scripts
└── scripts/          ← One-off / ad-hoc scripts (dev only)
```

## Conventions

| Type | Naming | Example |
|---|---|---|
| Tables | `snake_case` | `orders.sql` |
| Views | `v_` prefix | `v_daily_revenue.sql` |
| Procedures | `sp_` prefix | `sp_refresh_daily.sql` |
| Migrations | `NNN_description` | `003_orders_add_discount.sql` |

## Deployment Rules

- **migrations/** — run in numbered order, never edit an existing one, always add a new one
- **scripts/** — dev/test only, never deploy to prod via the portal
- **tables/** and **views/** — idempotent (`CREATE IF NOT EXISTS` / `CREATE OR REPLACE`)
