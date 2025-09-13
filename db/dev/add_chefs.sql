-- cat db/dev/add_chefs.sql | docker exec -i gastro-database psql -U gastro -d gastro -v ON_ERROR_STOP=1

INSERT INTO
  chef (name)
VALUES
  ('Mileto'),
  ('Pak Mileto'),
  ('Gordon') ON CONFLICT DO NOTHING;
