package kakugari;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Images;
import bean.Item;
import dao.ImageDAO;
import dao.ItemDAO;
import tool.Page;

@WebServlet(urlPatterns={"/main_kakugari/all", "/servlet/kakugari.All"})
public class All extends HttpServlet {


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
				List<String> browselist = (List<String>) session.getAttribute("browse");
		        if (browselist != null && !browselist.isEmpty()) {
		            ItemDAO dao1 = new ItemDAO();
		            List<Item> list1 = dao1.buy(browselist);
		            request.setAttribute("browselili", list1);
		        }



				ImageDAO dao=new ImageDAO();
				List<Images> list=dao.all();

				System.out.print(list);

				request.setAttribute("all", list);
				request.getRequestDispatcher("../main_kakugari/kakugarilist.jsp")
				.forward(request, response);

			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}
