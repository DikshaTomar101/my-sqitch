-- Revert flipr:appuser from mysql

BEGIN;

DROP USER flipr;

COMMIT;
