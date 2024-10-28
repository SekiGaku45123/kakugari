package favorite;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns={"/main_kakugari/favorite"})
public class FavoriteAddAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String itemId = request.getParameter("itemId"); // ITEM_IDを取得
        String userid = request.getParameter("userid");
        

        response.sendRedirect("favorite.jsp"); // お気に入りページへリダイレクト
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response); // GETリクエストもPOSTに転送
    }
}
