package controller;

import model.Employee;
import service.IEmployeeService;
import service.impl.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employees")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                listEmployee(request, response);
                break;
            case "add":
                insertEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
                break;

        }

    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAll();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthDay = request.getParameter("birthDay");
        String idCard = request.getParameter("idCard");
        Double salary = Double.valueOf(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("idPosition"));
        int educationId = Integer.parseInt(request.getParameter("idEducationDegree"));
        int divisionId = Integer.parseInt(request.getParameter("idDivision"));
        String userName = request.getParameter("userName");
        Employee employeeEdit = new Employee(id,name,birthDay,idCard,salary,phone,email,
                address,positionId,educationId,divisionId,userName);
            employeeService.editEmployee(employeeEdit);
        try {
            response.sendRedirect("/employees");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameEmployee");
        String birthDay = request.getParameter("birthDay");
        String idCardEmployee = request.getParameter("idCardEmployee");
        double salaryEmployee = Double.parseDouble(request.getParameter("salaryEmployee"));
        String phone = request.getParameter("phoneNumberEmployee");
        String email = request.getParameter("emailEmployee");
        String address = request.getParameter("addressEmployee");
        int idPosition = Integer.parseInt(request.getParameter("idPosition"));
        int idEducationDegree = Integer.parseInt(request.getParameter("idEducationDegree"));
        int idDivision = Integer.parseInt(request.getParameter("idDivision"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(name, birthDay, idCardEmployee, salaryEmployee, phone, email, address, idPosition,
                idEducationDegree, idDivision, userName);

        employeeService.addEmployee(employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/add.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "add":
                addFormEmployee(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;

            default:
                listEmployee(request, response);
                break;

        }

    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch = request.getParameter("search");
        List<Employee> employeeList = employeeService.searchEmployeeDouble(nameSearch);
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("search",nameSearch);
        request.setAttribute("saveSearch",nameSearch);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = false;
        check = employeeService.deleteEmployee(id);
        String message = "Không xóa được";
        if (check) {
            message = "Xóa nhân viên thành công";
        }
        request.setAttribute("message", message);
        request.setAttribute("check", check);
        listEmployee(request, response);

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee editEmployee =employeeService.findById(id);
        request.setAttribute("employeeEdit",editEmployee);
        try {
            request.getRequestDispatcher("view/employee/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) { e.printStackTrace();

        }


    }

    private void addFormEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/add.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
