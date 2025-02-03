package kakugari;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import bean.Transaction;
import bean.User;
import dao.TransactionDAO;

@WebServlet(urlPatterns={"/kakugari/Hatyu_sach"})
public class Hatyu_sach extends HttpServlet{
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
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
			try{

				HttpSession session = request.getSession();
		        User user = (User) session.getAttribute("customer");

		        String user_id = user.getUser_id();



		        String item = request.getParameter("item_id");

		        	TransactionDAO dao=new TransactionDAO();
		        	List<Transaction> list = dao.sach(user_id,item);

		        	String json = new Gson().toJson(list);
	                response.getWriter().write(json);
		        }

			catch (Exception e){
				e.printStackTrace(response.getWriter());
			}




		}

}

