use classicmodels;

-- tao procedure trong mysql
DELIMITER //
CREATE PROCEDURE findAllCustomers()

BEGIN
	
    SELECT * FROM customers;
    
END //

DELIMITER ;


-- goi procedure 
call findAllCustomers();

-- lenh de xoa procedure
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers` //

-- lenh de them moi procedure va them o customerNumber 175
DELIMITER //
CREATE PROCEDURE findAllCustomers()

BEGIN

SELECT * FROM customers where customerNumber = 175;

END //

DELIMITER ;

-- lenh de goi findAllCustomer vua tao
call findAllCustomers();