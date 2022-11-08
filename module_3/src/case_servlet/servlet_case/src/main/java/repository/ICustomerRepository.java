package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> selectAll();

    void addCustomer(Customer customer);

    boolean updateCustomer(Customer customer);

    boolean deleteCustomer(int id);

    List<Customer> searchCustomer(String name);
}