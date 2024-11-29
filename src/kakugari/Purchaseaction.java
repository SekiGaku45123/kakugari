package kakugari;


import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.History;
import bean.Item;
import bean.Transaction;
import bean.User;
import dao.BuysearchDAO;
import dao.ItemDAO;
import dao.TransactionDAO;

@WebServlet(urlPatterns={"/main_kakugari/Purchaseaction"})
public class Purchaseaction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // セッションからユーザー情報を取得
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("customer");

        // ユーザーがログインしていない場合、エラーページにリダイレクト
        if (user == null) {
            request.getRequestDispatcher("purchase-error-login.jsp").forward(request, response);
            return;
        }

        // ユーザー情報とリクエストパラメータを取得
        String name = user.getUser_name();
        String address = user.getUser_address();
        String user_id = user.getUser_id();

        // 購入情報をリクエストから取得
        String itemIdStr = request.getParameter("item_id");
        String user_id_id = request.getParameter("user_id_id");
        System.out.print(itemIdStr);
        int item_id = Integer.parseInt(itemIdStr.trim());
        System.out.print(item_id);
        String flag = request.getParameter("flag");
        boolean isAttend = Boolean.parseBoolean(flag);
        String image_data = request.getParameter("image_data");

        if (!image_data.startsWith("..")) {
        	image_data = ".." + image_data; // 先頭に「..」を追加
        }

        // 購入日時を現在のタイムスタンプで取得
        Timestamp purchase_Date = new Timestamp(System.currentTimeMillis());


        // 名前と住所が入力されていない場合、エラーページに遷移
        if (name == null || name.isEmpty() || address == null || address.isEmpty()) {
            request.getRequestDispatcher("purchase-error-empty.jsp").forward(request, response);
            return;
        }

        try {
            // 購入情報をセット
            History purchase = new History();
            purchase.setUser_Id(user_id);
            purchase.setItem_Id(item_id);
            purchase.setFlag(isAttend);
            purchase.setImage_Data(image_data);
            purchase.setPurchase_Date(purchase_Date); // 購入日時をセット

            // DAOを使用して購入情報を挿入
            BuysearchDAO dao = new BuysearchDAO();
            int result = dao.insert(purchase);

            // 挿入が成功した場合、購入完了ページへ遷移
            if (result > 0) {

            	String s_item_id = String.valueOf(item_id);

            	Item item = new Item();
            	item.setItem_id(s_item_id);

            	ItemDAO dao1 = new ItemDAO();
            	int line = dao1.updateinsert(item);

            	String item_id_id = String.valueOf(item_id);

            	Transaction transaction = new Transaction();
            	transaction.setItem_id(item_id_id);
            	transaction.setPurchaser(user_id);
            	transaction.setExhibit_user(user_id_id);

            	
            	
            	TransactionDAO dao2 = new TransactionDAO();
            	int line_second = dao2.insert(transaction);

            	System.out.print(line_second);

            	System.out.print(line);

                System.out.println("購入処理が完了しました。");
                session.removeAttribute("cart");
                request.getRequestDispatcher("purchase-out.jsp").forward(request, response);
            } else {
                // データ挿入が失敗した場合の処理
                request.getRequestDispatcher("purchase-error-insert.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("purchase-error-insert.jsp").forward(request, response);
        }
    }

}
