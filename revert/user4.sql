-- Revert flipr:user4 from mysql

BEGIN;

DROP USER user4;
COMMIT;
