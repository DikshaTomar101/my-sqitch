-- Revert flipr:newuser3 from mysql

BEGIN;

DROP USER user3;
COMMIT;
