-- Revert flipr:newuser2 from mysql

BEGIN;

DROP USER newuser2;
COMMIT;
