create database quanlybanhang;

use quanlybanhang;

create table customer(
cID int not null primary key,
cName varchar(50),
cAge int not null
);


create table orderr(
oID int not null primary key,
cID int not null,
cDate date not null,
oTotalPrice double not null,
foreign key (cID) references customer (cID)
);

create table orderdetail(
oID int not null,
pID int not null,
odQTY double not null,
foreign key (oID) references orderr (oID),
foreign key (pID) references product (pID)
);

create table product(
pID int not null primary key,
pName varchar(50),
pPrice double not null
);

