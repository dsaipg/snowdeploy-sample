-- ============================================================
-- Table: ANALYTICS_DB.TEAM_ALPHA_SCHEMA.ORDERS
-- Owner: Team Alpha
-- Description: Core orders fact table
-- ============================================================

CREATE TABLE IF NOT EXISTS ANALYTICS_DB.TEAM_ALPHA_SCHEMA.ORDERS (
    order_id        NUMBER AUTOINCREMENT PRIMARY KEY,
    user_id         NUMBER          NOT NULL,
    order_date      DATE            NOT NULL,
    status          VARCHAR(50)     DEFAULT 'pending',
    total_amount    NUMBER(18, 2),
    currency        VARCHAR(3)      DEFAULT 'USD',
    region          VARCHAR(100),
    created_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP(),
    updated_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP(),

    CONSTRAINT fk_orders_user FOREIGN KEY (user_id)
        REFERENCES ANALYTICS_DB.TEAM_ALPHA_SCHEMA.USERS (user_id)
);
