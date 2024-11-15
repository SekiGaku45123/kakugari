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
				String hanbai = request.getParameter("hanbai");
				boolean han_bai = Boolean.parseBoolean(hanbai);

				String urikire = request.getParameter("urikire");
				boolean uri_kire = Boolean.parseBoolean(urikire);

				String sinpin = request.getParameter("isNew");
				boolean sin_pin = Boolean.parseBoolean(sinpin);

				String yogore = request.getParameter("noDamage");
				boolean yogo_re = Boolean.parseBoolean(yogore);

				String gatiyogore = request.getParameter("poorCondition");
				boolean gati_yogore = Boolean.parseBoolean(gatiyogore);

				String item1 = request.getParameter("item1");

				String pricemin = request.getParameter("priceMin");
				String pricemax = request.getParameter("priceMax");

				System.out.println("データ");
				System.out.println(keyword);
				System.out.println(category);
				System.out.println(han_bai);
				System.out.println(uri_kire);
				System.out.println(sin_pin);
				System.out.println(yogo_re);
				System.out.println(gati_yogore);
				System.out.println(item1);
				System.out.println(pricemin);
				System.out.println(pricemax);
				System.out.println("終了");


				System.out.print("ぺぺ２");
				System.out.print(category);

				ItemDAO dao=new ItemDAO();
				List<Item> list=dao.categorysibori(keyword, category, han_bai, uri_kire, sin_pin, yogo_re, gati_yogore, pricemin, pricemax);

				System.out.print(list);

				String json = new Gson().toJson(list);
	            response.getWriter().write(json);
			}catch (Exception e) {
	            e.printStackTrace(response.getWriter());
	        }
		}
}