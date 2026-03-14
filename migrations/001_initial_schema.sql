-- ============================================================
-- Migration: 001_initial_schema
-- Date: 2026-01-10
-- Author: team-alpha
-- Description: Bootstrap the Team Alpha schema
-- ============================================================

CREATE SCHEMA IF NOT EXISTS ANALYTICS_DB.TEAM_ALPHA_SCHEMA;

GRANT USAGE ON SCHEMA ANALYTICS_DB.TEAM_ALPHA_SCHEMA TO ROLE TEAM_ALPHA_ROLE;
GRANT CREATE TABLE ON SCHEMA ANALYTICS_DB.TEAM_ALPHA_SCHEMA TO ROLE TEAM_ALPHA_ROLE;
GRANT CREATE VIEW ON SCHEMA ANALYTICS_DB.TEAM_ALPHA_SCHEMA TO ROLE TEAM_ALPHA_ROLE;
