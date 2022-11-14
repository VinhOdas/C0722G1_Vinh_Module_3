package service;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAll();

    void addCustomer(Customer customer);

    void updateCustomer(Customer customer);

    boolean deleteCustomer(int id);


    List<Customer> searchCustomer(String name);

    List<CustomerType> selectAllCustomerType();

    Customer findById(int id);
}
