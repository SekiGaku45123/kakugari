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
	public List<Item> categorysibori(String keyword, String category, String hanbai, String urikire, String sinpin, String yogore, String gatiyogore, String pricemin, String pricemax) throws Exception {
	    List<Item> list = new ArrayList<>();
	    Connection con = getConnection();
	    StringBuilder sql = new StringBuilder("SELECT * FROM item JOIN images ON images.item_id = item.item_id WHERE ");
	    List<Object> parameters = new ArrayList<>();

	    if (keyword != null && !keyword.isEmpty()) {
	        sql.append("(item.item_name LIKE ? OR item.item_name LIKE ?) AND ");
	        parameters.add("%" + keyword + "%");
	        parameters.add(keyword + "%");
	    }

	    if (category != null && !category.isEmpty()) {
	        sql.append("(item.category LIKE ? OR item.category LIKE ?) AND ");
	        parameters.add("%" + category + "%");
	        parameters.add(category + "%");
	    }

	    if (hanbai != null) {
	        sql.append("item.flag = true AND ");
	    } else if ("false".equals(urikire)) {
	        sql.append("item.flag = false AND ");
	    }

	    if ("新品".equals(sinpin)) {
	        sql.append("item.condition = '新品' AND ");
	    }
	    if ("目立った傷や汚れなし".equals(yogore)) {
	        sql.append("item.condition = '目立った傷や汚れなし' AND ");
	    }
	    if ("全体的に状態が悪い".equals(gatiyogore)) {
	        sql.append("item.condition = '全体的に状態が悪い' AND ");
	    }

	    if (pricemin != null && !pricemin.isEmpty()) {
	        sql.append("item.item_price >= ? AND ");
	        parameters.add(Integer.parseInt(pricemin));
	    }
	    if (pricemax != null && !pricemax.isEmpty()) {
	        sql.append("item.item_price <= ? AND ");
	        parameters.add(Integer.parseInt(pricemax));
	    }

	    if (sql.toString().endsWith(" AND ")) {
	        sql.setLength(sql.length() - 5);
	    }

	    PreparedStatement st = con.prepareStatement(sql.toString());
	    for (int i = 0; i < parameters.size(); i++) {
	        st.setObject(i + 1, parameters.get(i));
	    }

	    ResultSet rs = st.executeQuery();
	    while (rs.next()) {
	        Item p = new Item();
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

}

