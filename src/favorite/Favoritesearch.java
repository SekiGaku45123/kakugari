package favorite;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Favorite;
import bean.User;
import dao.FavoriteDAO;

@WebServlet(urlPatterns = { "/kakugari/favoritesearch" })
public class Favoritesearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Favoritesearch 実行");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
            // セッションからユーザー情報を取得
            User customer = (User) session.getAttribute("customer");

            // ログインしていない場合はエラーページにリダイレクト
            if (customer == null) {
                response.sendRedirect(request.getContextPath() + "/login_logout/login-in.jsp");
                return;
            }

            // ログインしている場合、ユーザーIDを取得してお気に入りを検索
            String key = customer.getUser_id();
            System.out.println("ユーザーID: " + key);

            FavoriteDAO dao = new FavoriteDAO();
            List<Favorite> list = dao.search(key);

            System.out.println("検索結果: " + list);

            // 検索結果をリクエストに設定し、JSPに転送
            request.setAttribute("favoriteItems", list);
            request.getRequestDispatcher("../main_kakugari/favorite.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(out);
            // エラーが発生した場合もエラーページにリダイレクト
            response.sendRedirect(request.getContextPath() + "/login-in.jsp");
        }
    }
}
