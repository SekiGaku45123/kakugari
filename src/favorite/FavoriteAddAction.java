package favorite;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Favorite;
import dao.FavoriteDAO;
@WebServlet(urlPatterns={"/main_kakugari/favoriteAddAction"})
public class FavoriteAddAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.print("実行");
    	PrintWriter out=response.getWriter();

        try {

        	String item_id=request.getParameter("item_id");
        	String user_id=request.getParameter("user_id");

        	Favorite p=new Favorite();
        	p.setItem_id(item_id);
        	p.setUser_id(user_id);

        	FavoriteDAO dao=new FavoriteDAO();
        	int line=dao.insert(p);

        	if (line>0) {
        	  request.getRequestDispatcher("kakugarilist.jsp");
        	}

        } catch (Exception e) {
        	e.printStackTrace(out);

        }
    }



}
