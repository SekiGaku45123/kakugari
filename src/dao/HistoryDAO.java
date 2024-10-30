package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.History;

public class HistoryDAO extends DAO {

    public List<History> getHistory() throws Exception {
        List<History> historyList = new ArrayList<>();
        Connection con = getConnection();
        String sql = "SELECT ITEM_ID, FLAG, IMAGE_DATA FROM HISTORY";  // IMAGE_PATHを取得

        PreparedStatement st = con.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            History history = new History();
            history.setItem_Id(rs.getInt("ITEM_ID"));
            history.setFlag(rs.getBoolean("FLAG"));
            history.setImageData(rs.getString("IMAGE_DATA"));  // 画像パスをセット
            historyList.add(history);
        }

        rs.close();
        st.close();
        con.close();

        return historyList;
    }
}

