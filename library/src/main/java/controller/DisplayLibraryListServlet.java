package controller;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DisplayLibraryListServlet", urlPatterns = "/display")
public class DisplayLibraryListServlet extends HttpServlet {
private static List<Customer> customerList = new ArrayList<>();

static {
    customerList.add(new Customer(1,"Siêu nhân gao","1983-08-05","Bản Đôn"));
    customerList.add(new Customer(2,"Siêu nhân đỏ","1983-08-05","Tây Ninh"));
    customerList.add(new Customer(3,"Siêu nhân vàng","1983-08-05","Động Thủ Thiêm"));
    customerList.add(new Customer(4,"Siêu nhân xanh","1983-08-05","Hà Nội"));
    customerList.add(new Customer(5,"Con điên","1983-08-05","Đà Nẵng"));
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    request.setAttribute("listServlet",customerList);
    request.getRequestDispatcher("display.jsp").forward(request,response);
}
}
