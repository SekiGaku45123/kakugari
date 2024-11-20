package evaluate;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/evaluate")
public class EvaluationServlet extends HttpServlet {
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // フォームからの評価データを取得
       String evaluation = request.getParameter("evaluation");
       // パラメータ検証
       if (evaluation == null || (!evaluation.equals("Good") && !evaluation.equals("Bad"))) {
           response.sendError(HttpServletResponse.SC_BAD_REQUEST, "無効な評価です");
           return;
       }
       // 評価結果をログに記録
       System.out.println("評価: " + evaluation);
       // 感謝ページにリダイレクト
       response.sendRedirect(request.getContextPath() + "/evaluations/thankyou.jsp");
   }
}