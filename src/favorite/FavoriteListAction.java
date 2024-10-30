package favorite;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Favorite;
import dao.FavoriteDAO;

@WebServlet(urlPatterns={"/main_kakugari/favoriteListAction"})
public class FavoriteListAction extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String item_id = request.getParameter("item_id");

            FavoriteDAO dao = new FavoriteDAO();
            List<Favorite> favoriteItems = dao.getFavoritesByUserId(user_id);

            request.setAttribute("favoriteItems", favoriteItems);
            request.getRequestDispatcher("/favoriteList.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
