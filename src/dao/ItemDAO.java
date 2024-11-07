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

	public List<Item> search(String keyword) throws Exception {

		List<Item> list = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"select * from item join images on images.item_id = item.item_id WHERE item.item_name LIKE ? OR item.item_name LIKE ?");
		st.setString(1, keyword + "%");
		st.setString(2, "%" + keyword + "%");
		ResultSet rs=st.executeQuery();


		while (rs.next()){
			Item p=new Item();
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setImage_data(rs.getString("image_data"));
			p.setItem_name(rs.getString("item_name"));
			p.setItem_price(rs.getInt("item_price"));
			p.setItem_detail(rs.getString("item_detail"));
			p.setCategory(rs.getString("category"));
			p.setCondition(rs.getString("condition"));
			p.setArea(rs.getString("area"));
			p.setShipping_days(rs.getInt("shipping_days"));
			p.setFlag(rs.getBoolean("flag"));

			list.add(p);
		}

		st.close();
		con.close();

		return list;
	}
	public List<Item> suggest(String query) throws Exception {

		List<Item> suggestions = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT item_name FROM item WHERE item_name LIKE ? LIMIT 10");
            st.setString(1, query + "%"); // 部分一致で検索
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
            	Item p=new Item();
            	p.setItem_name(rs.getString("item_name"));

            	suggestions.add(p);
            }



            st.close();
    		con.close();

    		return suggestions;
  }

}

