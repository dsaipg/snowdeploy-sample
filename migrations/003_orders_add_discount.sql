-- ============================================================
-- Migration: 003_orders_add_discount
-- Date: 2026-03-01
-- Author: bob@company.com
-- Description: Track discount applied to each order
-- ============================================================

ALTER TABLE ANALYTICS_DB.TEAM_ALPHA_SCHEMA.ORDERS
    ADD COLUMN IF NOT EXISTS discount_amount  NUMBER(18, 2) DEFAULT 0,
    ADD COLUMN IF NOT EXISTS promo_code       VARCHAR(50);
