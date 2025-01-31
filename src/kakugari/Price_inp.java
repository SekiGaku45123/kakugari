package kakugari;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ItemDAO;


@WebServlet(urlPatterns={"/kakugari/Price_inp"})
public class Price_inp extends HttpServlet{
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

	        	int price = Integer.parseInt(request.getParameter("price"));


		        String item_id = request.getParameter("item");
		        System.out.print(price+item_id);
		        System.out.print("おっぺけぺぇ～");

		        ItemDAO dao=new ItemDAO();
	        	int line = dao.price_in(price,item_id);

	        	if(line>0){
	        		System.out.print("できた");
	        		String json = new Gson().toJson(line);
	                response.getWriter().write(json);
	        	}

	        }catch (Exception e){
				e.printStackTrace(response.getWriter());
			}


		}
}
