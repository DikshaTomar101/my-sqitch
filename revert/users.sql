-- Revert flipr:users from mysql

BEGIN;

DROP TABLE users;

COMMIT;
