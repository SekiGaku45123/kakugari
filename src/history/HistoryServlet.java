package history;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.History;
import dao.HistoryDAO;

@WebServlet("/history") // アクセスするURLパターンを設定
public class HistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // HistoryDAOのインスタンスを生成し、履歴リストを取得
            HistoryDAO dao = new HistoryDAO();
            List<History> historyList = dao.getHistory();

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
