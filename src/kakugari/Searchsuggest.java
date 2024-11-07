package kakugari;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.Item;
import dao.ItemDAO;

@WebServlet("/searchSuggestServlet")
public class Searchsuggest extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String query = request.getParameter("query");

        // サーバー側でクエリの文字エンコーディングを設定
        request.setCharacterEncoding("UTF-8");  // クエリ文字列の文字コードをUTF-8に設定
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {

        	ItemDAO dao=new ItemDAO();
			List<Item> suggestions =dao.suggest(query);

			String json = new Gson().toJson(suggestions);
            response.getWriter().write(json);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}


    }

}
