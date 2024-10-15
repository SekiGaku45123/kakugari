package kakugari ;

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

@WebServlet(urlPatterns={"/kakugari/buyserch"})
public class BuySerch extends HttpServlet {

	public void doGet (
		HttpServletRequest request, HttpServletResponse response
	) throws ServletException, IOException {
		PrintWriter out=response.getWriter();

		try {
			String code="";
			System.out.print(code);
			System.out.print("name");
			// ここから
			ItemDAO dao=new ItemDAO();
			List<Item> list=dao.buy(code);
			for (Item p : list) {
				out.println(p.getItem_id());
				out.println("：");
				out.println(p.getUser_id());
				out.println("：");
				out.println(p.getItem_price());
				out.println("：");
				out.println(p.getCategory());
				out.println("：");
				out.println(p.getItem_detail());
				out.println("：");
				out.println(p.getCondition());
				out.println("：");
				out.println(p.getArea());
				out.println("：");
				out.println(p.getShipping_days());
				out.println("：");
				out.println(p.isFlag());
				out.println("<br>");
			}

		} catch (Exception e) {
			e.printStackTrace(out);
		}

	}
}
