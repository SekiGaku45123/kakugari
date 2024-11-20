package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Credit;

public class CreditDAO extends DAO {

    // クレジットカード情報を取得するメソッド
    public Credit getCreditInfo(String userId) throws Exception {
        Credit credit = null;

        // ユーザーIDからクレジットカード情報を取得するSQLクエリ
        String sql = "SELECT * FROM credit WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userId);  // user_idを設定
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    credit = new Credit();
                    credit.setCreditNumber(rs.getString("credit_number"));
                    credit.setExpiryDate(rs.getString("expiry_date"));
                    credit.setSecurityCode(rs.getString("security_code"));
                    credit.setUserId(rs.getString("user_id"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return credit;
    }

    public int insertCredit(Credit credit) throws Exception {
        // コネクションを取得
        Connection con = getConnection();

        PreparedStatement st1 = con.prepareStatement("SELECT MAX(ID) AS MAX FROM CREDIT");
        ResultSet rs = st1.executeQuery();
        rs.next();
        int maxId = rs.getInt("MAX");

        String maxText1 = Integer.toString(maxId);

        String st2 = "SELECT id, credit_number, expiry_date, security_code, user_id from credit where credit_number=? and expiry_date=? and security_code=? and user_id=?";
        PreparedStatement st3 = con.prepareStatement(st2);
        st3.setString(1, credit.getCreditNumber());
        st3.setString(2, credit.getExpiryDate());
        st3.setString(3, credit.getSecurityCode());
        st3.setString(4, credit.getUserId());

        int line = st3.executeUpdate();

        if(line > 0){

        	int result = 10;

        	return result;

        }else{
	        // 最大のIDを取得するクエリ

	        maxId = maxId + 1;  // 新しいIDを生成
	        String maxText = Integer.toString(maxId);  // IDを文字列に変換

	        String sql = "INSERT INTO CREDIT (ID, CREDIT_NUMBER, EXPIRY_DATE, SECURITY_CODE, USER_ID) VALUES (?, ?, ?, ?, ?)";
	        PreparedStatement st = con.prepareStatement(sql);

	        // パラメータを設定
	        st.setString(1, maxText);
	        st.setString(2, credit.getCreditNumber());
	        st.setString(3, credit.getExpiryDate());
	        st.setString(4, credit.getSecurityCode());
	        st.setString(5, credit.getUserId());

	        // クエリ実行
	        int result = st.executeUpdate();

	        // リソースの解放
	        st.close();
	        con.close();

	        return result;  // 正常に挿入された場合は1が返る
        }
    }
}
