use furama_management;
select ho_ten from nhan_vien where( ho_ten regexp '^[HTK]') and (char_length(ho_ten) <= 15);