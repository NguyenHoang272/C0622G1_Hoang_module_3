use furama_management;
-- task 2
select ho_ten from nhan_vien where( ho_ten regexp '^[HTK]') and (char_length(ho_ten) <= 15);
-- task 3
select * from khach_hang where (timestampdiff(year,ngay_sinh,curdate()) between 18 and 50) and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');
-- task4
SELECT  khach_hang.ma_khach_hang, khach_hang.ho_ten,COUNT(hop_dong.ma_khach_hang) as so_lan_dat_phong FROM khach_hang
INNER JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
INNER JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE (loai_khach.ten_loai_khach="Diamond") 
GROUP BY hop_dong.ma_khach_hang 
ORDER BY so_lan_dat_phong ;
-- task5
SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
 dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,
(ifnull(dich_vu.chi_phi_thue,0)+ SUM(ifnull(hop_dong_chi_tiet.so_luong,0)*ifnull(dich_vu_di_kem.gia,0))) as tong_tien
FROM khach_hang
JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
LEFT JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong,khach_hang.ma_khach_hang
ORDER BY khach_hang.ma_khach_hang;

-- task6: 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các 
-- loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu FROM
dich_vu
INNER JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE dich_vu.ma_dich_vu NOT IN (
SELECT hop_dong.ma_dich_vu FROM hop_dong
WHERE hop_dong.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-03-31');

-- task7: 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng 
-- trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu,dich_vu.dien_tich,
dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
FROM dich_vu
JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE dich_vu.ma_dich_vu IN (
SELECT hop_dong.ma_dich_vu FROM hop_dong
WHERE hop_dong.ngay_lam_hop_dong BETWEEN'2020-01-00' AND '2020-12-31') AND dich_vu.ma_dich_vu NOT IN (
SELECT hop_dong.ma_dich_vu FROM hop_dong
WHERE hop_dong.ngay_lam_hop_dong > '2020-12-31');


-- task8
SELECT ho_ten FROM khach_hang
GROUP BY ho_ten;
SELECT DISTINCT ho_ten FROM khach_hang;
SELECT ho_ten FROM khach_hang a
UNION
SELECT ho_ten FROM khach_hang b;
-- task9
SELECT month(ngay_lam_hop_dong) as thang, COUNT(ma_hop_dong) FROM hop_dong
WHERE year(ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;
-- task 10
SELECT hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, 
SUM(ifnull(hop_dong_chi_tiet.so_luong,0))
FROM hop_dong
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong;

-- task 11
SELECT dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem 
FROM dich_vu_di_kem
JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
JOIN hop_dong ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
JOIN khach_hang ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
JOIN loai_khach ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
WHERE loai_khach.ten_loai_khach = "Diamond" AND (khach_hang.dia_chi LIKE "%VINH%" OR khach_hang.dia_chi LIKE "%Quảng Ngãi%");
-- task 12
SELECT hop_dong.ma_hop_dong,nhan_vien.ho_ten,khach_hang.ho_ten, khach_hang.so_dien_thoai,dich_vu.ten_dich_vu,SUM(ifnull(hop_dong_chi_tiet.so_luong,0)),hop_dong.tien_dat_coc
FROM hop_dong
JOIN nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
JOIN khach_hang ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
WHERE hop_dong.ma_hop_dong IN (SELECT hop_dong.ma_hop_dong FROM hop_dong
WHERE hop_dong.ngay_lam_hop_dong BETWEEN '2020-10-01' AND '2020-12-31') AND hop_dong.ma_hop_dong NOT IN (
SELECT hop_dong.ma_hop_dong FROM hop_dong
WHERE hop_dong.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-06-31')
GROUP BY hop_dong.ma_hop_dong;

-- task 13
SELECT dvdk.ma_dich_vu_di_kem,
       dvdk.ten_dich_vu_di_kem,
       sum(hdct.so_luong) so_lan_su_dung
FROM dich_vu_di_kem dvdk
INNER JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING so_lan_su_dung >= ALL
  (SELECT sum(hdct.so_luong) so_lan_su_dung
   FROM dich_vu_di_kem dvdk
   INNER JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
   GROUP BY dvdk.ma_dich_vu_di_kem);


-- task 14
SELECT hop_dong.ma_hop_dong,
loai_dich_vu.ten_loai_dich_vu,
dich_vu_di_kem.ten_dich_vu_di_kem,
COUNT(hop_dong_chi_tiet.ma_dich_vu_di_kem) as so_lan_su_dung
FROM hop_dong
JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
JOIN dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
HAVING COUNT(hop_dong_chi_tiet.ma_dich_vu_di_kem) = 1
ORDER BY hop_dong.ma_hop_dong;
-- task 15
SELECT nhan_vien.ma_nhan_vien,
nhan_vien.ho_ten,
trinh_do.ten_trinh_do,
bo_phan.ten_bo_phan,
nhan_vien.so_dien_thoai,
nhan_vien.dia_chi
FROM nhan_vien
JOIN trinh_do ON nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
JOIN bo_phan ON nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
JOIN hop_dong ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
WHERE YEAR(hop_dong.ngay_lam_hop_dong) BETWEEN "2020" AND "2021"
GROUP BY nhan_vien.ma_nhan_vien
HAVING COUNT(hop_dong.ma_hop_dong) < 4;

-- task 16:	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES = 0;
delete
from nhan_vien
where nhan_vien.ma_nhan_vien not in(
select nv_chua_tao_hd.nv_mnv from(
select 
	nhan_vien.ma_nhan_vien as nv_mnv
from nhan_vien join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where hop_dong.ngay_lam_hop_dong between '2019-01-01' and '2021-12-31'   
group by nhan_vien.ma_nhan_vien) as nv_chua_tao_hd);

select nhan_vien.ma_nhan_vien from nhan_vien;

-- Task 17
DROP VIEW IF EXISTS demo2;
CREATE VIEW demo2 AS
SELECT khach_hang.ma_khach_hang,
khach_hang.ho_ten,
loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong, 
dich_vu.ten_dich_vu,
hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc,
(ifnull(dich_vu.chi_phi_thue,0)+ SUM(ifnull(hop_dong_chi_tiet.so_luong,0)*ifnull(dich_vu_di_kem.gia,0)))  as tong_tien
FROM khach_hang
LEFT JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
LEFT JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong, khach_hang.ma_khach_hang
ORDER BY khach_hang.ma_khach_hang;
UPDATE khach_hang
JOIN demo2 on khach_hang.ma_khach_hang = demo2.ma_khach_hang
JOIN hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
SET khach_hang.ma_loai_khach =1
WHERE khach_hang.ma_loai_khach=2 AND khach_hang.ma_khach_hang IN (SELECT demo2.ma_khach_hang FROM demo2 WHERE demo2.tong_tien >10000000
) AND YEAR(hop_dong.ngay_lam_hop_dong) BETWEEN 2021 AND 2021;
SELECT * FROM khach_hang;
-- Task 18
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM khach_hang
WHERE khach_hang.ma_khach_hang IN (SELECT hop_dong.ma_khach_hang FROM hop_dong WHERE (YEAR(hop_dong.ngay_lam_hop_dong) < 2021 ));
UPDATE dich_vu_di_kem
SET gia = gia*2
WHERE ma_dich_vu_di_kem in
    (SELECT*
     FROM
       (SELECT dvdk.ma_dich_vu_di_kem
        FROM hop_dong hd
        JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        WHERE year(hd.ngay_lam_hop_dong) = 2020
        GROUP BY hdct.ma_dich_vu_di_kem
        HAVING sum(hdct.so_luong) > 10) AS minchou) ; 
-- Task 20
SELECT nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,nhan_vien.email,nhan_vien.so_dien_thoai,nhan_vien.ngay_sinh,nhan_vien.dia_chi FROM nhan_vien
UNION ALL
SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.email,khach_hang.so_dien_thoai,khach_hang.ngay_sinh,khach_hang.dia_chi FROM khach_hang;

-- task 21 Tạo khung nhìn có tên là v_nhan_vien để lấy được 
-- thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì
-- với ngày lập hợp đồng là “12/12/2019”.



CREATE VIEW v_nhan_vien AS
SELECT nv.*
FROM nhan_vien nv
JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE hd.ngay_lam_hop_dong like '%2019-12-12%'
  AND dia_chi like '%Hải Châu%';


select* from nhan_vien;
select* from hop_dong;
-- task 22 Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

SET SQL_SAFE_UPDATES = 0;


UPDATE v_nhan_vien
SET dia_chi = 'Liên Chiểu';

-- task 23 Tạo Stored Procedure sp_xoa_khach_hang dùng để 
-- xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(in ma_khach_hang int) BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM khach_hang kh
WHERE kh.ma_khach_hang = ma_khach_hang ; END //
DELIMITER ;

CALL sp_xoa_khach_hang(1);
SELECT*
FROM khach_hang;



--  task 24 Tạo Stored Procedure sp_them_moi_hop_dong dùng để 
-- thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện 
-- kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính 
-- và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan. 

DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong(ma_hop_dong int, ngay_lam_hop_dong datetime, ngay_ket_thuc datetime, tien_dat_coc DOUBLE, ma_nhan_vien int , ma_khach_hang int, ma_dich_vu int) BEGIN
SET SQL_SAFE_UPDATES = 0; IF EXISTS
  (SELECT hd.ma_hop_dong
   FROM hop_dong hd
   WHERE hd.ma_hop_dong = ma_hop_dong) THEN
SELECT 'mã hợp đồng bị trùng' AS message; elseif NOT EXISTS
  (SELECT hd.ma_nhan_vien
   FROM hop_dong hd
   WHERE hd.ma_nhan_vien = ma_nhan_vien) THEN
SELECT 'mã nhân viên không tồn tại' AS message; elseif NOT EXISTS
  (SELECT hd.ma_khach_hang
   FROM hop_dong hd
   WHERE hd.ma_khach_hang = ma_khach_hang) THEN
SELECT 'mã khách hàng không tồn tại' AS message; elseif NOT EXISTS
  (SELECT hd.ma_dich_vu
   FROM hop_dong hd
   WHERE hd.ma_dich_vu = ma_dich_vu) THEN
SELECT 'mã dịch vụ không tồn tại' AS message; ELSE
INSERT INTO hop_dong
VALUES (ma_hop_dong,
        ngay_lam_hop_dong,
        ngay_ket_thuc,
        tien_dat_coc,
        ma_nhan_vien,
        ma_khach_hang,
        ma_dich_vu) ; END IF; END //
DELIMITER ;

CALL sp_them_moi_hop_dong(14, '2020-12-08', '2020-12-08', 0, 14, 1, 3);



-- task 25 Tạo Trigger có tên tr_xoa_hop_dong khi 
-- xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại 
-- có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

DROP TRIGGER tr_xoa_hop_dong;

DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong AFTER
DELETE ON hop_dong
FOR EACH ROW BEGIN
INSERT INTO hop_dong_log (content, created_date)
SELECT count(*),
       sysdate()
FROM hop_dong; END //
DELIMITER ;


CREATE TABLE hop_dong_log (content varchar (50),
                                   created_date datetime);


DELETE
FROM hop_dong
WHERE ma_hop_dong = 2;

SELECT*
FROM hop_dong_log;


