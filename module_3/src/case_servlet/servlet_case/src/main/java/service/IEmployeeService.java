package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> selectAll();

    boolean deleteEmployee(int id);

    Employee findById(int id);

    boolean editEmployee(Employee employeeEdit);

    void addEmployee(Employee employee);

    List<Employee> searchEmployeeDouble(String nameSearch, String address);

}
