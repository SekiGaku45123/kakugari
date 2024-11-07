package favorite;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Favorite;
import bean.User;
import dao.FavoriteDAO;
@WebServlet(urlPatterns={"/kakugari/favoriteremove"})
public class FavoriteRemova extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.print("実行");
    	PrintWriter out=response.getWriter();
    	HttpSession session = request.getSession();

        try {

        	String item_id=request.getParameter("id");
        	User customer = (User) session.getAttribute("customer");

        	// Userクラス内にuser_idフィールドがあると仮定
        	String user_id = customer.getUser_id();

        	Favorite p=new Favorite();
        	p.setItem_id(item_id);
        	p.setUser_id(user_id);

        	FavoriteDAO dao=new FavoriteDAO();
        	int line=dao.delete(p);

        	if (line>0) {
        		System.out.print("完成");

        		response.sendRedirect("../kakugari/favoritesearch");

        	}



        } catch (Exception e) {
        	e.printStackTrace(out);

        }
    }



}