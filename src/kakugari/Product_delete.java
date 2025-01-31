package kakugari;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Images;
import dao.ImageDAO;
import dao.ItemDAO;


@WebServlet(urlPatterns={"/kakugari/Product_delete"})
public class Product_delete extends HttpServlet{
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


	        try{

		        String item_id = request.getParameter("itemId");
		        System.out.print(item_id);
		        System.out.print("おっぺけぺぇ～");

		        ItemDAO dao=new ItemDAO();
	        	int line = dao.product_delete(item_id);

	        	if(line>0){

	        		ImageDAO dao1=new ImageDAO();
					List<Images> list=dao1.all();

					System.out.print(list);

					request.setAttribute("all", list);
					request.getRequestDispatcher("../main_kakugari/kakugarilist.jsp")
					.forward(request, response);
	        	}


	        }catch (Exception e){
				e.printStackTrace(response.getWriter());
			}


		}
}

