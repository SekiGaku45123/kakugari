package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import bean.History;
import bean.Item;
import bean.User;

public class BuysearchDAO extends DAO {

    // ユーザー情報を検索
    public User search(String name, String address) throws Exception {
        User user1 = null;
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            String sql = "SELECT * FROM user1 WHERE user_name = ? AND user_address = ?";
            st = con.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            rs = st.executeQuery();

            if (rs.next()) {
                user1 = new User();
                user1.setUser_id(rs.getString("user_id"));
                user1.setMaleaddress(rs.getString("maleaddress"));
                user1.setUser_name(rs.getString("user_name"));
                user1.setUser_hurigana(rs.getString("user_hurigana"));
                user1.setUser_address(rs.getString("user_address"));
                user1.setTelephone(rs.getString("telephone"));
            }
        } finally {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (con != null) con.close();
        }
        return user1;
    }


    // 購入情報を挿入
    public int insert(History history) throws Exception {
        Connection con = null;
        PreparedStatement st = null;

        try {
            con = getConnection();
            String sql = "INSERT INTO history (USER_ID, ITEM_ID, FLAG, IMAGE_DATA, PURCHASE_DATE) VALUES (?, ?, ?, ?, ?)";
            st = con.prepareStatement(sql);
            st.setString(1, history.getUser_Id());
            st.setInt(2, history.getItem_Id());
            st.setBoolean(3, history.isFlag());
            st.setString(4, history.getImage_Data());
            st.setTimestamp(5, history.getPurchase_Date()); // 購入日時を挿入

            int line = st.executeUpdate();
            System.out.println("購入情報の登録が完了しました。");
            return line;
        } finally {
            if (st != null) st.close();
            if (con != null) con.close();
        }
    }
    public List<History> getHistoryByUserId(String userId) throws Exception {
        List<History> historyList = new ArrayList<>();
        Connection con = getConnection();

        // 購入履歴を降順で取得
        String sql = "SELECT * FROM history WHERE user_id = ? AND flag = true ORDER BY purchase_date DESC";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, userId);
        ResultSet rs = st.executeQuery();


        while (rs.next()) {
            History history = new History();
            history.setUser_Id(rs.getString("user_id"));
            history.setItem_Id(rs.getInt("item_id"));
            history.setFlag(rs.getBoolean("flag"));
            history.setImage_Data(rs.getString("image_data"));
            history.setPurchase_Date(rs.getTimestamp("purchase_date"));

            Timestamp purchaseDate = rs.getTimestamp("purchase_date");

            LocalDateTime purchaseTime = purchaseDate.toLocalDateTime();

            LocalDateTime now = LocalDateTime.now();

            Duration duration = Duration.between(purchaseTime, now);
            long minutesElapsed = duration.toMinutes();

            String cancelNot = (minutesElapsed >= 30) ? "not" : "OK";
            history.setCancel_not(cancelNot);

            System.out.println(cancelNot);
            System.out.println("取得した日時: " + history.getPurchase_Date()); // デバッグ用
            historyList.add(history);
        }

        rs.close();
        st.close();
        con.close();

        return historyList;
    }

    public List<History> client(List<Item> items) throws Exception {

        List<History> list2 = new ArrayList<>();

        Connection con = getConnection();

        String sql = "SELECT user_id, item_id FROM HISTORY WHERE item_id = ?";

        // PreparedStatementをループの外で1回だけ作成
        PreparedStatement st = con.prepareStatement(sql);

        try {
            for (Item item : items) {

            	int id = Integer.parseInt(item.getItem_id());

                st.setInt(1, id);
                ResultSet rs = st.executeQuery();

                // もし結果があれば、Historyオブジェクトを作成してリストに追加
                if (rs.next()) {
                    History history = new History();

                    history.setUser_Id(rs.getString("user_id"));
                    history.setItem_Id(rs.getInt("item_Id"));// user_idのみ設定

                    list2.add(history);
                }
                rs.close(); // ResultSetはループごとに閉じる
            }
        } finally {
            st.close(); // PreparedStatementをクローズ
            con.close(); // Connectionをクローズ
        }

        return list2;
    }



}
