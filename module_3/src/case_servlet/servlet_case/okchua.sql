drop DATABASE IF EXISTS final ;
CREATE DATABASE final;
USE final;
-- CREATE TABLE `final`.`action` (
-- 	`id_danh_muc` INT PRIMARY KEY AUTO_INCREMENT,
--     danh_muc varchar(45)

--    );
CREATE TABLE `final`.`product` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `ten_san_pham` varchar(45) ,
  `gia` double,
  `so_luong` int,
  `mau_sac` varchar(45),
  `mo_ta` varchar(45),
  is_delete bit default 0
--   id_danh_muc varchar(45)
--   foreign key(id_danh_muc) references action(id_danh_muc)
   );
   INSERT INTO `final`.`product` (`id`, `ten_san_pham`, `gia`, `so_luong`, `mau_sac`, `mo_ta`, `is_delete`) VALUES ('1', 'ca phe ', '1', '2', 'xanh', 'szdsad', b'0');

   
INSERT INTO `final`.`product` (`id`, `ten_san_pham`, `gia`, `so_luong`, `mau_sac`, `mo_ta`) VALUES ('1', 'vinh', '1', '2', 'xanh', 'ok');





   
   ;
   
   CREATE VIEW quan_ly_phong_tro AS
    SELECT 
        pt.ma_phong_tro,
        nt.ten_nguoi_thue,
        sdt.sdt,
        nt.ngay_bat_dau,
        httt.hinh_thuc_thanh_toan,
        pt.ghi_chu
    FROM
        nguoi_thue nt
            JOIN
        phong_tro pt ON pt.ma_phong_tro = nt.ma_phong_tro
            JOIN
        hinh_thuc_thanh_toan httt ON httt.ma_hinh_thuc_thanh_toan = nt.ma_hinh_thuc_thanh_toan
		join so_dien_thoai sdt on sdt.ma_nguoi_thue = nt.ma_nguoi_thue
       

