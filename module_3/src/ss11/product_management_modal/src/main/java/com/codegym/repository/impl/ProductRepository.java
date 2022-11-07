package com.codegym.repository.impl;

import com.codegym.model.Product;
import com.codegym.repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    private static List<Product> products;

    static {
        products = new ArrayList<>();
        products.add(new Product(1, "Hoàng", 110000, "mô tả", "A5"));
        products.add(new Product(2, "Vinh", 40000, "mô tả", "A5"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public Product findById(int id) {
        for (Product product : products
        ) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        int index = findIndex(id);
        products.remove(index);
        products.add(index, product);
    }

    @Override
    public void remove(int id) {
        int index = findIndex(id);
        products.remove(index);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productsFound = new ArrayList<>();
        for (Product product : products
        ) {
            if (product.getName().contains(name)) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }

    @Override
    public List<Product> findByProducer(String producer) {
        List<Product> productsFound = new ArrayList<>();

        for (Product product : products
        ) {
            if (product.getProducer().contains(producer)) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }

    @Override
    public List<Product> findByPrice(double min, double max) {
        List<Product> productsFound = new ArrayList<>();

        for (Product product : products
        ) {
            if (product.getPrice() > min && product.getPrice() < max) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }

    public int findIndex(int id) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }

}
