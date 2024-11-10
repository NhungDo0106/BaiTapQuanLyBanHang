I. Tạo bảng và data

CREATE DATABASE QLBH
-----------------------------------------------------
-----------------------------------------------------
---------------------------------------------USE QLBH
-- KHACHANG
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money,
	constraint pk_kh primary key(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
   CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
-----------------------------------------------------
-----------------------------------------------------
set dateformat dmy
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
----------------------------------------------------------------
----------------------------------------------------------------

II. Câu hỏi truy vấn
--1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
--2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
--3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
--4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
--5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
--6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
--7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
--8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
--9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
--10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
--11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
--12.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
--13.	Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
--14.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
--15.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
--16.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
--17.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
--18.	Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
--19.	Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
--20.	Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
--21.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
--22.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
--23.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
--24.	Tính doanh thu bán hàng trong năm 2006.
--25.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
--26.	Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
--27.	In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
--28.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
--29.	In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
--30.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
--31.	* In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
--32.	Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
--33.	Tính tổng số sản phẩm của từng nước sản xuất.
--34.	Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
--35.	Tính doanh thu bán hàng mỗi ngày.
--36.	Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
--37.	Tính doanh thu bán hàng của từng tháng trong năm 2006.
--38.	Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
--39.	Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
--40.	Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
--41.	Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
--42.	Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
--43.	*Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
--44.	Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
--45.	*Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.

III. Lời giải

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

