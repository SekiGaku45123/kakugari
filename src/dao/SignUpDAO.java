package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.User;

public class SignUpDAO extends DAO {

	public int insertUser(User user) throws Exception {
	    Connection con = getConnection();
	  		PreparedStatement st1 = con.prepareStatement("SELECT count(User_ID) AS MAX FROM User");
	  		ResultSet rs = st1.executeQuery();
	  		rs.next();
	  		int maxId = rs.getInt("max");

	  		maxId=maxId + 1 ;

	  		String maxText = maxId + "";

	    String sql = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?)";
	    PreparedStatement st = con.prepareStatement(sql);

	    st.setString(1, maxText);
	    st.setString(4, user.getUser_name());
	    st.setString(5, user.getUser_hurigana());
	    st.setString(6, user.getUser_address());
	    st.setString(3, user.getPassword());
	    st.setString(2, user.getMaleaddress());
	    st.setString(7, user.getTelephone());

	    int result = st.executeUpdate();

	    st.close();
	    con.close();

	    return result;
	}
}
