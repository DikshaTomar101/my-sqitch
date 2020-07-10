-- Revert flipr:new from mysql

BEGIN;

DROP USER flipr;

COMMIT;
