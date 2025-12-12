INSERT INTO event_log_uuid (event_type, payload, source)
VALUES (
  'test_event',
  jsonb_build_object(
    'ts', now(),
    'value', random(),
    'msg', md5(random()::text)
  ),
  'pgbench-uuid'
);
