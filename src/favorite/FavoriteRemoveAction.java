package favorite;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Favorite;

@WebServlet(urlPatterns={"/kakugari/favoriteremove"})
public class FavoriteRemoveAction extends HttpServlet {

    @SuppressWarnings("unchecked") // 非チェックキャスト警告を無視
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // セッションを取得
        HttpSession session = request.getSession();

        // リクエストパラメータから削除対象の商品のIDを取得し、int型に変換
        String itemId = request.getParameter("id");

        System.out.print(itemId);

        // セッションから「favorite」という属性で保存されているお気に入りリストを取得し、List<Favorite>にキャスト
        List<Favorite> favoriteList = (List<Favorite>) session.getAttribute("favoriteItems");

        // お気に入りリストの中から指定されたIDの商品を探し、見つかったら削除
        for (Favorite favorite : favoriteList) {
            if (favorite.getItem_id().equals(itemId)) { // 商品IDが一致するか確認
                favoriteList.remove(favorite); // 一致した商品をリストから削除
                break; // 削除が完了したらループを抜ける
            }
        }

        request.getRequestDispatcher("../main_kakugari/favorite.jsp")
		.forward(request, response);

    }
}
