package history;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.History;
import bean.User;
import dao.BuysearchDAO;


@WebServlet("/history") // アクセスするURLパターンを設定
public class HistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	HttpSession session = request.getSession();
    	User user = (User) session.getAttribute("customer");

    	String user_id = user.getUser_id();

        try {
            // HistoryDAOのインスタンスを生成し、履歴リストを取得
            BuysearchDAO dao = new BuysearchDAO();
            List<History> historyList = dao.getHistoryByUserId(user_id);

            // リクエスト属性に履歴リストを設定
            request.setAttribute("historyList", historyList);

            // JSPページにフォワード
            request.getRequestDispatcher("/main_kakugari/rireki.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "履歴データの取得中にエラーが発生しました。");
        }
    }
}

