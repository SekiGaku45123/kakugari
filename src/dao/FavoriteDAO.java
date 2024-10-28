package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import bean.Favorite;

public class FavoriteDAO extends DAO {
	public int insert(Favorite product) throws Exception {
		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
				"insert into favorite values (?, ?)");
		st.setString(1, product.getUser_id());
		st.setString(2, product.getItem_id());
		int line=st.executeUpdate();

		st.close();
		con.close();
		return line;
	}

}
