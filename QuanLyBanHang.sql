-- 1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
select distinct MASP, TENSP
from SANPHAM
where NUOCSX = 'Trung Quoc'

-- 2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
select MASP, TENSP, DVT
from SANPHAM
where DVT in ('cay', 'quyen')

-- 3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
select MASP , TENSP
from SANPHAM
where MASP like 'B%01'

-- 4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
select MASP, TENSP, GIA
from SANPHAM
where NUOCSX = 'Trung Quoc' 
and GIA between 30000 and 40000

-- 5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
select MASP, TENSP, GIA, NUOCSX
from SANPHAM
where NUOCSX in ('Trung Quoc', 'Thai Lan')
and GIA between 30000 and 40000

-- 6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
select SOHD, TRIGIA, NGMUA
from HOADON
where NGMUA = '2007-01-01 00:00:00' and '2007-01-01 23:59:00'
or NGMUA = '2007-01-02 00:00:00' and '2007-01-02 23:59:00'

-- 7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select SOHD, TRIGIA, NGMUA
from HOADON
where month(NGMUA) = '1' and year(NGMUA) = '2007'
order by NGMUA asc, TRIGIA desc

-- 8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select kh.MAKH, HOTEN
from KHACHHANG kh
join HOADON as hd on kh.MAKH = hd.MAKH
where NGMUA = '2007-01-01 00:00:00' and '2007-01-01 23:59:00'

-- 9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
select SOHD, TRIGIA, HOTEN
from HOADON hd
join NHANVIEN as nv on hd.MANV = nv.MANV
where HOTEN = 'Nguyen Van B'
and NGMUA = '2006-10-28 00:00:00' and '2006-10-28 23:59:00'

-- 10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
select sp.MASP, TENSP, NGMUA
from SANPHAM sp
join CTHD as cthd on sp.MASP = cthd.MASP
join HOADON as hd on cthd.SOHD = hd.SOHD
join KHACHHANG as kh on hd.MAKH = kh.MAKH
where HOTEN = 'Nguyen Van A' and
month(NGMUA) = '10' and year(NGMUA) = '2006'

-- 11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
select SOHD, MASP
from CTHD 
where MASP = 'BB01' or MASP = 'BB02'

-- 12.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select SOHD, MASP, SL
from CTHD 
where MASP = 'BB01' or MASP = 'BB02'
and SL between '10' and '20'

-- 13.	Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select SOHD, count(MASP)
from CTHD 
where MASP in ('BB01','BB02')
and SL between '10' and '20'
group by SOHD
having count(MASP) = 2

-- 14.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
select MASP, TENSP, NUOCSX
from SANPHAM sp
where NUOCSX = 'Trung Quoc' or sp.MASP in 
(select distinct sp.MASP from SANPHAM
join CTHD as cthd on sp.MASP = cthd.MASP
join HOADON as hd on hd.SOHD = cthd.SOHD
where NGMUA = '2007-01-01 00:00:00' and '2007-01-01 23:59:00')

-- 15.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
select MASP, TENSP
from SANPHAM
where MASP not in(select MASP from CTHD)

-- 16.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
select MASP, TENSP
from SANPHAM
where MASP not in (
select MASP from CTHD as cthd
join HOADON as hd on cthd.SOHD = hd.SOHD
where year(NGMUA) = '2006')

-- 17.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
select MASP, TENSP
from SANPHAM s
where NUOCSX = 'Trung Quoc' 
and MASP not in (
select MASP from CTHD as cthd
join HOADON as hd on cthd.SOHD = hd.SOHD
where year(NGMUA) = '2006')

-- 18.	Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
select distinct SOHD
from CTHD cthd
join SANPHAM as sp on cthd.MASP = sp.MASP
where NUOCSX = 'Singapore'

-- 19.	Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
select SOHD
from HOADON 
where year(NGMUA) = '2006' and SOHD in(
select SOHD from CTHD as cthd
join SANPHAM as sp on cthd.MASP = sp.MASP
and NUOCSX = 'Singapore')


-- 20.	Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select count(SOHD)
from HOADON
where MAKH not in (select MAKH from KHACHHANG)

-- 21.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select count(distinct MASP)
from CTHD cthd
join HOADON as hd on hd.SOHD = cthd.SOHD
where year(NGMUA) = '2006'

-- 22.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select max(TRIGIA) , min(TRIGIA)
from HOADON

-- 23.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg(TRIGIA) as GiaTriTrungBinh
from HOADON
where year(NGMUA) = '2006'

-- 24.	Tính doanh thu bán hàng trong năm 2006.
select sum(TRIGIA) as DoanhThu
from HOADON
where year(NGMUA) = '2006'


-- 25.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select SOHD
from HOADON
where TRIGIA = (select max(TRIGIA) from HOADON)
and year(NGMUA) = '2006'

-- 26.	Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select HOTEN
from KHACHHANG kh
join HOADON as hd on kh.MAKH = hd.MAKH
where TRIGIA = (select max(TRIGIA) from HOADON)
and year(NGMUA) = '2006'

-- 27.	In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
select MAKH, HOTEN, DOANHSO
from KHACHHANG
order by DOANHSO desc limit 3


-- 28.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select MASP, TENSP, GIA, NUOCSX
from SANPHAM
where GIA in (
select * from
(select GIA from SANPHAM group by GIA order by GIA desc limit 3) as MaxThree)

-- 29.	In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất 
-- (của tất cả các sản phẩm).

select MASP, TENSP, GIA
from SANPHAM
where NUOCSX = 'Thai Lan'
and GIA in (
select * from
(select GIA from SANPHAM group by GIA order by GIA desc limit 3) as MaxThree)

-- 30.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất 
-- (của sản phẩm do “Trung Quoc” sản xuất).
select MASP, TENSP, GIA, NUOCSX
from SANPHAM 
where NUOCSX = 'Trung Quoc' and GIA in (
select * from
(select GIA from SANPHAM
where NUOCSX = 'Trung Quoc'
group by GIA order by GIA desc limit 3) as MaxThree)

-- 31.	* In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
select MAKH, HOTEN, DOANHSO
from KHACHHANG
order by DOANHSO desc limit 3

-- 32.	Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select count(*)
from SANPHAM
where NUOCSX = 'Trung Quoc'

-- 33.	Tính tổng số sản phẩm của từng nước sản xuất.
select count(*), NUOCSX
from SANPHAM
group by NUOCSX

-- 34.	Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select distinct NUOCSX, max(GIA) as GiaCaoNhat, min(GIA) as GiaThapNhat, avg(GIA) as GiaTrungBinh
from SANPHAM
group by NUOCSX

-- 35.	Tính doanh thu bán hàng mỗi ngày.
select NGMUA, sum(TRIGIA) as DoanhThu
from HOADON
group by NGMUA

-- 36.	Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
select MASP,sum(SL) as TongSoLuong, NGMUA
from CTHD cthd
join HOADON as hd on cthd.SOHD = hd.SOHD
where month(NGMUA) = '10' and year(NGMUA) = '2006'
group by MASP, NGMUA

-- 37.	Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(NGMUA) as Thang, sum(TRIGIA) as TongDoanhThu
from HOADON
where year(NGMUA) = '2006'
group by month(NGMUA)

-- 38.	Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select SOHD, count(MASP)
from CTHD cthd
group by SOHD
having count(MASP) >= 4

-- 39.	Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select SOHD, count(cthd.MASP) as SoSanPhamMua
from CTHD cthd
join SANPHAM as sp on cthd.MASP = sp.MASP
where NUOCSX ='Viet Nam'
group by SOHD
having count(sp.MASP) = 3

-- 40.	Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
select kh.MAKH, HOTEN, count(NGMUA)
from KHACHHANG kh
join HOADON as hd on kh.MAKH = hd.MAKH
group by kh.MAKH, HOTEN
having count(NGMUA)
order by count(NGMUA) desc limit 1

-- 41.	Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
select month(NGMUA) as Thang, sum(TRIGIA) as DoanhSo
from HOADON
where year(NGMUA) = '2006'
group by month(NGMUA)
order by sum(TRIGIA) desc limit 1

-- 42.	Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select sp.MASP, sp.TENSP, sum(SL) as TongSoLuong
from SANPHAM sp
join CTHD as cthd on sp.MASP = cthd.MASP
join HOADON as hd on cthd.SOHD = hd.SOHD
where year(NGMUA) = '2006'
group by sp.MASP, sp.TENSP
order by sum(SL) asc limit 1

-- 43.	Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
select NUOCSX, MASP, TENSP, GIA
from SANPHAM a
where GIA = (select max(GIA) from SANPHAM b where b.NUOCSX = a.NUOCSX)

-- 44.	Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
select distinct NUOCSX, count(MASP)
from SANPHAM
group by NUOCSX
having count(MASP) >=3

-- 45.	*Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
-- DAU TIEN LA TIM 10 KHACH HANG CO DOANH SO CAO NHAT
select hd.MAKH, HOTEN, DOANHSO, count(SOHD) as SoLanMua
from KHACHHANG kh
join HOADON as hd on kh.MAKH = hd.MAKH
where DOANHSO in(
select * from
(select DOANHSO from KHACHHANG group by DOANHSO order by DOANHSO desc limit 10) as MaxThree)
group by hd.MAKH, HOTEN, DOANHSO
order by count(SOHD) desc limit 1

