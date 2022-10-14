-- PHIEUXUAT(SOPX INT, NGAYXUAT DATE)
-- PHIEUNHAP(SOPN INT, NGAYNHAP DATE)
-- VATTU(MAVATTU INT, TENVATTU VARCHAR(50))
-- 1(DGXUAT DOUBLE, SLXUAT INT, SOPX INT, MAVATTU INT)
-- 2(DGNHAP DOUBLE, SLNHAP INT, SOPN INT, MAVATTU INT)
-- DONDH(SODH INT, NGAYDH DATE, MANCC INT)
-- 3(SODH INT, MAVTU INT)
-- NHACC(MANCC INT, TENNCC VARCHAR(50), DIACHI VARCHAR(50))
-- SDT(SDT VARCHAR(20), MANCC INT)

DROP DATABASE IF EXISTS convert_erd;
create database convert_erd;
use convert_erd;

create table phieu_xuat(
so_px int primary key auto_increment not null,
ngay_xuat datetime
);

create table vat_tu(
ma_vat_tu int primary key auto_increment not null,
ten_vat_tu varchar(50)
);

create table phieu_xuat_vat_tu (
dg_xuat double,
sl_xuat int,
so_px int,
ma_vat_tu int,	
primary key(so_px,ma_vat_tu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
so_pn int primary key auto_increment not null,
ngay_nhap datetime
);

create table phieu_nhap_vat_tu (
dg_nhap double,
sl_nhap int,
so_pn int,
ma_vat_tu int,	
primary key(so_pn,ma_vat_tu),
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table nha_cung_cap(
ma_nha_cung_cap int primary key auto_increment not null,
ten_nha_cung_cap varchar(50),
dia_chi varchar(50)
);

create table don_dat_hang(
so_dh int primary key auto_increment not null,
ngay_dh datetime,
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table so_dien_thoai (
so_dien_thoai varchar(50),
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang_vat_tu(
ma_vat_tu int,
so_dh int,
primary key(ma_vat_tu,so_dh),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_dh) references don_dat_hang(so_dh)
);