package mvc.model.service.impl;

import mvc.model.Product;
import mvc.model.repository.IProductRepository;
import mvc.model.repository.impl.ProductRepository;
import mvc.model.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void save(Product product) {
         productRepository.save(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public void remove(int id) {

    }

    @Override
    public List<Product> searchByName(String name) {
        return null;
    }

    @Override
    public List<Product> searchByPrice(double minPrice, double maxPrice) {
        return null;
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }


}
