-- ============================================================
-- Migration: 002_add_user_segments
-- Date: 2026-02-01
-- Author: alice@company.com
-- Description: Add segment and tier columns to USERS table
--added one more line
-dqwdw
-- ============================================================

ALTER TABLE ANALYTICS_DB.TEAM_ALPHA_SCHEMA.USERS
    ADD COLUMN IF NOT EXISTS segment  VARCHAR(50),
    ADD COLUMN IF NOT EXISTS tier     VARCHAR(20) DEFAULT 'standard';
