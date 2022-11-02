package service;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductTroService {
    List<Product> selectAll();

    void addProduct(Product product);

    List<Product> searchTriple(String searchName, String searchGia, String searchColor);

    void delete(int id);

}
