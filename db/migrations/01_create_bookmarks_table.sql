in migrations/01_create_chitterdb_table.sql
CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(60), username VARCHAR(20), date, time  );
