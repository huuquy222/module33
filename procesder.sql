use classicmodels;

-- tạo MYSQL stored procedure đầu tiên
DELIMITER //
create procedure findAllCustomers()
begin 
select * from customers;
end//
DELIMITER //
create procedure fi


call findAllCustomers();


DELIMITER//
DROP procedure if exists  `findAllCustomer `//
