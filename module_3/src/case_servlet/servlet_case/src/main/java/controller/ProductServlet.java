package controller;

import model.Product;
import service.IProductTroService;
import service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import static com.sun.javafx.fxml.expression.Expression.add;
import static jdk.nashorn.internal.objects.NativeString.search;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    IProductTroService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addProduct(request, response);

                break;
            case "edit":
                edit(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
            default:
                findAll(request, response);
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String searchName = (request.getParameter("searchName"));
        String searchGia = request.getParameter("searchGia");
        String searchColor = request.getParameter("searchColor");
        List<Product> productList = productService.searchTriple(searchName,searchGia,searchColor);
        request.setAttribute("productList", productList);

        try {
            request.getRequestDispatcher("view/product/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("tenSanPham");
        double gia = Double.parseDouble(request.getParameter("gia"));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        String mauSac = request.getParameter("mauSac");
        String moTa = request.getParameter("moTa");
        productService.addProduct(new Product(name,gia,soLuong,mauSac,moTa));
        request.setAttribute("mess", "Thêm mới thành công");

        try {
            request.getRequestDispatcher("view/product/add.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    private void findAll(HttpServletRequest request, HttpServletResponse response) {
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                findAllDto(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                findAllDto(request, response);

        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);

        List<Product> productList = productService.selectAll();
        request.setAttribute("productList", productList);
        request.setAttribute("mess", "Xóa thành công");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/product/lis.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/product/add.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findAllDto(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.selectAll();
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("/view/product/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
