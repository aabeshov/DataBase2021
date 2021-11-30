-- 1 task

-- 2 task
--      1
CREATE ROLE accountant CREATEDB;
CREATE ROLE administrator SUPERUSER;
CREATE ROLE support CREATEROLE;
--      2
CREATE USER alen in role administrator;
CREATE USER david in role support;
CREATE USER janibek in role accountant;
--      3
alter user janibek createrole;
--      4
grant all on accounts to david;
REVOKE select ON accounts FROM david;

-- 3 task
--      1
do $$
begin

    inta = transactions.dst_account;
   assert transactions.src_account = accounts.id and accounts.currency  , '1000 Film found, check the film table';
end$$;
--      2
ALTER TABLE accounts
ALTER COLUMN balance SET NOT NULL;

--4 task
alter type accounts.currency


-- 6 task
begin transaction;


    update accounts
    set balance =  balance - transactions.amount
    where src_account = accounts_id


commit;

