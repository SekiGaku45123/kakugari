package history;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HistoryDAO;

@WebServlet("/deleteHistory")
public class DeleteHistoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // リクエストパラメータからitemIdを取得
            int itemId = Integer.parseInt(request.getParameter("itemId"));

            // DAOを使用して履歴を削除
            HistoryDAO dao = new HistoryDAO();
            dao.deleteHistory(itemId);

            // 削除後、履歴ページにリダイレクト
            response.sendRedirect(request.getContextPath() + "/history");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "履歴データの削除中にエラーが発生しました。");
        }
    }
}
