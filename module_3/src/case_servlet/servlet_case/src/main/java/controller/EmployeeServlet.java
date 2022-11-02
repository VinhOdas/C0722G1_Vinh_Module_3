package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employees")
public class EmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                insertEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
                break;

        }

    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp") ;
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {

    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            case "search":
                searchEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
                break;

        }

    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        
    }

    private void addFormEmployee(HttpServletRequest request, HttpServletResponse response) {
    }
    
}
