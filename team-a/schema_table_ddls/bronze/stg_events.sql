-- ============================================================
-- Table: ANALYTICS_DB.TEAM_ALPHA_SCHEMA.STG_EVENTS
-- Owner: Team Alpha
-- Description: Raw event staging table — truncated and reloaded daily
-- ============================================================

CREATE TABLE IF NOT EXISTS ANALYTICS_DB.TEAM_ALPHA_SCHEMA.STG_EVENTS (
    event_id        VARCHAR(64)     PRIMARY KEY,
    event_type      VARCHAR(100)    NOT NULL,
    user_id         NUMBER,
    session_id      VARCHAR(64),
    properties      VARIANT,                        -- JSON blob
    event_ts        TIMESTAMP_NTZ   NOT NULL,
    loaded_at       TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP()
);
