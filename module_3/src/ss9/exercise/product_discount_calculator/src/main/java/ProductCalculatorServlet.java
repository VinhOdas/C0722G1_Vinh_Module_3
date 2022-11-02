import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "ProductDiscountCalculatorServlet", urlPatterns = {"/display", "/hien-len"})
public class ProductCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String productDescription = request.getParameter("product_description");
        double listPrice = Double.parseDouble(request.getParameter("list_price"));
        BigDecimal listPrice1 = new BigDecimal(listPrice);
        double discountPercent = Double.parseDouble((request.getParameter("discount_percent")));
        BigDecimal discountPercent1 = new BigDecimal(discountPercent);
        BigDecimal discountAmount = new BigDecimal(listPrice * discountPercent * 0.01);
        BigDecimal discountPrice = new BigDecimal(listPrice + (listPrice * discountPercent * 0.01));

        request.setAttribute("product_description", productDescription);
        request.setAttribute("list_price", listPrice1);
        request.setAttribute("discount_percent", discountPercent1);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        request.getRequestDispatcher("/display.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }
}
