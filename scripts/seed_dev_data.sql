-- ============================================================
-- Script: seed_dev_data
-- Purpose: Insert sample data for local / dev environment only
-- WARNING: DO NOT run in staging or prod
-- ============================================================

INSERT INTO ANALYTICS_DB.TEAM_ALPHA_SCHEMA.USERS (email, display_name, department, role)
VALUES
    ('alice@company.com',   'Alice Chen',    'Engineering', 'admin'),
    ('bob@company.com',     'Bob Marley',    'Analytics',   'editor'),
    ('carol@company.com',   'Carol White',   'Finance',     'viewer');

INSERT INTO ANALYTICS_DB.TEAM_ALPHA_SCHEMA.ORDERS (user_id, order_date, status, total_amount, region)
VALUES
    (1, '2026-01-15', 'completed', 1200.00, 'US-WEST'),
    (1, '2026-02-10', 'completed',  850.50, 'US-EAST'),
    (2, '2026-03-01', 'pending',   3200.00, 'EU');
