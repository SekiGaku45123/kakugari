package login_logout;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;

public class LogoutAction extends Action {
    public void execute(
            HttpServletRequest request, HttpServletResponse response
        ) throws Exception {

        HttpSession session = request.getSession();

        // セッションからcustomer情報を削除
        if (session.getAttribute("customer") != null) {
            session.removeAttribute("customer");
        }

        // ログアウト後に遷移するページ（ログアウト完了画面）
        request.getRequestDispatcher("logout-out.jsp").forward(request, response);
    }
}
