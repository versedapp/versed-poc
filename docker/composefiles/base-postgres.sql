CREATE USER "versed" WITH PASSWORD 'versed';
ALTER USER "versed" CREATEDB;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "versed" WITH GRANT OPTION;
