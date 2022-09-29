CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM customers;
-- lenh de view rribg nySQL (o tren)
-- lenh de lay ra du lieu minh vua moi view vao (o duoi)
select * from customer_views;

-- cap nhat view 
CREATE OR REPLACE VIEW view_name AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes'; 

