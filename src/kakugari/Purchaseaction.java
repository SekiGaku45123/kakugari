package kakugari;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.BuysearchDAO;

@WebServlet(urlPatterns={"/main_kakugari/Purchaseaction"})
public class Purchaseaction extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("search");

        String name = user != null ? user.getUser_name() : request.getParameter("name");
        String address = user != null ? user.getUser_address() : request.getParameter("address");

        if (name == null || name.isEmpty() || address == null || address.isEmpty()) {
            request.getRequestDispatcher("purchase-error-empty.jsp")
                   .forward(request, response);
            return;
        }

        try {
            BuysearchDAO dao = new BuysearchDAO();
            User result = dao.search(name, address);

            if (result != null) {
                session.removeAttribute("cart");
                request.getRequestDispatcher("purchase-out.jsp")
                       .forward(request, response);
            } else {
                request.getRequestDispatcher("purchase-error.jsp")
                       .forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("purchase-error.jsp")
                   .forward(request, response);
        }
    }
}