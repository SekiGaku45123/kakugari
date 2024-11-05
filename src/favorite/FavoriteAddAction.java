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
@WebServlet(urlPatterns={"/kakugari/favoriteAddAction"})
public class FavoriteAddAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.print("実行");
    	PrintWriter out=response.getWriter();
    	HttpSession session = request.getSession();

        try {

        	String item_id=request.getParameter("item_id");
        	User customer = (User) session.getAttribute("customer");

        	// Userクラス内にuser_idフィールドがあると仮定
        	String user_id = customer.getUser_id();

        	Favorite p=new Favorite();
        	p.setItem_id(item_id);
        	p.setUser_id(user_id);

        	FavoriteDAO dao=new FavoriteDAO();
        	int line=dao.insert(p);

        	if(line == 001){
        		System.out.print("すでに登録されてるって！！厳しいって！！");
        		response.sendRedirect("../kakugari/product?item_id=" + URLEncoder.encode(item_id, "UTF-8"));
        	}

        	if (line>0) {
        		System.out.print("完成");

        		response.sendRedirect("../kakugari/product?item_id=" + URLEncoder.encode(item_id, "UTF-8"));

        	}



        } catch (Exception e) {
        	e.printStackTrace(out);

        }
    }



}
