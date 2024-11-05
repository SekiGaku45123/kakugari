package history;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HistoryDAO;

@WebServlet("/kakugari3/deleteHistory") // アクセスするURLパターンを設定
public class DeleteHistoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // リクエストパラメータからitemIdを取得
            String itemIdStr = request.getParameter("itemId");
            if (itemIdStr != null) {
                int itemId = Integer.parseInt(itemIdStr);

                // HistoryDAOを使って履歴を削除
                HistoryDAO dao = new HistoryDAO();
                dao.deleteHistory(itemId);

                // 削除後、購入履歴ページにリダイレクト
                response.sendRedirect(request.getContextPath() + "/history");
            } else {
                // itemIdが存在しない場合はエラーを返す
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "アイテムIDが指定されていません。");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "履歴データの削除中にエラーが発生しました。");
        }
    }
}
