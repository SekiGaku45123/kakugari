package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.History;

public class HistoryDAO extends DAO {

    // 指定したユーザーの購入履歴を取得
    public List<History> getHistory(String user_id) throws Exception {
        List<History> historyList = new ArrayList<>();
        Connection con = getConnection();
        String sql = "SELECT ITEM_ID, FLAG, IMAGE_DATA, PURCHASE_DATE FROM HISTORY WHERE USER_ID = ?";

        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, user_id);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            History history = new History();
            history.setItem_Id(rs.getInt("ITEM_ID"));
            history.setFlag(rs.getBoolean("FLAG"));
            history.setImage_Data(rs.getString("IMAGE_DATA"));
            history.setPurchase_Date(rs.getTimestamp("PURCHASE_DATE")); // 購入日時をセット
            historyList.add(history);
        }

        rs.close();
        st.close();
        con.close();

        return historyList;
    }

    // 購入情報の挿入
    public int insert(History history) throws Exception {
        Connection con = getConnection();
        String sql = "INSERT INTO HISTORY (USER_ID, ITEM_ID, FLAG, IMAGE_DATA, PURCHASE_DATE) VALUES (?, ?, ?, ?, ?)";

        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, history.getUser_Id());
        st.setInt(2, history.getItem_Id());
        st.setBoolean(3, history.isFlag());
        st.setString(4, history.getImage_Data());
        st.setTimestamp(5, history.getPurchase_Date());

        int result = st.executeUpdate();

        st.close();
        con.close();
        return result;
    }
    public void deleteHistory(String itemId) throws Exception {
        Connection con = getConnection();
        String sql = "DELETE FROM HISTORY WHERE ITEM_ID = ?";

        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, itemId);
        st.executeUpdate();

        st.close();


        String sql1 = "DELETE FROM transaction WHERE ITEM_ID = ?";
        PreparedStatement st1 = con.prepareStatement(sql1);
        st1.setString(1, itemId);
        st1.executeUpdate();

        st1.close();

        String sql2 = "update item set flag = true where item_id = ?";
        PreparedStatement st2 = con.prepareStatement(sql2);
        st2.setString(1, itemId);
        st2.executeUpdate();

        st2.close();


        con.close();
    }



}
