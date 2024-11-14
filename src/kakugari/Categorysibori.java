package kakugari;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.Item;
import dao.ItemDAO;

@WebServlet(urlPatterns={"/kakugari/categorysibori"})
public class Categorysibori extends HttpServlet {


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

				String keyword = request.getParameter("keyword");
				String category = request.getParameter("value");
				String hanbai = request.getParameter("");
				String urikire = request.getParameter("");
				String sinpin = request.getParameter("");
				String yogore = request.getParameter("");
				String gatiyogore = request.getParameter("");

				String pricemin = request.getParameter("");
				String pricemax = request.getParameter("");


				System.out.print("ぺぺ２");
				System.out.print(category);

				ItemDAO dao=new ItemDAO();
				List<Item> list=dao.categorysibori(keyword, category, hanbai, urikire, sinpin, yogore, gatiyogore, pricemin, pricemax);

				System.out.print(list);

				String json = new Gson().toJson(list);
	            response.getWriter().write(json);
			}catch (Exception e) {
	            e.printStackTrace(response.getWriter());
	        }
		}
}