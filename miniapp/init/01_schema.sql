CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- UUID PK
CREATE TABLE IF NOT EXISTS event_log_uuid (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at  TIMESTAMPTZ      NOT NULL DEFAULT now(),
    event_type  TEXT             NOT NULL,
    payload     JSONB            NOT NULL,
    source      TEXT
);
CREATE INDEX IF NOT EXISTS idx_event_log_uuid_created_at
    ON event_log_uuid (created_at);

-- BIGINT PK
CREATE TABLE IF NOT EXISTS event_log_bigint (
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at  TIMESTAMPTZ      NOT NULL DEFAULT now(),
    event_type  TEXT             NOT NULL,
    payload     JSONB            NOT NULL,
    source      TEXT
);
CREATE INDEX IF NOT EXISTS idx_event_log_bigint_created_at
    ON event_log_bigint (created_at);
