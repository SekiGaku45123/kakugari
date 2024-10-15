package Contact;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/contact/contact"})
public class Contact extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       // フォームからのデータを取得

		request.setCharacterEncoding("UTF-8");
	       String name = request.getParameter("name");
	       String email = request.getParameter("email");
	       String message = request.getParameter("message");
	       // データを確認するためにサーバー側で表示
	       System.out.println("Name: " + name);
	       System.out.println("Email: " + email);
	       System.out.println("Message: " + message);
	       // JSPにデータを渡す
	       request.setAttribute("name", name);
	       request.setAttribute("email", email);
	       request.setAttribute("message", message);

	       request.getRequestDispatcher("form.jsp")
	       .forward(request, response);
	}
}