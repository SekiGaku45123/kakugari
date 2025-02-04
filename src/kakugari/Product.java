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

				String userId = list.get(0).getUser_id(); // 最初の要素のユーザーIDを取得
			    System.out.println("First User ID: " + userId);

			    ItemDAO dao2=new ItemDAO();
			    List<User> userid = dao2.sach_user(userId);

			    String user_namene =userid.get(0).getUser_name();
			    System.out.print(user_namene);

				if(user != null){

				String key = user.getUser_id();
	            System.out.println("ユーザーID: " + key);

	            FavoriteDAO dao1 = new FavoriteDAO();
	            List<Favorite> list1 = dao1.search(key);
	            request.setAttribute("favo", list1);
				}


				session.setAttribute("browse",browselist);
				request.setAttribute("pro", list);
				request.setAttribute("user_name2", user_namene);
				request.setAttribute("user_data", user);

				request.getRequestDispatcher("/main_kakugari/syousai.jsp")
				.forward(request, response);
			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}