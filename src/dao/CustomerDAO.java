package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.User;

public class CustomerDAO extends DAO {

	public User search(String login,String password) throws Exception {
		User customer = null;

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from customer where login=? and password=?");
		String user_id = null;
		st.setString(1,user_id);
		st.setString(2,password);
		ResultSet rs = st.executeQuery();


		while(rs.next()){
			customer = new User();
			customer.setUser_id(rs.getString("user_id"));
			customer.setMaleaddress(rs.getString("maleaddress"));
			customer.setUser_name(rs.getString("user_name"));
			customer.setUser_hurigana(rs.getString("User_hurigana"));
			customer.setUser_address(rs.getString("User_address"));
			customer.setTelephone(rs.getString("telephone"));

		}
		st.close();
		con.close();

		return customer;
	}
}
