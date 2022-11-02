package repository.impl;

import model.Employee;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    public static final String SELECT_ALL = "select * from employee where is_delete=0;";

    @Override
    public List<Employee> selectAll() {
        List<Employee> employeeList = new ArrayList<>();

        return null;
    }
}
