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

@WebServlet(urlPatterns={"/kakugari/productsearch"})
public class Productsearch extends HttpServlet {


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

				String keyword = request.getParameter("keyword");
				String category = request.getParameter("category");



				System.out.print("ぺぺ２");
				System.out.print(keyword);
				System.out.print("ka45");
				System.out.print(category);
				System.out.print("ぺぺ45");

				ItemDAO dao=new ItemDAO();
				List<Item> list=dao.search(keyword, category);

				ItemDAO dao1=new ItemDAO();
				List<Item> list1=dao1.categoryall();

				System.out.print(list);
				if (list == null || list.isEmpty()){

					request.setAttribute("erro", "該当する商品が見つかりません。");
				request.setAttribute("search", list);
				request.setAttribute("categoryy", keyword);
				request.setAttribute("searchtin", category);
				request.setAttribute("searchcategory", list1);
				request.getRequestDispatcher("../main_kakugari/searchkakugari.jsp")
				.forward(request, response);
				}else{

					request.setAttribute("search", list);
					request.setAttribute("categoryy", keyword);
					request.setAttribute("searchtin", category);
					request.setAttribute("searchcategory", list1);
					request.getRequestDispatcher("../main_kakugari/searchkakugari.jsp")
					.forward(request, response);
				}
			}catch (Exception e){
				e.printStackTrace(out);
			}

			Page.footer(out);
		}
}
