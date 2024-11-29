package kakugari;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import bean.Credit;
import bean.User;
import dao.CreditDAO;

@WebServlet("/kakugari/credit_register")
public class CreditRegisterAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String securityCode = request.getParameter("security_code");

        // カード番号をマスクして出力 (最初の12桁をマスク)
        String maskedCardNumber = cardNumber.replaceAll("^.{12}", "**** **** ****");
        System.out.println("登録データ: " + maskedCardNumber + ", " + expiryDate + ", " + securityCode);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("customer");

        // セッションチェック
        if (user == null) {
            response.sendRedirect("../main_kakugari/login.jsp");
            return;
        }

        String user_id = user.getUser_id();

        // クレジット情報をセット
        Credit credit = new Credit();
        credit.setCreditNumber(cardNumber);
        credit.setExpiryDate(expiryDate);
        credit.setSecurityCode(securityCode);
        credit.setUserId(user_id);

        try {
            CreditDAO dao = new CreditDAO();
            int result = dao.insertCredit(credit);

            System.out.print(result);

            String list = "登録完了しました。";

            System.out.print(list);

            String json = new Gson().toJson(list);
            response.getWriter().write(json);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("../main_kakugari/credit-error.jsp");
        }
    }
}
