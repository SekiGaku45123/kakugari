package kakugari;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet(urlPatterns={"/orderlist"})
public class Orderlist extends HttpServlet {


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


		        int i = Integer.parseInt(user_id);

		        System.out.println(i);

		        TransactionDAO dao=new TransactionDAO();
				List<Transaction> list=dao.search(user_id);

				List<Transaction> list2=dao.search_tuti(user_id);

				List<Transaction> list3=dao.search_purchaser_tuti(user_id);

				System.out.println("dijhgfggih");
				System.out.println(list);

				Map<String, Object> data = new HashMap<>();
				data.put("response", list); // Listデータ
				data.put("list", list2);
				data.put("list2", list3);

				String json = new Gson().toJson(data);
                response.getWriter().write(json);
		} catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
	}
}
