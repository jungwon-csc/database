WITH deleted_rows AS (
    DELETE FROM event
    WHERE start_at < CURRENT_DATE
    RETURNING event_id
)
SELECT count(*) AS deleted_count FROM deleted_rows;