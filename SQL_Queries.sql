DELETE FROM `Account`;

-- dlete the parents last dawg 
DELETE FROM `Customer`;
DELETE FROM `Branch`;

-- force all ID counters back to 1
ALTER TABLE `Customer` AUTO_INCREMENT = 1;
ALTER TABLE `Branch` AUTO_INCREMENT = 1;
ALTER TABLE `Account` AUTO_INCREMENT = 1;
ALTER TABLE `Transactions` AUTO_INCREMENT = 1;
ALTER TABLE `Loan` AUTO_INCREMENT = 1;
ALTER TABLE `Card` AUTO_INCREMENT = 1;
ALTER TABLE `Employee` AUTO_INCREMENT = 1;

INSERT INTO Customer
(first_name,last_name,phone,email,address)
VALUES
('John','Doe','08012345678','john@gmail.com','Abuja'),
('Mary','Smith','08098765432','mary@gmail.com','Lagos');

INSERT INTO Branch
(branch_name,location)
VALUES
('Main Branch','Minna'),
('Central Branch','Abuja');

INSERT INTO Account
(customer_id,branch_id,balance,account_type,date_opened)
VALUES
(1,1,250000,'Savings','2026-01-10'),
(2,2,500000,'Current','2026-03-14');

SELECT * FROM Customer;
SELECT first_name, last_name, account_type, balance FROM `Customer` JOIN `Account`
ON `Customer`.customer_id = `Account`.customer_id;
SELECT * FROM Transactions;
