package kakugari;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Favorite;
import bean.Item;
import bean.User;
import dao.FavoriteDAO;
import dao.ItemDAO;
import tool.Page;

@WebServlet(urlPatterns={"/kakugari/product", "/servlet/kakugari.Product"})
public class Product extends HttpServlet {


	public void doGet (
	        HttpServletRequest request, HttpServletResponse response
	    ) throws ServletException, IOException {
	        processRequest(request, response);
	    }

    public void doPost (
        HttpServletRequest request, HttpServletResponse response
    ) throws ServletException, IOException {
        processRequest(request, response);
    }
		public void processRequest(
				HttpServletRequest request, HttpServletResponse response
		)
				throws ServletException, IOException {
			PrintWriter out=response.getWriter();
			HttpSession session = request.getSession();

			String item_id = request.getParameter("item_id");


			List<String> browselist = (List<String>) session.getAttribute("browse");

		    // セッションにリストが存在しない場合、新たに作成
		    if (browselist == null) {
		        browselist = new ArrayList<>();
		    }

		    if (!browselist.contains(item_id)) {
		        browselist.add(item_id); // 重複していない場合のみ追加
		    }

			System.out.print(item_id);
			System.out.print("kasnfja");

			Page.header(out);
			try{

		        User user = (User) session.getAttribute("customer");


				ItemDAO dao=new ItemDAO();
				List<Item> list=dao.buy(item_id);

				System.out.print(list);

				String key = user.getUser_id();
	            System.out.println("ユーザーID: " + key);

	            FavoriteDAO dao1 = new FavoriteDAO();
	            List<Favorite> list1 = dao1.search(key);


				session.setAttribute("browse",browselist);
				request.setAttribute("pro", list);
				request.setAttribute("user_data", user);
				request.setAttribute("favo", list1);
				request.getRequestDispatcher("/main_kakugari/syousai.jsp")
				.forward(request, response);
			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}