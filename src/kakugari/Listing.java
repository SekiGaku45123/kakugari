package kakugari;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Images;
import bean.Item;
import bean.User;
import dao.ImageDAO;
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


		        String user_id = user.getUser_id();
		        String photo = request.getParameter("photo");
	        	String photo1 = request.getParameter("photo1");
	        	String photo2 = request.getParameter("photo2");

	        	String item_name = request.getParameter("item_name");

	        	String scales = request.getParameter("scales");
	        	String scales1 = request.getParameter("scales1");
	        	String goods_deta = request.getParameter("goods_deta");
	        	String region = request.getParameter("region");
	        	int shopping_days = Integer.parseInt(request.getParameter("shopping_days"));
	        	int item_price =  Integer.parseInt(request.getParameter("item_price"));

				ItemDAO dao=new ItemDAO();

				photo = "../images/"+photo;
				photo1 = "../images/"+photo1;
				photo2 = "../images/"+photo2;

				System.out.print(photo);
				System.out.print(photo1);
				System.out.print(photo2);

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

				ImageDAO dao1=new ImageDAO();

				Images q =new Images();
				q.setItem_id(maxItemId1);
				q.setImage_data(photo);
				q.setImage_data1(photo1);
				q.setImage_data2(photo2);
				q.setUser_id(user_id);

				int list = dao1.imageinsert(q);

				System.out.print(line);

				if (line>0){

					request.getRequestDispatcher("/main_kakugari/all")
					.forward(request, response);
				}



			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}

