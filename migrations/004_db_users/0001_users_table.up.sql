SELECT 'Creating users table (with pgcrypto)';

CREATE TABLE users
(
    name VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL
);

INSERT INTO users (name, password) VALUES
  ('admin', crypt('12345', gen_salt('bf', 8)));
