package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.History;
import bean.User;

public class BuysearchDAO extends DAO {

    // ユーザー情報を検索
    public User search(String name, String address) throws Exception {
        User user1 = null;


        Connection con = getConnection();

        String sql = "SELECT * FROM user WHERE user_name = ? AND user_address = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, name);
        st.setString(2, address);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            user1 = new User();
            user1.setUser_id(rs.getString("user_id"));
            user1.setMaleaddress(rs.getString("maleaddress"));
            user1.setUser_name(rs.getString("user_name"));
            user1.setUser_hurigana(rs.getString("user_hurigana"));
            user1.setUser_address(rs.getString("user_address"));
            user1.setTelephone(rs.getString("telephone"));
        }

        rs.close();
        st.close();
        con.close();

        return user1;
    }

    // 購入情報を挿入
    public int insert(History history) throws Exception {
        Connection con = getConnection();

        String sql = "INSERT INTO history (USER_ID, ITEM_ID, FLAG, IMAGE_DATA, PURCHASE_DATE) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, history.getUser_Id());
        st.setInt(2, history.getItem_Id());
        st.setBoolean(3, history.isFlag());
        st.setString(4, history.getImage_Data());
        st.setTimestamp(5, history.getPurchase_Date()); // 購入日時を挿入

        int line = st.executeUpdate();

        System.out.println("購入情報の登録が完了しました。");

        st.close();
        con.close();

        return line;
    }
}
