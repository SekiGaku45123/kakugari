package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.User;

public class BuysearchDAO extends DAO {

	public User search(String name,String address) throws Exception {
		User user1 = null;

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from user where user_name=? and user_address=?");
		st.setString(1,name);
		st.setString(2,address);
		ResultSet rs = st.executeQuery();


		if(rs.next()){
			user1 = new User();
			user1.setUser_id(rs.getString("user_id"));
			user1.setMaleaddress(rs.getString("maleaddress"));
			user1.setUser_name(rs.getString("user_name"));
			user1.setUser_hurigana(rs.getString("User_hurigana"));
			user1.setUser_address(rs.getString("User_address"));
			user1.setTelephone(rs.getString("telephone"));

		}
		st.close();
		con.close();

		return user1;
	}
}
