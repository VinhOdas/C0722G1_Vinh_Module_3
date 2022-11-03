-- task 16
--  16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

-- cach1:
DELETE FROM nhan_vien
WHERE not eXists(SELECT ma_nhan_vien from hop_dong
WHERE ma_nhan_vien = nhan_vien.ma_nhan_vien ANd year(hop_dong.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);
SeLect ma_nhan_vien, ho_ten 
from nhan_vien;

-- cach2:
deleTE FROM nhan_vien
WHERE nhan_vien.ma_nhan_vien not IN (
SELEcT hop_dong.ma_nhan_vien 
froM hop_dong
WHERE year(hop_dong.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);
SeLect ma_nhan_vien, ho_ten
from nhan_vien;

-- task 17
--  17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 1.000.000 VNĐ. ??????

sELECT *
 FROM khach_hang;

update khach_hang
set khach_hang.ma_loai_khach = 1
where khach_hang.ma_khach_hang IN (select k.ma_khach_hang
						from khach_hang k 
						join hop_dong hd on hd.ma_khach_hang = k.ma_khach_hang
						join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
						join hop_dong_chi_tiet hdd on hdd.ma_hop_dong = hd.ma_hop_dong
						join dich_vu_di_kem dk on dk.ma_dich_vu_di_kem = hdd.ma_dich_vu_di_kem
						join loai_khach lk on lk.ma_loai_khach = k.ma_loai_khach
						where lk.ten_loai_khach = 'platinium' and year(hd.ngay_lam_hop_dong) = 2021
						group by k.ma_khach_hang
						having sum((dv.chi_phi_thue + (hdd.so_luong * dk.gia))) > 1000000);
                        

-- task 18
-- xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

-- cach 1:
ALTER TABLE khach_hang
ADD trang_thai BOOLEAN DEFAULT 1;

UPDATE khach_hang
SET trang_thai = 0
Where ma_khach_hang IN (selECT ma_khach_hang
fRom hop_dong
where year(hop_dong.ngay_lam_hop_dong)<2021);
SELECT * FRom khach_hang WHERE trang_thai = 0;



-- cach2:
sET FOREIgN_KEY_CHECKS=0;
Delete  FRom khach_hang
WHERE khach_hang.ma_khach_hang IN (
SELECT ma_khach_hang
FROM hop_dong
Where year(hop_dong.ngay_lam_hop_dong)<2021);
SELECT * 
frOm khach_hang;
SET FOREIgn_kEY_CHECKS=1;


-- task 19
-- cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

DROP VIEW IF EXISTS view3;
CREATE VIEW view3 AS
SELECT hop_dong_chi_tiet.ma_dich_vu_di_kem, SUM(hop_dong_chi_tiet.so_luong) as so_luong 
From hop_dong_chi_tiet
joiN hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
WHERE hop_dong.ma_hop_dong  IN (
selECT hop_dong.ma_hop_dong 
FROM hop_dong 
WHErE year(hop_dong.ngay_lam_hop_dong)=2020)
GROup by hop_dong_chi_tiet.ma_dich_vu_di_kem;
SELECt * from view3;

uPDATE dich_vu_di_kem 
JOIN view3 ON view3.ma_dich_vu_di_kem =  dich_vu_di_kem.ma_dich_vu_di_kem
SET dich_vu_di_kem.gia = dich_vu_di_kem.gia*2
WHERE view3.so_luong>10;
SELECT * FROM dich_vu_di_kem;

-- ko dùng view

UPDATE dich_vu_di_kem 
SeT 
    gia = gia * 2
WHEre
    ma_dich_vu_di_kem iN (selecT 
            tinh_tong.ma_dich_vu_di_kem
        FROM
            (SELECT 
                hdct.ma_dich_vu_di_kem, suM(hdct.so_luong) AS tong_so_lan_su_dung
            FROM
                hop_dong_chi_tiet hdct
            JOIN hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
            WHERe
                    YEAR(hd.ngay_lam_hop_dong) = 2020
            GROUP bY hdct.ma_dich_vu_di_kem
            HAVING tong_so_lan_su_dung > 10 )
            as tinh_tong) ;

-- task 20
-- Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT 'nhan vien' as type, ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi 
FROM nhan_vien
UNION ALL
SELECT 'khach hang' as type, ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi 
FROM khach_hang;