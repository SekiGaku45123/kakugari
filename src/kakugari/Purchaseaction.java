package kakugari;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.History;
import bean.User;
import dao.BuysearchDAO;

@WebServlet(urlPatterns={"/main_kakugari/Purchaseaction"})
public class Purchaseaction extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("customer");

        String name = user != null ? user.getUser_name() : request.getParameter("name");
        String address = user != null ? user.getUser_address() : request.getParameter("address");

        int item_id = Integer.parseInt(request.getParameter("item_id"));
        String flag = request.getParameter("flag");
        boolean isAttend = Boolean.parseBoolean(flag);
        System.out.print(isAttend);
        String image_data = request.getParameter("image_data");

        String user_id = user.getUser_id();



        if (name == null || name.isEmpty() || address == null || address.isEmpty()) {
            request.getRequestDispatcher("purchase-error-empty.jsp")
                   .forward(request, response);
            return;
        }

        try {
            BuysearchDAO dao = new BuysearchDAO();
            User user1 = dao.search(name, address);

            if (user1 != null) {

            	History p=new History();
            	p.setUser_id(user_id);
            	p.setItem_Id(item_id);
            	p.setFlag(isAttend);
            	p.setImage_Data(image_data);

            	BuysearchDAO dao1 = new BuysearchDAO();

                int line = dao1.insert(p);

                if(line>0){
                	System.out.print("完成しました。");
                }

                session.removeAttribute("cart");
                request.getRequestDispatcher("purchase-out.jsp")
                       .forward(request, response);
            } else {
                request.getRequestDispatcher("purchase-error-insert.jsp")
                       .forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("purchase-error-insert.jsp")
                   .forward(request, response);
        }
    }
}