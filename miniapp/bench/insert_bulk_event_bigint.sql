\set batch 1000

INSERT INTO event_log_bigint (event_type, payload, source)
SELECT
  'bulk_event',
  jsonb_build_object(
    'batch', :batch,
    'n', g,
    'v', random(),
    'msg', md5((random())::text)
  ),
  'pgbench-bulk-bigint'
FROM generate_series(1, :batch) AS g;
