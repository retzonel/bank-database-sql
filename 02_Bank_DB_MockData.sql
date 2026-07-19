-- clear all the tables
DELETE FROM `Transactions`;
DELETE FROM `Loan`;
DELETE FROM `Card`;
DELETE FROM `Employee`;
DELETE FROM `Account`;

-- delete the parents last 
DELETE FROM `Customer`;
DELETE FROM `Branch`;

-- force all id counters back to 1
ALTER TABLE `Customer` AUTO_INCREMENT = 1;
ALTER TABLE `Branch` AUTO_INCREMENT = 1;
ALTER TABLE `Account` AUTO_INCREMENT = 1;
ALTER TABLE `Transactions` AUTO_INCREMENT = 1;
ALTER TABLE `Loan` AUTO_INCREMENT = 1;
ALTER TABLE `Card` AUTO_INCREMENT = 1;
ALTER TABLE `Employee` AUTO_INCREMENT = 1;
USE `Bank`;

-- populate branch table
INSERT INTO `Branch` (branch_name, location) VALUES
('Ikeja Bank', 'Ikeja, Lagos'),
('Wuse Bank', 'Wuse, Abuja'),
('Minna Bank', 'Minna, Niger State'),
('Port Harcourt Bank', 'Port Harcourt, Rivers State'),
('Kano Bank', 'Kano'),
('Ibadan Bank', 'Ibadan, Oyo State');

-- populate customer tables
INSERT INTO `Customer` (first_name, last_name, phone, email, address) VALUES
('Chukwudi', 'Okafor', '2348011223344', 'chukwudi.okafor@example.com', 'Ikeja, Lagos'),
('Amina', 'Bello', '2348022334455', 'amina.bello@example.com', 'Minna, Niger State'),
('Oluwaseun', 'Adeyemi', '2348033445566', 'oluwaseun.adeyemi@example.com', 'Ikeja, Lagos'),
('Ifeoma', 'Nwosu', '2348044556677', 'ifeoma.nwosu@example.com', 'Wuse, Abuja'),
('Yakubu', 'Danladi', '2348055667788', 'yakubu.danladi@example.com', 'Wuse, Abuja'),
('Ngozi', 'Eze', '2348066778899', 'ngozi.eze@example.com', 'Port Harcourt, Rivers State'),
('Tunde', 'Bakare', '2348077889900', 'tunde.bakare@example.com', 'Kano'),
('Halima', 'Suleiman', '2348088990011', 'halima.suleiman@example.com', 'Ibadan, Oyo State'),
('Emeka', 'Okonkwo', '2348099001122', 'emeka.okonkwo@example.com', 'Minna, Niger State'),
('Blessing', 'Udo', '2348100112233', 'blessing.udo@example.com', 'Ibadan, Oyo State');

-- populate accounts table
-- some customers have accounts at more than one branch
-- and some customers dont have an account at all
INSERT INTO `Account` (customer_id, branch_id, balance, account_type, date_opened) VALUES
(1, 1, 1000.00,  'Savings',  '2019-01-10'),
(1, 3, 2500.00,  'Checking', '2020-06-15'),   -- chukwudi second account branch
(2, 3, 100.00,   'Checking', '2018-03-22'),
(3, 1, 200.00,   'Savings',  '2021-02-01'),
(4, 2, 50000.00, 'Savings',  '2017-11-05'),
(4, 4, 750.00,   'Checking', '2022-04-19'),   -- ifeoma second account branch
(5, 2, 1000000.00,'Savings', '2015-07-30'),
(6, 4, 300.00,   'Checking', '2020-09-09'),
(7, 5, 4200.00,  'Savings',  '2021-12-12'),
(8, 6, 600.00,   'Checking', '2019-05-05');

-- populate cards table
INSERT INTO `Card` (account_id, card_type, expiry_date) VALUES
(1, 'Debit',  '2028-01-30'),
(2, 'Credit', '2026-08-20'),
(3, 'Debit',  '2024-03-21'),
(4, 'Debit',  '2025-01-14'),
(5, 'Credit', '2027-06-09'),
(7, 'Credit', '2026-11-11'),
(8, 'Debit',  '2025-09-09'),
(9, 'Credit', '2026-02-28');

-- populate loans table
INSERT INTO `Loan` (customer_id, loan_amount, interest_rate, loan_status) VALUES
(1, 3000.00,  25.00, 'Active'),
(1, 1000.00,  50.00, 'Paid'),
(2, 7000.00,  35.00, 'Active'),
(4, 5000.00,  20.00, 'Active'),
(4, 10000.00, 15.00, 'Paid'),
(5, 10000.00, 15.00, 'Defaulted'),
(7, 2000.00,  40.00, 'Active');

-- populate transactions table
INSERT INTO `Transactions` (account_id, amount, transaction_type, transaction_date) VALUES
(1, 1000.90, 'Deposit',    '2020-05-18 10:00:00'),
(2, 500.80,  'Withdrawal', '2020-12-07 14:30:00'),
(3, 100.90,  'Deposit',    '2019-06-30 09:15:00'),
(5, 5060.70, 'Deposit',    '2021-01-24 16:45:00'),
(5, 500.67,  'Withdrawal', '2019-01-24 11:20:00'),
(6, 300.00,  'Deposit',    '2022-05-01 08:00:00'),
(7, 12000.00,'Deposit',    '2016-03-15 13:10:00'),
(8, 150.00,  'Withdrawal', '2021-02-14 17:00:00'),
(9, 2000.00, 'Deposit',    '2022-01-09 12:00:00'),
(10,75.50,   'Withdrawal', '2020-07-22 15:30:00');

-- populate employee table 
INSERT INTO `Employee` (branch_id, employee_name, employee_position) VALUES
(1, 'Adaeze Chukwu',    'Branch Manager'),
(1, 'Musa Ibrahim',     'Teller'),
(2, 'Folake Adeyemi',   'Loan Officer'),
(3, 'Chinedu Obi',      'Branch Manager'),
(4, 'Aisha Mohammed',   'Teller'),
(5, 'Babatunde Fashola','Branch Manager');