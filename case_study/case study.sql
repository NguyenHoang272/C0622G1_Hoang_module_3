use furama_management;
-- task 2
select ho_ten from nhan_vien where( ho_ten regexp '^[HTK]') and (char_length(ho_ten) <= 15);
-- task 3
select * from khach_hang where (timestampdiff(year,ngay_sinh,curdate()) between 18 and 50) and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');
-- task4
SELECT  khach_hang.ma_khach_hang, khach_hang.ho_ten,COUNT(hop_dong.ma_khach_hang) as so_lan_dat_phong FROM khach_hang
INNER JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
INNER JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE (loai_khach.ten_loai_khach="Diamond") GROUP BY hop_dong.ma_khach_hang ORDER BY so_lan_dat_phong ;
-- task5
SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, (ifnull(dich_vu.chi_phi_thue,0)+ ifnull(hop_dong_chi_tiet.so_luong,0)*ifnull(dich_vu_di_kem.gia,0)) as tong_tien
FROM khach_hang
JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
LEFT JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
LEFT JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong
ORDER BY khach_hang.ma_khach_hang;

-- task6
SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu FROM
dich_vu
INNER JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE dich_vu.ma_dich_vu NOT IN (
SELECT hop_dong.ma_dich_vu FROM hop_dong
WHERE hop_dong.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-03-31');
-- task7
SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu FROM
dich_vu
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
SELECT hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, SUM(ifnull(hop_dong_chi_tiet.so_luong,0))
FROM hop_dong
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong;

-- task 11
SELECT dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem FROM dich_vu_di_kem
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
CREATE VIEW demo AS
SELECT dich_vu_di_kem.ma_dich_vu_di_kem as ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem as ten_dich_vu_di_kem, SUM(ifnull(hop_dong_chi_tiet.so_luong,0)) as so_luong_dich_vu_di_kem  FROM dich_vu_di_kem
JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem;