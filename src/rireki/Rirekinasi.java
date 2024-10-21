package rireki;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rirekinasi")
public class Rirekinasi extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ここでデータベースやAPIから購入した商品のリストを取得する（今回は空のリスト）
        List<String> purchasedItems = new ArrayList<>();  // 商品がない場合

        // JSPにリストを渡す
        request.setAttribute("purchasedItems", purchasedItems);
        request.getRequestDispatcher("/rirekinasi.jsp").forward(request, response);
    }

}

