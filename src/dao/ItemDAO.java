package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Item;

public class ItemDAO extends DAO{
	public List<Item> buy(String code) throws Exception {

		List<Item> list = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
				"select * from item join images on images.item_id = item.item_id WHERE item.item_id = ?");
		st.setString(1, code);
		ResultSet rs=st.executeQuery();



		if (rs.next()){
			Item p=new Item();
			p.setItem_id(rs.getString("item_id"));
			p.setImage_data(rs.getString("image_data"));
			p.setItem_name(rs.getString("item_name"));
			p.setUser_id(rs.getString("user_id"));
			p.setItem_price(rs.getInt("item_price"));
			p.setCategory(rs.getString("category"));
			p.setItem_detail(rs.getString("item_detail"));
			p.setCondition(rs. getString("condition"));
			p.setArea(rs.getString("area"));
			p.setShipping_days(rs.getInt("shipping_days"));
		    p.setFlag(rs.getBoolean("flag"));
		    System.out.print(rs.getString("item_name"));
		    list.add(p);
			}

			st.close();
			con.close();

			return list;
		}

}

