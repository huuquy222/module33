use classicmodels;


-- cach truyen tham so voi tham so loai insert

DELIMITER // 

CREATE PROCEDURE getCusById

(IN cusNum INT (11))

BEGIN 

SELECT * FROM customers where customerNumber = cusNum;

END //

DELIMITER ;

call getCusById(175);

-- truyen tham so voi loai tham so loai out

DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(
	IN in_city varchar(50),
    OUT total INT 
)

BEGIN 

	SELECT COUNT (customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
    
END //

DELIMITER ;

CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;

-- tham so loai INOUT

DELIMITER //
CREATE PROCEDURE SetCounter(
	INOUT counter INT,
    IN INC INT 
)

BEGIN 
	SET counter = counter + inc;
    
END //
DELIMITER ;


SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8