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
@WebServlet(urlPatterns={"/kakugari/favoritesearch"})
public class Favoritesearch extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.println("実行");
    	PrintWriter out=response.getWriter();
    	HttpSession session = request.getSession();

        try {

        	User customer = (User) session.getAttribute("customer");

        	// Userクラス内にuser_idフィールドがあると仮定
        	String key = customer.getUser_id();

        	System.out.println(key);

        	FavoriteDAO dao=new FavoriteDAO();
        	List<Favorite> list=dao.search(key);

        	System.out.print(list);

        	request.setAttribute("favoriteItems", list);
			request.getRequestDispatcher("../main_kakugari/favorite.jsp")
			.forward(request, response);

        } catch (Exception e) {
        	e.printStackTrace(out);

        }
    }



}