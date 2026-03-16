CREATE OR REPLACE VIEW ANALYTICS_DB.TEAM_B_DEV.CUSTOMER_SEGMENTS AS
SELECT
    customer_id,
    CASE
        WHEN total_spend >= 10000 THEN 'Platinum'
        WHEN total_spend >= 5000  THEN 'Gold'
        WHEN total_spend >= 1000  THEN 'Silver'
        ELSE 'Bronze'
    END AS segment
FROM ANALYTICS_DB.TEAM_B_DEV.CUSTOMERS;
