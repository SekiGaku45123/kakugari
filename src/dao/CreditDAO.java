package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Credit;

public class CreditDAO extends DAO {

    // クレジットカード情報を取得するメソッド
    public Credit getCreditInfo(String userId) throws Exception {
        Credit credit = null;

        String sql = "SELECT * FROM credit WHERE user_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userId);
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
            throw e;
        }
        return credit;
    }

    public int insertCredit(Credit credit) throws Exception {
        try (Connection con = getConnection()) {

            // クレジットカード番号の重複を確認
            String checkSql = "SELECT COUNT(*) FROM credit WHERE credit_number = ?";
            try (PreparedStatement checkStmt = con.prepareStatement(checkSql)) {
                checkStmt.setString(1, credit.getCreditNumber());
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        return 10; // 重複エラーコードを返す
                    }
                }
            }

            // 新しいIDを生成
            String maxIdSql = "SELECT COALESCE(MAX(ID), 0) + 1 AS new_id FROM credit";
            int newId;
            try (PreparedStatement idStmt = con.prepareStatement(maxIdSql);
                 ResultSet rs = idStmt.executeQuery()) {
                rs.next();
                newId = rs.getInt("new_id");
            }

            // クレジット情報を挿入
            String insertSql = "INSERT INTO CREDIT (ID, CREDIT_NUMBER, EXPIRY_DATE, SECURITY_CODE, USER_ID) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement insertStmt = con.prepareStatement(insertSql)) {
                insertStmt.setInt(1, newId);
                insertStmt.setString(2, credit.getCreditNumber());
                insertStmt.setString(3, credit.getExpiryDate());
                insertStmt.setString(4, credit.getSecurityCode());
                insertStmt.setString(5, credit.getUserId());

                return insertStmt.executeUpdate(); // 正常に挿入された場合は1を返す
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    public List<Credit> getCred(String userId) throws Exception {

    	List<Credit> list1=new ArrayList<>();
    	Connection con = getConnection();

    	PreparedStatement st = con.prepareStatement(
				"SELECT * FROM credit WHERE user_id = ?");
		st.setString(1, userId);
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Credit p=new Credit();
			p.setCreditNumber(rs.getString("credit_number"));
			list1.add(p);
		}

		st.close();
		con.close();

		return list1;

    }


}
