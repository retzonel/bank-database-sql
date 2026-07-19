-- sample queries
USE `Bank`;

SELECT * FROM `Branch`;
SELECT * FROM `Customer`;
SELECT * FROM `Account`;
SELECT * FROM `Card`;
SELECT * FROM `Loan`;
SELECT * FROM `Transactions`;
SELECT * FROM `Employee`;

-- 1. customers who have accounts in two or more branches at the same time
SELECT c.customer_id, c.first_name, c.last_name, COUNT(DISTINCT a.branch_id) AS branch_count
FROM `Customer` c
JOIN `Account` a ON a.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT a.branch_id) >= 2;

-- 2. total balance and account count per customer
SELECT c.customer_id, c.first_name, c.last_name,
       COUNT(a.account_id) AS num_accounts,
       SUM(a.balance) AS total_balance
FROM `Customer` c
JOIN `Account` a ON a.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_balance DESC;

-- 3. customers who have never taken a loan
SELECT c.customer_id, c.first_name, c.last_name
FROM `Customer` c
WHERE c.customer_id NOT IN (SELECT DISTINCT customer_id FROM `Loan`);

-- 4. customers who have no accounts at all
SELECT c.customer_id, c.first_name, c.last_name
FROM `Customer` c
WHERE c.customer_id NOT IN (SELECT DISTINCT customer_id FROM `Account`);

-- 5. branches ranked by total deposits held (sum of account balances)
SELECT b.branch_id, b.branch_name, b.location, SUM(a.balance) AS total_deposits
FROM `Branch` b
JOIN `Account` a ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name, b.location
ORDER BY total_deposits DESC;

-- 6. active loans with customer and outstanding-ish info
SELECT c.first_name, c.last_name, l.loan_amount, l.interest_rate, l.loan_status
FROM `Loan` l
JOIN `Customer` c ON c.customer_id = l.customer_id
WHERE l.loan_status = 'Active';

-- 7. accounts with no card issued
SELECT a.account_id, a.customer_id, a.account_type
FROM `Account` a
WHERE a.account_id NOT IN (SELECT DISTINCT account_id FROM `Card`);

-- 8. largest single transaction per account
SELECT t.account_id, MAX(t.amount) AS largest_transaction
FROM `Transactions` t
GROUP BY t.account_id
ORDER BY largest_transaction DESC;

-- 9. employee headcount per branch
SELECT b.branch_name, COUNT(e.employee_id) AS num_employees
FROM `Branch` b
LEFT JOIN `Employee` e ON e.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY num_employees DESC;