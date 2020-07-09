-- Verify flipr:appuser on mysql

BEGIN;

SELECT sqitch.checkit(COUNT(*), 'User "flipr" does not exist')
  FROM mysql.user WHERE user = 'flipr';

ROLLBACK;
