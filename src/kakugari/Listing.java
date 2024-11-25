package kakugari;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Item;
import bean.User;
import dao.ItemDAO;
import tool.Page;

@WebServlet(urlPatterns={"/kakugari/listing"})
public class Listing extends HttpServlet {


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
			Page.header(out);

			try{

				HttpSession session = request.getSession();

		        User user = (User) session.getAttribute("customer");


		        //String user_id = user.getUser_id();
		        String user_id = "7";
		        String photo = request.getParameter("photo");
	        	String photo1 = request.getParameter("photo3");
	        	String photo2 = request.getParameter("photo2");

	        	String item_name = request.getParameter("item_name");

	        	String scales = request.getParameter("scales");
	        	String scales1 = request.getParameter("scales1");
	        	String goods_deta = request.getParameter("goods_deta");
	        	String region = request.getParameter("region");
	        	int shopping_days = Integer.parseInt(request.getParameter("shopping_days"));
	        	int item_price =  Integer.parseInt(request.getParameter("item_price"));

				ItemDAO dao=new ItemDAO();

				System.out.print(item_price);

	        	int maxItemId = dao.getMaxItemId();
	        	maxItemId += 1;
	        	String maxItemId1 = String.valueOf(maxItemId);

	        	Item p =new Item();
	        	p.setItem_id(maxItemId1);
	        	p.setUser_id(user_id);
	        	p.setItem_price(item_price);
	        	p.setCategory(scales);
	        	p.setItem_detail(goods_deta);
	        	p.setCondition(scales1);
	        	p.setArea(region);
	        	p.setShipping_days(shopping_days);
	        	p.setItem_name(item_name);

				int line=dao.listinginsert(p);

				System.out.print(line);

				request.setAttribute("list", "かかかっかあ");
				request.getRequestDispatcher("../main_kakugari/kakugarilist.jsp")
				.forward(request, response);

			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}

