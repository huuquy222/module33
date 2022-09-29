SELECT * FROM c6_quanlybanhang.sanpham;
-- 1
select MaSP, TenSP 
from sanpham NuocSX ;

-- 2  In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cây”, ”quyển”.
select MaSP, TenSP 
from sanpham 
where 'cay' 'quyen';

-- 4
select MaSP, TenSP sanphamsanpham
from sanpham 
where NuocSX = 'Trung Quoc' and (gia between 2000 and  3000);

-- 3
select MaSP, TenSP 
from sanpham
where MaSP = 'b'and '01';

select MaSP, TenSP 
from sanpham
where NuocSX = 'Trung Quoc' or 'Thai Lan'and (gia > 20000 and gia <= 30000);


select SoHoaDon, TriGia
from hoadon
where NgayMuaHang = '2007-1-1'or '2007-2-1';

select kh.MaKH, kh.HoTen
from khachhang kh
inner join hoadon hd on kh.MaKH = hd.MaKH;


select sp.MaSP, sp.TenSP, kh.HoTen, hd.NgayMuaHang, ct.SoLuong, sp.Gia, ct.SoLuong * sp.Gia as "THANH TIEN"
from sanpham sp
join cthd ct on sp.MaSP = ct.MaSP
join hoadon hd on ct.SoHD = hd.SoHoaDon
join khachhang kh on hd.MaKH = kh.MaKH
where kh.HoTen = 'Nguyen Van A' 
and hd.NgayMuaHang like '2006-10%';


select hd.MaNV, hd.MaKH, nv.HoTen, hd.NgayMuaHang
from hoadon hd
join nhanvien nv  on hd.MaNV = nv.MaNV join khachhang kh on hd.MaKH = kh.MaKH 
where nv.HoTen = 'Nguyen Van B';

--  
select * from hoadon hd
join cthd ct on hd.SoHoaDon = ct.SoHD
where (ct.MaSP = 'BB01' or ct.MaSP = 'BB02')and (ct.SoLuong between 10 and 20);




select * from hoadon hd
join cthd ct on hd.SoHoaDon = ct.SoHD 
where (ct.MaSP = 'BB01' or ct.MaSP = 'BB02')and (ct.SoLuong between 10 and 20);

-- 13 Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select * from hoadon hd
join cthd ct on hd.SoHoaDon = ct.SoHD
where ct.MaSP = 'BB01'
and (ct.SoLuong between 10 and 20)
and hd.SoHoaDon in (select hd.SoHoaDon from hoadon hd
join cthd ct on hd.SoHoaDon = ct.SoHD where ct.MaSP = 'BB02');

-- 14  In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
select sp.MaSP, sp.TenSP from sanpham sp
join cthd ct on sp.MaSP = ct.MaSP 
join hoadon hd on ct.SoHD = hd.SoHoaDon
where sp.NuocSX = 'Trung Quoc' or hd.NgayMuaHang = '2007-1-1';

-- 15
select sp.MaSP, sp.TenSP from sanpham sp
where sp.MaSP not in (select ct.MaSP from cthd ct );


-- 16
select sp.MaSP, sp.TenSP from sanpham sp
where sp.MaSP
not in (select ct.MaSP from cthd ct join hoadon hd on ct.SoHD = hd.SoHoaDon where hd.NgayMuaHang like '2006%');

-- 17 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất không bán được trong năm 2006.
select sp.MaSP, sp.TenSP from sanpham sp
where sp.MaSP not in (select ct.MaSP from cthd ct join hoadon hd on ct.SoHD = hd.SoHoaDon where hd.NgayMuaHang like '2006') and sp.NuocSX = 'Trung Quoc';

















 



