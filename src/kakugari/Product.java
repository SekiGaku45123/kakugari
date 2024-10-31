package kakugari;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Item;
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

			String item_id = request.getParameter("item_id");

			System.out.print(item_id);
			System.out.print("kasnfja");

			Page.header(out);
			try{

				ItemDAO dao=new ItemDAO();
				List<Item> list=dao.buy(item_id);

				System.out.print(list);

				request.setAttribute("pro", list);
				request.getRequestDispatcher("/main_kakugari/syousai.jsp")
				.forward(request, response);
			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}