package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Credit;

public class CreditDAO extends DAO {

    // クレジットカード情報を取得するメソッド
    public Credit getCreditInfo(String string) throws Exception {
        Credit credit = null;

        // ユーザーIDからクレジットカード情報を取得するSQLクエリ
        String sql = "SELECT * FROM credit WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, string);  // user_idを設定
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    credit = new Credit();
                    credit.setCreditNumber(rs.getString("credit_number"));
                    credit.setExpiryDate(rs.getString("expiry_date"));
                    credit.setSecurityCode(rs.getString("security_code"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return credit;
    }

    // クレジットカード情報をデータベースに挿入するメソッド
    public int insertCredit(Credit credit) throws Exception {
        Connection con = getConnection();

        PreparedStatement st1 = con.prepareStatement("SELECT MAX(ID) AS MAX FROM CREDIT");
        ResultSet rs = st1.executeQuery();
        rs.next();
        int maxId = rs.getInt("MAX");
        maxId = maxId + 1;
        String maxText = Integer.toString(maxId);

        // INSERT文の準備
        String sql = "INSERT INTO CREDIT (ID, CREDIT_NUMBER, EXPIRY_DATE, SECURITY_CODE) VALUES (?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(sql);

        // パラメータを設定
        st.setString(1, maxText);
        st.setString(2, credit.getCreditNumber());
        st.setString(3, credit.getExpiryDate());
        st.setString(4, credit.getSecurityCode());

        // クエリ実行
        int result = st.executeUpdate();

        // リソースの解放
        st.close();
        con.close();

        return result;
    }
}
