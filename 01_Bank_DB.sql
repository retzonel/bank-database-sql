CREATE DATABASE IF NOT EXISTS `Bank`;
USE `Bank`;

-- since these tables are dependent, that have forign keys
-- we will drop them first so data integrity is maintained

DROP TABLE IF EXISTS `Transactions`;
DROP TABLE IF EXISTS `Employee`;
DROP TABLE IF EXISTS `Loan`;
DROP TABLE IF EXISTS `Card`;

-- parent tables dropped last 
DROP TABLE IF EXISTS `Account`;
DROP TABLE IF EXISTS `Customer`;
DROP TABLE IF EXISTS `Branch`;


CREATE TABLE `Customer`(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(150)
); 

CREATE TABLE `Branch`(
	branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100),
    location VARCHAR(100)
); 

CREATE TABLE `Account`(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    branch_id INT,
    balance DECIMAL(12,2),
    account_type VARCHAR(12),
    date_opened DATE,
    
    FOREIGN KEY(customer_id) REFERENCES `Customer`(customer_id),
    FOREIGN KEY(branch_id) REFERENCES `Branch`(branch_id)
); 

CREATE TABLE `Transactions`(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    amount DECIMAL(12,2),
    transaction_type VARCHAR(30),
    transaction_date DATETIME,
    
    FOREIGN KEY(account_id) REFERENCES `Account`(account_id)
); 

CREATE TABLE `Employee`(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_id INT,
    employee_name VARCHAR(100),
    employee_position VARCHAR(100),
    
    FOREIGN KEY(branch_id) REFERENCES `Branch`(branch_id)
); 

CREATE TABLE `Loan`(
	loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    loan_status VARCHAR(30),
    
    FOREIGN KEY(customer_id) REFERENCES `Customer`(customer_id)
); 

CREATE TABLE `Card`(
	card_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    card_type VARCHAR(30),
    expiry_date DATE,
    
    FOREIGN KEY(account_id) REFERENCES `Account`(account_id)
); 



