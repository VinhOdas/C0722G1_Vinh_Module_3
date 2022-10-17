-- task 4
-- bài 2
select 
    *
from
    nhan_vien
where
    (ho_ten regexp '^[HKT]')
        and (char_length(ho_ten) <= 15);
-- bài 3
select 
    *
from
    khach_hang
where
    (dia_chi like '% Quảng Trị'
        or dia_chi like '% Đà Nẵng')
        and ((year(now()) - YEAR(ngay_sinh) between 18 and 50));
       
       
-- bài 4
select  khach_hang.ma_khach_hang, khach_hang.ho_ten,count(hop_dong.ma_khach_hang) as so_lan_dat_phong 
from khach_hang 
 join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where (loai_khach.ten_loai_khach="Diamond") 
group by  hop_dong.ma_khach_hang 
order by so_lan_dat_phong ;


 -- bài 5 
 select
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
 (ifnull(dv.chi_phi_thue,0)+ sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))) as tong_tien
 from hop_dong hd
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by  hd.ma_hop_dong
order by  kh.ma_khach_hang ;

