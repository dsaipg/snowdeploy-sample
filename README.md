# Team Alpha — SQL Repo

This repository holds all Snowflake SQL managed by **Team Alpha** and deployed via the SQL Deployment Portal.

## Folder Structure

```
├── schema_table_ddls/
│   ├── bronze/       ← Raw / landing layer CREATE TABLE statements
│   ├── silver/       ← Cleaned / conformed layer CREATE TABLE statements
│   └── gold/         ← Business / reporting layer CREATE TABLE statements
├── views/            ← CREATE OR REPLACE VIEW statements
├── procedures/       ← Stored procedures and Snowflake Tasks
├── alter_ddls/       ← Numbered, sequential ALTER TABLE scripts
└── sql_scripts/      ← One-off / ad-hoc scripts (dev only)
```

## Conventions

| Type | Naming | Example |
|---|---|---|
| Tables | `snake_case` | `orders.sql` |
| Views | `v_` prefix | `v_daily_revenue.sql` |
| Procedures | `sp_` prefix | `sp_refresh_daily.sql` |
| Alter DDLs | `NNN_description` | `003_orders_add_discount.sql` |

## Deployment Rules

- **alter_ddls/** — run in numbered order, never edit an existing one, always add a new file
- **sql_scripts/** — dev/test only, never deploy to prod via the portal
- **schema_table_ddls/** — idempotent (`CREATE TABLE IF NOT EXISTS`)
- **views/** and **procedures/** — idempotent (`CREATE OR REPLACE`)

## Clustering Keys

Snowflake does not use traditional indexes. Use `CLUSTER BY` for micro-partition optimization:

```sql
ALTER TABLE {schema}.{table_name}
    CLUSTER BY ({column_name});
```
