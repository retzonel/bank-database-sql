-- idrk what this does, i just asked ai and it genertaed this for me
-- i'll take time later to learn it :)

USE `Bank`;

-- user privilege info
CREATE OR REPLACE VIEW User_role_information AS
SELECT User, Select_priv, Insert_priv, Update_priv,
       Delete_priv, Create_priv
FROM mysql.user
WHERE Select_priv = 'Y' OR Insert_priv = 'Y' OR
      Update_priv = 'Y' OR Delete_priv = 'Y' OR Create_priv = 'Y';

-- customer account summary (num accounts + total balance) - view
CREATE OR REPLACE VIEW Customer_account_summary AS
SELECT c.customer_id, c.first_name, c.last_name,
       COUNT(a.account_id) AS num_accounts,
       SUM(a.balance) AS total_balance
FROM `Customer` c
JOIN `Account` a ON a.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- active loans with borrower details - view
CREATE OR REPLACE VIEW Active_loans AS
SELECT l.loan_id, c.customer_id, c.first_name, c.last_name,
       l.loan_amount, l.interest_rate, l.loan_status
FROM `Loan` l
JOIN `Customer` c ON c.customer_id = l.customer_id
WHERE l.loan_status = 'Active';

-- Usage examples:
-- SELECT * FROM User_role_information;
-- SELECT * FROM Customer_account_summary ORDER BY total_balance DESC;
-- SELECT * FROM Active_loans;