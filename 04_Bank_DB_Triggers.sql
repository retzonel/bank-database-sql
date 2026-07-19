-- an sql trigger is code that runs auto
-- after something happens to a table
-- just learned this overnigth

USE `Bank`;

-- trigger: ensure every account keeps a minimum balance of 100 at all times
DROP TRIGGER IF EXISTS bal_limit_insert;
DROP TRIGGER IF EXISTS bal_limit_update;

DELIMITER //

CREATE TRIGGER bal_limit_insert BEFORE INSERT ON `Account` FOR EACH ROW
BEGIN
    DECLARE message VARCHAR(50);
    IF NEW.balance < 100 THEN
        SET message = CONCAT('Insertion error: new balance too low: ', NEW.balance);
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = message;
    END IF;
END;
//

CREATE TRIGGER bal_limit_update BEFORE UPDATE ON `Account` FOR EACH ROW
BEGIN
    DECLARE message VARCHAR(50);
    IF NEW.balance < 100 THEN
        SET message = CONCAT('Update error: new balance too low: ', NEW.balance);
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = message;
    END IF;
END;
//

DELIMITER ;

-- this should fail
-- INSERT INTO Account (customer_id, branch_id, balance, account_type, date_opened)
-- VALUES (1, 1, 50.00, 'Savings', CURDATE());
