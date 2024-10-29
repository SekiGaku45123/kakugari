package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.History;

public class HistoryDAO {
    private static final String JDBC_URL = "jdbc:h2:~/merukari";
    private static final String JDBC_USER = "sa";
    private static final String JDBC_PASS = "";

    public List<History> getHistory() {
        List<History> historyList = new ArrayList<>();
        String sql = "SELECT ITEM_ID, COMPLETED FROM HISTORY";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int itemId = rs.getInt("ITEM_ID");
                boolean completed = rs.getBoolean("COMPLETED"); // COMPLETEDフラグを取得
                historyList.add(new History(itemId, completed));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return historyList;
    }
}
