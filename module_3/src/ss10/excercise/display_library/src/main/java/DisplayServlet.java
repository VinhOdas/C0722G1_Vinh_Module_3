import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DisplayServlet",urlPatterns = "/display")
public class DisplayServlet extends HttpServlet {
    private static  List<Customer> customerList = new ArrayList<>();
    static {
      customerList.add(new Customer(1,"Siêu nhân gao", "1999-11-11","Bản Đôn"));
      customerList.add(new Customer(2,"Siêu nhân gao", "1999-11-11","Bản Đôn"));
      customerList.add(new Customer(3,"Siêu nhân gao", "1999-11-11","Bản Đôn"));
      customerList.add(new Customer(4,"Siêu nhân gao", "1999-11-11","Bản Đôn"));
      customerList.add(new Customer(5,"Siêu nhân gao", "1999-11-11","Bản Đôn"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("display.jsp").forward(request,response);
    }
}
