-- ============================================================
-- View: ANALYTICS_DB.TEAM_ALPHA_SCHEMA.V_ACTIVE_USERS
-- Owner: Team Alpha
-- Description: Active users with 30-day activity flag
-- ============================================================

CREATE OR REPLACE VIEW ANALYTICS_DB.TEAM_ALPHA_SCHEMA.V_ACTIVE_USERS AS
SELECT
    u.user_id,
    u.email,
    u.display_name,
    u.department,
    u.role,
    COUNT(DISTINCT o.order_id)          AS total_orders,
    MAX(o.order_date)                   AS last_order_date,
    CASE
        WHEN MAX(o.order_date) >= DATEADD(day, -30, CURRENT_DATE()) THEN TRUE
        ELSE FALSE
    END                                 AS is_active_30d
FROM ANALYTICS_DB.TEAM_ALPHA_SCHEMA.USERS u
LEFT JOIN ANALYTICS_DB.TEAM_ALPHA_SCHEMA.ORDERS o
    ON u.user_id = o.user_id
WHERE u.is_active = TRUE
GROUP BY 1, 2, 3, 4, 5;
