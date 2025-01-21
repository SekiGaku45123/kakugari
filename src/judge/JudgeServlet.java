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

           String key = "";

           String[] keywords = {"殺す", "死ね", "暴力", "死ぬ","しね","しぬ",
       			"詐欺", "無料で稼げる",
       			"覚醒剤", "暴力団", "大麻",
       			"ヤクザ", "ヘイトスピーチ",
       			"馬鹿", "嘘つき", "アル中",
       			"うんこ", "片足", "片親", "片目",
       			"片端", "皮被り", "乞食"};

           for (String keyword : keywords) {
               if (comment.contains(keyword)) {
                   System.out.println("文字列に '" + keyword + "' が含まれています！");
                   // キーワードに応じた処理

                   key =  keyword ;
                   break; // 必要に応じてループを終了
               }
           }

           if (key != null && !key.isEmpty()){
       		System.out.print("wuibrveohagnvesrdioh");


       		String message = "NGワードが含まれています。再度見直して入力してください";
       		request.getSession().setAttribute("errorMessage", message);

       	    // 前のページへリダイレクト
       	    response.sendRedirect(request.getHeader("referer"));
			return;


       	}

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