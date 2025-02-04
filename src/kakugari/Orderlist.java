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

import bean.Receiving;
import bean.Transaction;
import bean.User;
import dao.JudgeDAO;
import dao.TransactionDAO;
import judge.Judge;

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

		        JudgeDAO dao1=new JudgeDAO();
		        List<Judge> list4 = dao1.flag_sea(user_id);

		        JudgeDAO dao2=new JudgeDAO();
		        List<Receiving> list5 = dao2.flag_sea1(user_id);

		        TransactionDAO dao=new TransactionDAO();
				List<Transaction> list=dao.search(user_id);

				List<Transaction> list2=dao.search_tuti(user_id);

				List<Transaction> list3=dao.search_purchaser_tuti(user_id);

				List<Transaction> list6=dao.search_message(user_id);

				List<Transaction> list7=dao.search_mess(user_id);

				List<Transaction> list8=dao.search_mess1(user_id);

				System.out.println("dijhgfggih");
				System.out.println(list);

				Map<String, Object> data = new HashMap<>();
				data.put("response", list); // Listデータ
				data.put("list", list2);
				data.put("list2", list3);
				data.put("list3", list4);
				data.put("list_co", list5);
				data.put("list_mess", list6);
				data.put("pur_mess", list7);
				data.put("ex_mess", list8);

				String json = new Gson().toJson(data);
                response.getWriter().write(json);
		} catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
	}
}
