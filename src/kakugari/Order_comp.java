package kakugari;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Receiving;
import bean.User;
import dao.TransactionDAO;
import tool.Page;


@WebServlet(urlPatterns={"/kakugari/order_comp"})
public class Order_comp extends HttpServlet {

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


				String item_id = request.getParameter("item_id");

		        String exhibit_user = request.getParameter("exhibit_user");

				System.out.print(item_id);

				TransactionDAO dao=new TransactionDAO();
				int line=dao.updateinsert(item_id);

				Receiving receiving = new Receiving();
				receiving.setItem_id(item_id);
				receiving.setUser_id(user_id);
				receiving.setExhibit_user(exhibit_user);

				int line2=dao.insert_tuti(receiving);

				System.out.print(line2);

				if (line>0) {
					System.out.print("やっている？");
					request.getRequestDispatcher("../main_kakugari/order_comp.jsp")
					.forward(request, response);
				}
			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}
