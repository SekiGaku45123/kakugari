package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.User;

public class BuysearchDAO extends DAO {

	public User search(String name,String address) throws Exception {
		User user = null;

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from user where name=? and address=?");
		st.setString(1,name);
		st.setString(2,address);
		ResultSet rs = st.executeQuery();


		if(rs.next()){
			user = new User();
			user.setUser_id(rs.getString("user_id"));
			user.setMaleaddress(rs.getString("maleaddress"));
			user.setUser_name(rs.getString("user_name"));
			user.setUser_hurigana(rs.getString("User_hurigana"));
			user.setUser_address(rs.getString("User_address"));
			user.setTelephone(rs.getString("telephone"));

		}
		st.close();
		con.close();

		return user;
	}
}
