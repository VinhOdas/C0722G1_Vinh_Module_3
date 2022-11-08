package repository.impl;

import model.Customer;
import repository.DataBaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    List<Customer> customerList = new ArrayList<>();
    public static final String SELECT_ALL = "select * from customer where is_delete=0;";
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (customer_type_id,name,date_of_birth,gender,id_card,phone_number, email,address) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String DELETE_CUSTOMER_SQL = "update customer set is_delete = 1  where id = ?;";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id = ?,name= ?,date_of_birth=?,gender=?,id_card=?,phone_number=?, email=?,address=? where id = ?;";
    private static final String SEARCH_NAME_CUSTOMER = "select * from customer where name like ?";
    @Override
    public List<Customer> selectAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                boolean gender = rs.getBoolean("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                customerList.add(new Customer(id,customerTypeId,name,dateOfBirth,gender,idCard,
                        phoneNumber,email,address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void addCustomer(Customer customer) {
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
            preparedStatement.setInt(1, customer.getType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthDay());
            preparedStatement.setBoolean(4, customer.isGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public boolean updateCustomer(Customer customer) {
        boolean updateCustomer = false;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);
            preparedStatement.setInt(1, customer.getType());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthDay());
            preparedStatement.setBoolean(4, customer.isGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getId());
            System.out.println(preparedStatement);
            updateCustomer = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return updateCustomer;
    }

    @Override
    public boolean deleteCustomer(int id) {
        boolean deleteCustomer = false;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL);
                preparedStatement.setInt(1,id);
                deleteCustomer = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return deleteCustomer;
    }

    @Override
    public List<Customer> searchCustomer(String name) {
        List<Customer> customerSearch =new ArrayList<>();
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_NAME_CUSTOMER);
            ps.setString(1,"%" + name + "%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String nameSearh = resultSet.getString("name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                customerSearch.add(new Customer(id,customerTypeId,nameSearh,dateOfBirth,gender,idCard,
                        phoneNumber,email,address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerSearch;
    }
}
