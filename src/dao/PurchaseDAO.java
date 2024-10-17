package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import bean.Item;

public class PurchaseDAO extends DAO{
	public boolean insert(Item data)throws Exception {
		Connection con=getConnection();
		con.setAutoCommit(false);

			PreparedStatement st=con.prepareStatement(
					"insert into purchase values(null,?,?,?,?,?,?,?,?,?)");
			st.setString(1, data.getItem_id());
			st.setString(2, data.getUser_id());
			st.setInt(3, data.getItem_price());
			st.setString(4, data.getCategory());
			st.setString(5, data.getItem_detail());
			st.setString(6, data.getCondition());
			st.setString(7, data.getArea());
			st.setInt(8, data.getShipping_days());
			st.setBoolean(9, data.getFlag());



			int line=st.executeUpdate();
			st.close();

			if (line!=1){
				con.rollback();
				con.setAutoCommit(true);
				con.close();

				return false;
			}

		st.close();
		con.close();

		return true;
	}

}