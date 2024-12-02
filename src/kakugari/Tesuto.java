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
import dao.JudgeDAO;
import tool.Page;

@WebServlet(urlPatterns={"/kakugari/tesuto"})
public class Tesuto extends HttpServlet {


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

				JudgeDAO dao=new JudgeDAO();
				int line=dao.insert(item_id,user_id);

				System.out.print(line);

				request.getRequestDispatcher("../main_kakugari/kakugarilist.jsp")
				.forward(request, response);

			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}