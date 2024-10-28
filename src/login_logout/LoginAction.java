package login_logout;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.CustomerDAO;

@WebServlet("/login_logout/Login.action") // URLパターンのマッピング
public class LoginAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String maleaddress = request.getParameter("maleaddress");
        String password = request.getParameter("password");

        CustomerDAO dao = new CustomerDAO();
        User user = null;
		try {
			user = dao.search(maleaddress, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

        if (user != null) {
            session.setAttribute("customer", user);
            request.getRequestDispatcher("../main_kakugari/all").forward(request, response); // ログイン成功時
        } else {
            request.getRequestDispatcher("login-error.jsp").forward(request, response); // ログイン失敗時
        }
    }
}
