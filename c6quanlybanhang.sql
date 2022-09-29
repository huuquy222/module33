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

-- 18 Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select count (SoHoaDon) - count (SoHD) as 'số hóa đơn không phải của khách hàng đăng ký thành viên mua' from hoadon;

-- 19 laay ra gia tri hoa don thap nhat va gia tri hoa don cao nhat

select MAX(TRIGIA) from hoadon;
select MIN(TRIGIA) from hoadon;

-- 20 tri gia trung binh cua tat ca hoa don duoc ban ra trong nam 2006 la bao nhieu
select ROUND( AVG(TRIGIA), 2 )
from hoadon 
where NgayMuaHang like  '2006%';

-- 21 tinh doanh thu ban hang trong nam 2006
select SUM(TRIGIA) from hoadon where NgayMuaHang like '2006%';

-- 22 tim so hoa don co gia tri cao nhat trong nam 2006
select MAX(SoHoaDon) from hoadon where NgayMuaHang like '2006%';

-- 23 tim ho ten khach hang da mua hoa don co gia tri cao nhat trong nam 2006
select kh.MaKH, kh.HOTEN from khachhang kh join hoadon hd on kh.MaKH = hd.MaKH 
where hd.TRIGIA = MAX(hd.TRIGIA) ;

-- 24 
select MaKH HOTEN from khachhang kh
join  (select  distinct DOANHSO from KHACHHANG order by DOANHSO desc limit 0,3) as maxDoanhSo
on kh.DOANHSO = maxDoanhSo.DOANHSO; 
 
-- 25. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select sp.MASP, sp.TENSP from sanpham sp
join (select  distinct Gia from sanpham order by Gia desc limit 0,3) as maxsanpham on sp.Gia = maxsanpham.Gia ;

-- 26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của tất cả các sản phẩm).
select sp.MASP, sp.TENSP from sanpham sp
join (select  distinct Gia from sanpham order by Gia asc limit 1,3) as minsanpham on sp.Gia = minsanpham.Gia and NuocSX = 'Trung Quoc';

-- 27. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của sản phẩm do “Trung Quốc” sản xuất).
select sp.MASP, sp.TENSP from sanpham sp
join (select  distinct Gia from sanpham order by Gia asc limit 1,3) as minsanpham on sp.Gia = minsanpham.Gia and NuocSX = 'Trung Quoc';


select  MaKH HOTEN from khachhang kh
join  (select  distinct DOANHSO from KHACHHANG order by DOANHSO desc limit 0,3) as maxDoanhSo on kh.DOANHSO = maxDoanhSo.DOANHSO; 

-- 30. Tính tổng số sản phẩm của từng nước sản xuất.
select count(MASP) as "tong so san pham", NUOCSX  from sanpham
group by NUOCSX;

























 



