package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> selectAll() {
        return employeeRepository.selectAll();
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public boolean editEmployee(Employee employeeEdit) {
        return employeeRepository.editEployee(employeeEdit);
    }

    @Override
    public void addEmployee(Employee employee) {
        employeeRepository.addEmployee(employee);

    }

    @Override
    public List<Employee> searchEmployeeDouble(String nameSearch, String address) {
        return employeeRepository.searchEmployeeDouble(nameSearch,address);
    }


}
