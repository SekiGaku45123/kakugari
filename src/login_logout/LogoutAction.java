package login_logout;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/login_logout/logout" })
public class LogoutAction extends HttpServlet {

    public void doGet(
            HttpServletRequest request, HttpServletResponse response
    ) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        try {
            HttpSession session = request.getSession();

            // ユーザーがログインしていない場合、ログイン画面へリダイレクト
            if (session.getAttribute("customer") == null) {
                request.getRequestDispatcher("/login_logout/login-in.jsp")
                        .forward(request, response);
                return;
            }

            // セッションからcustomer情報を削除
            if (session.getAttribute("customer") != null) {
                session.removeAttribute("customer");
                session.removeAttribute("browse");
            }

            // ログアウト完了画面にリダイレクト
            request.getRequestDispatcher("/login_logout/logout-complete.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
