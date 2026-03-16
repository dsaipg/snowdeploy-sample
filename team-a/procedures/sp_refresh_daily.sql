-- ============================================================
-- Procedure: ANALYTICS_DB.TEAM_ALPHA_SCHEMA.SP_REFRESH_DAILY
-- Owner: Team Alpha
-- Description: Daily refresh — updates UPDATED_AT on stale records
--              and refreshes any downstream materialized objects.
-- ============================================================

CREATE OR REPLACE PROCEDURE ANALYTICS_DB.TEAM_ALPHA_SCHEMA.SP_REFRESH_DAILY()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
DECLARE
    rows_updated INTEGER DEFAULT 0;
BEGIN
    -- Mark users whose orders changed today as updated
    UPDATE ANALYTICS_DB.TEAM_ALPHA_SCHEMA.USERS u
    SET updated_at = CURRENT_TIMESTAMP()
    WHERE EXISTS (
        SELECT 1 FROM ANALYTICS_DB.TEAM_ALPHA_SCHEMA.ORDERS o
        WHERE o.user_id = u.user_id
          AND o.updated_at >= DATEADD(hour, -24, CURRENT_TIMESTAMP())
    );

    rows_updated := SQLROWCOUNT;

    RETURN 'SP_REFRESH_DAILY complete. Users updated: ' || rows_updated;
END;
$$;
