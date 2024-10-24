package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import bean.User;

public class SignUpDAO extends DAO {

	public int insertUser(User user) throws Exception {
	    Connection con = getConnection();

	    String sql = "INSERT INTO USER (user_name, user_hurigana, user_address, password, maleaddress) VALUES (?, ?, ?, ?, ?)";
	    PreparedStatement st = con.prepareStatement(sql);

	    st.setString(1, user.getUser_name());  // ここを修正
	    st.setString(2, user.getUser_hurigana());
	    st.setString(3, user.getUser_address());
	    st.setString(4, user.getPassword());
	    st.setString(5, user.getMaleaddress());

	    int result = st.executeUpdate();

	    st.close();
	    con.close();

	    return result;
	}
}
