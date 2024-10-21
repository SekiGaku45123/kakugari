package login_logout;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Customer;
import dao.CustomerDAO;
import tool.Action;

public class LoginAction extends Action {
    public void execute(
            HttpServletRequest request, HttpServletResponse response
        ) throws Exception {

        HttpSession session = request.getSession();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        CustomerDAO dao = new CustomerDAO();
        Customer customer = dao.search(login, password);

        if (customer != null) {
            session.setAttribute("customer", customer);
            request.getRequestDispatcher("login-out.jsp").forward(request, response); // ログイン成功時
        } else {
            request.getRequestDispatcher("login-error.jsp").forward(request, response); // ログイン失敗時
        }
    }
}
