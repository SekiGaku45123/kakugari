package kakugari;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddressSearchServlet")
public class AddressSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        String zipcode = request.getParameter("zipcode");
        if (zipcode == null || zipcode.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\":\"郵便番号が入力されていません\"}");
            return;
        }

        // APIリクエスト
        System.out.print("実行");
        String apiUrl = "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + zipcode;
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");

        int responseCode = conn.getResponseCode();
        if (responseCode == 200) {
            // APIレスポンスを取得
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder result = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) {
                result.append(line);
            }
            in.close();

            // クライアントに結果を返す
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            System.out.println(result);
            response.getWriter().write(result.toString());

        } else {
            // エラー処理
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"住所を取得できませんでした\"}");
        }
        conn.disconnect();
    }
}