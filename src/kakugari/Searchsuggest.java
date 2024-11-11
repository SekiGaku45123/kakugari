package kakugari;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.Item;
import dao.ItemDAO;

@WebServlet(urlPatterns = "/searchSuggestServlet", asyncSupported = true)
public class Searchsuggest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 非同期コンテキストの開始
        AsyncContext asyncContext = request.startAsync();

        // 非同期タスクの実行
        asyncContext.start(() -> {
            String query = request.getParameter("keyword");

            try {
                // DAOを使ってサジェスト候補を取得
                ItemDAO dao = new ItemDAO();
                List<Item> suggestions = dao.suggest(query);

                // 結果をJSONに変換してレスポンスに書き込み
                String json = new Gson().toJson(suggestions);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);

                // 非同期処理の完了を通知
                asyncContext.complete();

            } catch (SQLException e) {
                e.printStackTrace();
                asyncContext.complete();
            } catch (Exception e) {
                e.printStackTrace();
                asyncContext.complete();
            }
        });
    }
}
