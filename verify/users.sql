-- Verify flipr:users on mysql

BEGIN;

SELECT nickname, password, timestamp
  FROM users
 WHERE 0;

ROLLBACK;
