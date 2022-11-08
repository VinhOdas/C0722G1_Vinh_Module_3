package repository.impl;

import model.Employee;
import repository.DataBaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    public static final String SELECT_ALL = "select * from employee where is_delete=0;";
    public static final String SELECT_EMPLOYEES_BY_ID = "select * from employee where id =?";;
    public static final  String DELETE = "update employee set is_delete=1 where id = ?;";
    public static final  String UPDATE_EMPLOYEE = "update employee set name = ?,date_of_birth=?," +
            "id_card =?,salary=?,phone_number=?, email= ?, address =?,position_id=?" +
            ",education_degree_id=?,division_id =?, username =? where id = ?;";
    private static final String INSERT_EMPLOYEE_SQL =
            "INSERT INTO employee(`name`, `date_of_birth`," +
                    " `id_card`, `salary`, `phone_number`," +
                    " `email`, `address`, `position_id`, " +
                    "`education_degree_id`, `division_id`,`username`) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    public static final String SEARCH_NAME_ADDRESS = "select * from employee where is_delete=0 and name like ? and address like ?;";


    @Override
    public List<Employee> selectAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthDay = resultSet.getString("date_of_birth");
                String idCard = resultSet.getString("id_card");
                Double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                employeeList.add(new Employee(id,name,birthDay,idCard,salary,phone,email,address,positionId
                        ,educationDegreeId,divisionId,userName));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean deleteEmployee(int id) {
        boolean rowDelete = false;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            rowDelete =preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public Employee findById(int id) {
        Employee employee = null;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEES_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String date_of_birth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                double salary = rs.getDouble("salary");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String username = rs.getString("username");
                employee = new Employee(id, name, date_of_birth, idCard, salary, phoneNumber, email,
                        address, positionId, educationDegreeId, divisionId, username);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean editEployee(Employee employeeEdit) {
        boolean rowUpdate = false;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE);
            preparedStatement.setString(1,employeeEdit.getName());
            preparedStatement.setString(2,employeeEdit.getBirthDay());
            preparedStatement.setString(3,employeeEdit.getIdCard());
            preparedStatement.setString(4, String.valueOf(employeeEdit.getSalary()));
            preparedStatement.setString(5, String.valueOf(employeeEdit.getPhone()));
            preparedStatement.setString(6,employeeEdit.getEmail());
            preparedStatement.setString(7,employeeEdit.getAddress());
            preparedStatement.setString(8, String.valueOf(employeeEdit.getPosition_id()));
            preparedStatement.setString(9, String.valueOf(employeeEdit.getEducation_id()));
            preparedStatement.setString(10, String.valueOf(employeeEdit.getDivision_id()));
            preparedStatement.setString(11, employeeEdit.getUserName());
            preparedStatement.setString(12, String.valueOf(employeeEdit.getId()));
            System.out.println(preparedStatement);
            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdate;
    }

    @Override
    public void addEmployee(Employee employee) {
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthDay());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setString(4, String.valueOf(employee.getSalary()));
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setString(8, String.valueOf(employee.getPosition_id()));
            preparedStatement.setString(9, String.valueOf(employee.getEducation_id()));
            preparedStatement.setString(10, String.valueOf(employee.getDivision_id()));
            preparedStatement.setString(11, employee.getUserName());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {

        }

    }

    @Override
    public List<Employee> searchEmployeeDouble(String nameSearch, String address) {
        List<Employee> employeeSearch = new ArrayList<>();
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement ps =connection.prepareStatement(SEARCH_NAME_ADDRESS);
            ps.setString(1, "%" + nameSearch + "%");
            ps.setString(2, "%" + address + "%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthDay = resultSet.getString("date_of_birth");
                String idCard = resultSet.getString("id_card");
                Double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String addressEmployee = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                employeeSearch.add(new Employee(id,name,birthDay,idCard,salary,phone,email,addressEmployee,positionId
                        ,educationDegreeId,divisionId,userName));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeSearch;
    }
}
