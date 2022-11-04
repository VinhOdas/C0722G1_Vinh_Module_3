package mvc.model.repository;

import mvc.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void delete(int id);
}
