package repository;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepository {
//    List<QuanLyPhongTroDTO> searchDouble(String search, int type);
//
//    List<QuanLyPhongTroDTO> findByName(String search);
//
//    QuanLyPhongTroDTO findById(int id);
//
//    boolean update(QuanLyPhongTroDTO quanLyPhongTroDTO);
//
//    boolean delete(int id);

    List<Product> selectAll();

    void addProduct(Product product) throws SQLException;

    List<Product> searchTriple(String searchName, String searchGia, String searchColor);

    boolean delete(int id);
}
