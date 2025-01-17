package judge;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import dao.JudgeDAO;
@WebServlet("/JudgeServlet")
public class JudgeServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession session = request.getSession();
       User user = (User) session.getAttribute("customer");

       String userId = user.getUser_id();
       if (userId == null) {
    	   System.out.print(1);
           response.sendRedirect("judge/error.jsp");
       } else {
           request.setAttribute("userId", userId);
           request.getRequestDispatcher("judge/judge.jsp").forward(request, response);
       }
   }
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession session = request.getSession();
       //String userId = (String) session.getAttribute("333");
       User user = (User) session.getAttribute("customer");

       String userId = user.getUser_id();
       if (userId == null) {
    	   System.out.print(2);
           response.sendRedirect("judge/error.jsp");
           return;
       }
       //String itemId = request.getParameter("1154");
       String comment = request.getParameter("comment");
       String itemId = request.getParameter("item_id");
       System.out.print(comment);
       String evaluate_kai = request.getParameter("evaluate");
       boolean evaluate;
       if (evaluate_kai.equals("true")){
    	   evaluate = true;
       }else {
    	   evaluate = false;
       }
       try {
           if (itemId == null || itemId.isEmpty() || comment == null || comment.isEmpty()) {
        	   System.out.print(3);
               response.sendRedirect("judge/error.jsp");
           }
           System.out.print("ここは？");
           Judge judge = new Judge();
           judge.setItemId(itemId);
           judge.setUserId(userId);
           judge.setComment(comment);
           judge.setEvaluate(evaluate);
           JudgeDAO dao = new JudgeDAO();
           int line = dao.saveJudge(judge);
           if(line>0){
           response.sendRedirect("judge/thankyou.jsp");
           }
       } catch (Exception e) {
           e.printStackTrace();
           System.out.print(4);
           response.sendRedirect("judge/error.jsp");
       }
   }
}