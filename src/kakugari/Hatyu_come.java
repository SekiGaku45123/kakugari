package kakugari;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.TransactionDAO;
import tool.Page;

@WebServlet(urlPatterns={"/kakugari/Hatyu_come"})
public class Hatyu_come extends HttpServlet{
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

		        String story = request.getParameter("id");
		        String item = request.getParameter("item_id");

		        TransactionDAO dao=new TransactionDAO();
				int line=dao.updateinsert_come(story,user_id,item);

				if (line>0) {
					System.out.print("やっている？");
				}

			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);



		}

}
