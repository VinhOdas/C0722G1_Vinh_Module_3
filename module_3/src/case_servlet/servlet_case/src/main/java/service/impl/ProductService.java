package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductTroService;

import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductTroService {
    private IProductRepository productRepository = new ProductRepository();


    @Override
    public List<Product> selectAll() {
        return productRepository.selectAll();
    }

    @Override
    public void addProduct(Product product) {
        try {
            productRepository.addProduct(product);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Product> searchTriple(String searchName, String searchGia, String searchColor) {
        return productRepository.searchTriple(searchName,searchGia,searchColor);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }
}



