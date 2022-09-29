use classicmodels;

-- muon tim thong tin khach hang co ten Land of toys Inc
select * from  customers where customerName = 'Land of Toys Inc.';

-- ket hop cau lenh explain query
explain select * from customers where customerName = 'Land of Toys Inc';

-- them chi muc cho bang customers
alter table customers add index idx_customerName(customerName);
explain select * from customers where customerName = 'Land of Toys Inc.';

-- co the them index theo cap nhu ban add index cho cap contactfirtname va contactLastName

alter table customers add index idx_full_name(contactFirstName, contactLastNamme);

explain select * from customers where contactFirstName = 'Jean' or contactLastName = 'King';

-- xoa chi muc 
alter table customers drop index idx_full_name;

