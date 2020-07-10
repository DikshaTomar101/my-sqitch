-- Revert flipr:newuser from mysql

BEGIN;


DROP USER newuser;
COMMIT;
