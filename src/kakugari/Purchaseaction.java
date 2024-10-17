package kakugari;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/main_kakugari/Purchaseaction"})
public class Purchaseaction extends HttpServlet {
    public void doPost(
            HttpServletRequest request, HttpServletResponse response
            ) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String address = request.getParameter("address");

        if (name.isEmpty() || address.isEmpty()) {
            request.getRequestDispatcher("purchase-error-empty.jsp")
                   .forward(request, response);
            return;
        }

        session.removeAttribute("cart");
        request.getRequestDispatcher("purchase-out.jsp")
               .forward(request, response);
    }
}
