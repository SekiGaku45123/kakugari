package Rireki;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 商品クラス
class Product {
    private String name;
    private boolean isCompleted;

    public Product(String name, boolean isCompleted) {
        this.name = name;
        this.isCompleted = isCompleted;
    }

    public String getName() {
        return name;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    @Override
    public String toString() {
        return name + " - " + (isCompleted ? "取引完了" : "取引中");
    }
}

// 通知クラス
class Notification {
    private String message;

    public Notification(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    @Override
    public String toString() {
        return "通知: " + message;
    }
}

@WebServlet("/Rireki")
public class Rireki extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC接続設定
    private final String JDBC_URL = "jdbc:h2:~/merukari";
    private final String JDBC_USER = "sa"; // MySQLのユーザー名
    private final String JDBC_PASSWORD = ""; // MySQLのパスワード

    // データベース接続メソッド
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String productName = request.getParameter("productName");

        try (Connection connection = getConnection()) {
            if ("purchase".equals(action) && productName != null && !productName.isEmpty()) {
                // 商品をデータベースに追加
                String insertProductSQL = "INSERT INTO products (name) VALUES (?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertProductSQL)) {
                    pstmt.setString(1, productName);
                    pstmt.executeUpdate();
                }

                // 通知をデータベースに追加
                String insertNotificationSQL = "INSERT INTO notifications (message) VALUES (?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertNotificationSQL)) {
                    pstmt.setString(1, productName + " を購入しました。");
                    pstmt.executeUpdate();
                }
            } else if ("complete".equals(action) && productName != null) {
                // 商品の取引を完了に更新
                String updateProductSQL = "UPDATE products SET is_completed = TRUE WHERE name = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateProductSQL)) {
                    pstmt.setString(1, productName);
                    pstmt.executeUpdate();
                }

                // 通知をデータベースに追加
                String insertNotificationSQL = "INSERT INTO notifications (message) VALUES (?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertNotificationSQL)) {
                    pstmt.setString(1, productName + " の取引が完了しました。");
                    pstmt.executeUpdate();
                }
            }

            // 購入履歴と通知を取得してJSPに渡す
            List<Product> purchaseHistory = new ArrayList<>();
            List<Notification> notifications = new ArrayList<>();

            // 商品履歴を取得
            String selectProductsSQL = "SELECT name, is_completed FROM products";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(selectProductsSQL)) {
                while (rs.next()) {
                    purchaseHistory.add(new Product(rs.getString("name"), rs.getBoolean("is_completed")));
                }
            }

            // 通知を取得
            String selectNotificationsSQL = "SELECT message FROM notifications";
            try (Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(selectNotificationsSQL)) {
                while (rs.next()) {
                    notifications.add(new Notification(rs.getString("message")));
                }
            }

            // JSPにデータを渡す
            request.setAttribute("purchaseHistory", purchaseHistory);
            request.setAttribute("notifications", notifications);

            // JSPにフォワード
            request.getRequestDispatcher("rireki.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // POST処理と同じ動作
        doPost(request, response);
    }
}
