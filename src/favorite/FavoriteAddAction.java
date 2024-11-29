package favorite;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Favorite;
import bean.User;
import dao.FavoriteDAO;

@WebServlet(urlPatterns = { "/kakugari/favoriteAddAction" })
public class FavoriteAddAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("実行");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
            // セッションからログイン情報を取得
            User customer = (User) session.getAttribute("customer");

            // ユーザーがログインしていない場合
            if (customer == null) {
                System.out.println("ログインしていません");
                response.sendRedirect("../login_logout/login-in.jsp"); // エラーページにリダイレクト
                return; // ここで処理を終了
            }

            // ログインしている場合
            String item_id = request.getParameter("item_id");
            String user_id = customer.getUser_id(); // ユーザーIDを取得

            // Favoriteオブジェクトに値を設定
            Favorite favorite = new Favorite();
            favorite.setItem_id(item_id);
            favorite.setUser_id(user_id);

            // DAOを使用してお気に入りに追加
            FavoriteDAO dao = new FavoriteDAO();
            int line = dao.insert(favorite);

            if (line == 0) {
                // すでに登録されている場合
                System.out.println("すでに登録されているアイテムです");
                response.sendRedirect("../kakugari/product?item_id=" + URLEncoder.encode(item_id, "UTF-8"));
            } else if (line > 0) {
                // 正常に登録できた場合
                System.out.println("お気に入りに登録完了");
                response.sendRedirect("../kakugari/product?item_id=" + URLEncoder.encode(item_id, "UTF-8"));
            } else {
                // その他エラーの場合
                System.out.println("お気に入りの登録に失敗しました");
                response.sendRedirect("../error.jsp"); // エラーページにリダイレクト
            }
        } catch (Exception e) {
            e.printStackTrace(out);
            // 例外が発生した場合はエラーページへ
            response.sendRedirect("../error.jsp");
        }
    }
}
