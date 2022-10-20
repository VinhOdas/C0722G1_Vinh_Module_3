use khu_nghi_duong_furama;

-- task 6
-- 	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from dich_vu 
inner join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu not in (
select hop_dong.ma_dich_vu from hop_dong
where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31');


-- task 7
-- Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu in (
select hop_dong.ma_dich_vu 
from hop_dong
where year(hop_dong.ngay_lam_hop_dong)=2020) and dich_vu.ma_dich_vu not in (
select hop_dong.ma_dich_vu 
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021);


-- task 8
-- Hiển thị thông tin ho_ten khách hàng có trong hệ thống,
--  với yêu cầu ho_ten không trùng nhau

-- cách 1:
select ho_ten 
from khach_hang
group by ho_ten;

-- cách 2:
Select Distinct ho_ten
From khach_hang;

-- cách 3:
SElect ho_ten 
FRom khach_hang a
UNion
sElect ho_ten
FRom khach_hang b;

-- task 9
-- thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có
-- bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngay_lam_hop_dong) as thang_lam_hop_dong, count(ma_hop_dong) 
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang_lam_hop_dong
order by thang_lam_hop_dong;

-- task 10
-- hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, 
sum(ifnull(hop_dong_chi_tiet.so_luong,0))
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;


