package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.History;



public class HistoryDAO extends DAO {

    public List<History> getHistory(String user_id) throws Exception {
        List<History> historyList = new ArrayList<>();
        Connection con = getConnection();
        String sql = "SELECT ITEM_ID, FLAG, IMAGE_DATA FROM HISTORY where user_id = ?";  // IMAGE_PATHを取得

        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1,user_id);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
        	System.out.println(rs.getBoolean("FLAG"));
            History history = new History();
            history.setItem_Id(rs.getInt("ITEM_ID"));
            history.setFlag(rs.getBoolean("FLAG"));
            history.setImage_Data(rs.getString("IMAGE_DATA"));  // 画像パスをセット
            historyList.add(history);
        }

        rs.close();
        st.close();
        con.close();

        return historyList;
    }
    public void deleteHistory(int itemId) throws Exception {
        Connection con = getConnection();
        String sql = "DELETE FROM HISTORY WHERE ITEM_ID = ?";

        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, itemId);
        st.executeUpdate();

        st.close();
        con.close();
    }

}