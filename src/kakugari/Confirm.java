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

import bean.Credit;
import bean.Images;
import bean.Item;
import bean.User;
import dao.CreditDAO;
import dao.ImageDAO;
import dao.ItemDAO;
import tool.Page;

@WebServlet(urlPatterns={"/confirm"})
public class Confirm extends HttpServlet {


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
		        User user = (User) session.getAttribute("customer");
		        String user_id = user.getUser_id();
		        System.out.println(user_id);

				String keyword = request.getParameter("item_id");


				System.out.println(keyword);
				System.out.println("で");

				ItemDAO dao=new ItemDAO();
				List<Item> list=dao.confirm(keyword);

				CreditDAO dao1=new CreditDAO();
				List<Credit> list1=dao1.getCred(user_id);



				System.out.println(list);
				System.out.println(list1);
				System.out.println("asvga");

				String list2 = "adsfaf";

				request.setAttribute("crad", list1);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/main_kakugari/purchase-in.jsp")
				.forward(request, response);

			}catch (Exception e){
				e.printStackTrace(out);

				HttpSession session = request.getSession();
		        session.setAttribute("alertMessage", "エラーが発生しました。ログインをしているか確認してから再度購入ボタンを押してください。");

				String referer = request.getHeader("Referer");
		        if (referer != null) {
		            response.sendRedirect(referer);
		        } else {
		        	try {
		            // Referer ヘッダーがない場合のデフォルト処理
		        	ImageDAO dao=new ImageDAO();
					List<Images> list;

						list = dao.all();


					System.out.print(list);

					request.setAttribute("all", list);
					request.getRequestDispatcher("../main_kakugari/kakugarilist.jsp")
					.forward(request, response);
		        	} catch (Exception e1) {
						// TODO 自動生成された catch ブロック
						e1.printStackTrace();
					}
		        }

			}

			Page.footer(out);
		}
}
