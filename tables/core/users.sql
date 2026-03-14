-- ============================================================
-- Table: ANALYTICS_DB.TEAM_ALPHA_SCHEMA.USERS
-- Owner: Team Alpha
-- Description: Core user dimension table
-- ============================================================

CREATE TABLE IF NOT EXISTS ANALYTICS_DB.TEAM_ALPHA_SCHEMA.USERS (
    user_id         NUMBER AUTOINCREMENT PRIMARY KEY,
    email           VARCHAR(255)    NOT NULL UNIQUE,
    display_name    VARCHAR(255),
    department      VARCHAR(100),
    role            VARCHAR(50)     DEFAULT 'viewer',
    is_active       BOOLEAN         DEFAULT TRUE,
    created_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP(),
    updated_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP()
);
