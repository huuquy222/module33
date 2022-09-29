use chuyendoimoiquanhe;

create database chuyendoimoiquanhe;

create table phieuxuat(
SoPX int not null primary key,
NgayXuat date not null
);

create table vattu(
MaVTU int not null primary key,
TenVTU varchar(30)
);

create table chitietphieuxuat(
SoPX int not null,
MaVTU int not null,
DGXuat float not null,
SLXuat int not null,
foreign key (SoPX) references phieuxuat (SoPX),
foreign key (MaVTU) references vattu (MaVTU)
);


create table phieunhap(
SoPN int not null primary key,
Ngaynhap date not null
);

create table chitietphieunhap(
SoPN int not null,
MaVTU int not null,
DGNhap float not null,
SLNhap int not null,
foreign key (SoPN) references phieunhap (SoPN),
foreign key (MaVTU) references vattu (MaVTU)
);

create table dondathang(
SoDH int not null primary key,
NgayDH date not null
);

create table chitietdondathang(
MaVTU int not null,
SoDH int not null,
foreign key (MaVTU) references vattu (MaVTU),
foreign key (SoDH) references dondathang (SoDH)
);

create table nhacc(
MaNCC int not null primary key,
TenNCC varchar(50),
DiaChi varchar(30),
Sodienthoai int not null
);

create table Cungcap(
SoDH int not null,
MaNCC int not null,
Sodienthoai int not null,
foreign key (SoDH) references dondathang (SoDH),
foreign key (MaNCC) references nhacc  (MaNCC)
);