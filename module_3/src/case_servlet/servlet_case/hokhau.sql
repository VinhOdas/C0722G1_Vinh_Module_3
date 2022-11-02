drop DATABASE IF EXISTS ho_khau ;
CREATE DATABASE ho_khau;
USE ho_khau;
CREATE TABLE `ho_khau`.`ho_khau` (
  `ma_ho_khau` INT PRIMARY KEY AUTO_INCREMENT,
  `ngay_lap_ho_khau` DATE ,
  `dia_chi` VARCHAR(45)
   );
   CREATE TABLE `ho_khau`.`thanh_vien` (
  `cmnd` VARCHAR(50)  PRIMARY KEY,
  `ho_ten` VARCHAR(45) ,
  `ngay_sinh` VARCHAR(45) ,
  `ma_ho_khau` INT ,
  FOREIGN KEY (`ma_ho_khau` ) REFERENCES ho_khau(ma_ho_khau)
  );
SELECT * FROM ho_khau.ho_khau;
INSERT INTO `ho_khau`.`ho_khau` (`ma_ho_khau`, `ngay_lap_ho_khau`, `dia_chi`) VALUES ('123', '1999-10-10', 'duy xuyen');
INSERT INTO `ho_khau`.`ho_khau` (`ma_ho_khau`, `ngay_lap_ho_khau`, `dia_chi`) VALUES ('456', '1999-10-10', 'duy xuyen');
SELECT * FROM ho_khau.thanh_vien;
INSERT INTO `ho_khau`.`thanh_vien` (`cmnd`, `ho_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('1111111111', 'hung', '2000-12-12', '123');
INSERT INTO `ho_khau`.`thanh_vien` (`cmnd`, `ho_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('2222222222', 'quang', '2000-12-12', '123');
INSERT INTO `ho_khau`.`thanh_vien` (`cmnd`, `ho_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('3333333333', 'son', '2000-12-12', '123');
INSERT INTO `ho_khau`.`thanh_vien` (`cmnd`, `ho_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('4444444444', 'cho', '2000-12-12', '123');
INSERT INTO `ho_khau`.`thanh_vien` (`cmnd`, `ho_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('5555555555', 'hai', '2000-12-12', '456');
INSERT INTO `ho_khau`.`thanh_vien` (`cmnd`, `ho_ten`, `ngay_sinh`, `ma_ho_khau`) VALUES ('6666666666', 'tung', '2000-12-12', '456');
CREATE VIEW quan_ly_ho_khau AS
					select
					hk.ma_ho_khau ,tv.ho_ten , count(hk.ma_ho_khau) as so_thannh_vien,
					hk.ngay_lap_ho_khau, hk.dia_chi
					from thanh_vien tv
					join ho_khau hk on hk.ma_ho_khau = tv.ma_ho_khau
					group by  hk.ma_ho_khau;
