package dao;

<<<<<<< HEAD
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Item;
import bean.Product;

public class ItemDAO extends DAO{
	public List<Item> Buy() throws Exception {

		List<Item> list = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
				"select * from item WHERE item_id=?");
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Item p=new Item();
			p.setItem_id(rs,getString("item_id"));
			p.setUser_id(rs,getString("user_id"));
			p.setItem_price(rs.getInt("item_price"));
			p.setCategory(rs,getString("category"));
			p.setItem_detail(("item_detail"));
			p.setCondition(rs, getString("condition"));
			p.setArea(rs,getString("area"));
			p.setShipping_days(rs,getInt("shipping_days"));
		    p.setBoolean(rs.getString("flag"));
			}

			st.close();
			con.close();


				return list;
	}
=======
public class ItemDAO {

}
>>>>>>> branch 'master' of https://github.com/SekiGaku45123/kakugari.git
