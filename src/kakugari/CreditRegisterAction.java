package kakugari;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Credit;
import dao.CreditDAO;

@WebServlet("/kakugari/cregit_register")
public class CreditRegisterAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // クレジットカード情報の取得
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String security_code = request.getParameter("security_code");

	    System.out.println("登録データ: " + cardNumber + ", " + expiryDate + ", " + security_code);


        Credit credit = new Credit();
        credit.setCreditNumber(cardNumber);
        credit.setExpiryDate(expiryDate);
        credit.setSecurityCode(security_code);

        try {
            CreditDAO dao = new CreditDAO();
            int result = dao.insertCredit(credit);

            if (result > 0) {
                response.sendRedirect("../main_kakugari/cregit-success.jsp");
            } else {
                response.sendRedirect("../main_kakugari/credit-error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/main_kakugari/credit-error2.jsp");
        }
    }
}
