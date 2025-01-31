package kakugari;

import java.io.IOException;
import java.sql.SQLException;

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
        String postnum = request.getParameter("postalCode");

        System.out.println("登録データ: " + name + ", " + hurigana + ", " + address + ", " + password + ", " + maleAddress);
        System.out.println("電話番号: " + telephone);
        System.out.println("郵便番号: " + postnum);

        User user = new User();
        user.setUser_name(name);
        user.setUser_hurigana(hurigana);
        user.setUser_address(address);
        user.setpassword(password);
        user.setMaleaddress(maleAddress);
        user.setTelephone(telephone);
        user.setPostnum(postnum);

        try {
            SignUpDAO dao = new SignUpDAO();
            int result = dao.insertUser(user);

            if (result > 0) {
                request.getRequestDispatcher("signup-success.jsp").forward(request, response);
                return;
            }

        } catch (SQLException e) { // SQLException をキャッチ
            if ("23505".equals(e.getSQLState())) { // PostgreSQLのUNIQUE制約違反エラーコード
                System.out.println("メールアドレスが既に登録されています: " + maleAddress);
                request.setAttribute("errorMessage", "メールアドレスまたは、電話番号は既に登録されています。");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            } else {
                e.printStackTrace();
            }
        } catch (Exception e) { // その他の例外をキャッチ
            e.printStackTrace();
        }

        request.getRequestDispatcher("signup-failed.jsp").forward(request, response);
    }
}
