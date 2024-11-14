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

	public List<Item> search(String keyword, String category) throws Exception {

		List<Item> list = new ArrayList<>();

		Connection con=getConnection();

		String catego = "";

		if(category != null){
			catego = "select * from item join images on images.item_id = item.item_id WHERE item.category LIKE ? OR item.category LIKE ?";
			keyword = category;
			System.out.print(keyword);
		}else{
			catego = "select * from item join images on images.item_id = item.item_id WHERE item.item_name LIKE ? OR item.item_name LIKE ?";
		}

		PreparedStatement st = con.prepareStatement(
				catego);
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
	public List<Item> categoryall() throws Exception {

		List<Item> suggestions = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT DISTINCT category FROM ITEM ");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
            	Item p=new Item();
            	p.setCategory(rs.getString("category"));

            	suggestions.add(p);
            }



            st.close();
    		con.close();

    		return suggestions;
  }

}

