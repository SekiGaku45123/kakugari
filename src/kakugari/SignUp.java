package kakugari;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;
import dao.SignUpDAO;

@WebServlet("/main_kakugari/signup")
public class SignUp extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String name = request.getParameter("name");
	    String hurigana = request.getParameter("hurigana");
	    String address = request.getParameter("address");
	    String password = request.getParameter("password");
	    String maleAddress = request.getParameter("maleaddress");
	    String telephone = request.getParameter("telephone");

	    System.out.println("登録データ: " + name + ", " + hurigana + ", " + address + ", " + password + ", " + maleAddress);
	    System.out.print(telephone);

	    User user = new User();
	    user.setUser_name(name);
	    user.setUser_hurigana(hurigana);
	    user.setUser_address(address);
	    user.setpassword(password);
	    user.setMaleaddress(maleAddress);
	    user.setTelephone(telephone);

	    try {
	        SignUpDAO dao = new SignUpDAO();
	        int result = dao.insertUser(user);

	        if (result > 0) {
	            request.getRequestDispatcher("signup-success.jsp").forward(request, response);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.getRequestDispatcher("signup-failed.jsp").forward(request, response);
	    }
	}
}

