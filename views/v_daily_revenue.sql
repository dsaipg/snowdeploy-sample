-- ============================================================
-- View: ANALYTICS_DB.TEAM_ALPHA_SCHEMA.V_DAILY_REVENUE
-- Owner: Team Alpha
-- Description: Daily revenue rollup by region and currency
-- ============================================================

CREATE OR REPLACE VIEW ANALYTICS_DB.TEAM_ALPHA_SCHEMA.V_DAILY_REVENUE AS
SELECT
    order_date,
    region,
    currency,
    COUNT(*)                            AS order_count,
    SUM(total_amount)                   AS gross_revenue,
    AVG(total_amount)                   AS avg_order_value
FROM ANALYTICS_DB.TEAM_ALPHA_SCHEMA.ORDERS
WHERE status NOT IN ('cancelled', 'refunded')
GROUP BY 1, 2, 3
ORDER BY 1 DESC, 5 DESC;
