package repository;

import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> selectAll();

    boolean deleteEmployee(int id);

    Employee findById(int id);

    boolean editEployee(Employee employeeEdit);

    void addEmployee(Employee employee);

    List<Employee> searchEmployeeDouble(String nameSearch);
}
