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
	public List<Item> categorysibori(String keyword, String category, boolean hanbai, boolean urikire, boolean sinpin, boolean yogore, boolean gatiyogore, String pricemin, String pricemax) throws Exception {
	    List<Item> list = new ArrayList<>();
	    Connection con = getConnection();
	    StringBuilder sql = new StringBuilder("SELECT * FROM item JOIN images ON images.item_id = item.item_id WHERE ");
	    List<Object> parameters = new ArrayList<>();

    	if (keyword != null && !keyword.isEmpty()) {
	        sql.append("(item.item_name LIKE ? OR item.item_name LIKE ?) AND ");
	        parameters.add("%" + keyword + "%");
	        parameters.add(keyword + "%");
	        System.out.println("keyword"+keyword);
	    }
    	if(category.equals("all")){
	    	System.out.print("処理をしない");
	    }else{
		    if (category != null && !category.isEmpty()) {
		        sql.append("(item.category LIKE ? OR item.category LIKE ?) AND ");
		        parameters.add("%" + category + "%");
		        parameters.add(category + "%");
		        System.out.println("category"+category);
		    }
	    }
	    if(hanbai == true && urikire == true){
		    System.out.print("どっちもね♡");
	    }else{
	    	if (hanbai == true) {
		        sql.append("item.flag = true AND ");
		        System.out.println("販売中"+"true");
		    }if (urikire == true) {
		        sql.append("item.flag = false AND ");
		        System.out.println("販売中"+"false");
		    }
	    }

	    if(sinpin == true || yogore == true || gatiyogore == true){
	    	sql.append("(");
		    if (sinpin == true) {
		        sql.append("item.condition = '新品' OR ");
		        System.out.println("CONDITION"+"新品");
		    }
		    if (yogore == true) {
		        sql.append("item.condition = '目立った傷や汚れなし' OR ");
		        System.out.println("CONDITION"+"目立った傷や汚れなし");
		    }
		    if (gatiyogore == true) {
		        sql.append("item.condition = '全体的に状態が悪い' OR ");
		        System.out.println("CONDITION"+"全体的に状態が悪い");
		    }

		    if (sql.toString().endsWith(" OR ")) {
		        sql.setLength(sql.length() - 4); // ORを削除
		    }
		    sql.append(")");
		    sql.append(" AND ");
	    }

	    if (pricemin != null && !pricemin.isEmpty()) {
	        sql.append("item.item_price >= ? AND ");
	        parameters.add(Integer.parseInt(pricemin));
	        System.out.println("Price"+pricemin);
	    }
	    if (pricemax != null && !pricemax.isEmpty()) {
	        sql.append("item.item_price <= ? AND ");
	        parameters.add(Integer.parseInt(pricemax));
	        System.out.println("Price"+pricemax);
	    }

	    if (sql.toString().endsWith(" AND ")) {
	        sql.setLength(sql.length() - 5); // ANDを削除
	    } else if (sql.toString().endsWith(" OR ")) {
	        sql.setLength(sql.length() - 4); // ORを削除
	    } else if (sql.toString().endsWith(" WHERE ")) {
	        sql.setLength(sql.length() - 7); // ORを削除
	    }

	    PreparedStatement st = con.prepareStatement(sql.toString());
	    for (int i = 0; i < parameters.size(); i++) {
	        st.setObject(i + 1, parameters.get(i));
	    }
	    System.out.println(sql);
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
	public List<Item> confirm(String keyword) throws Exception {

		List<Item> list = new ArrayList<>();

		Connection con=getConnection();

		String catego = "";


		catego = "select * from item join images on images.item_id = item.item_id WHERE item.item_id LIKE ?";


		PreparedStatement st = con.prepareStatement(
				catego);
		st.setString(1, keyword);
		ResultSet rs=st.executeQuery();


		while (rs.next()){
			Item p=new Item();
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			String imageData = rs.getString("image_data");
		    if (imageData.startsWith("..")) {
		        imageData = imageData.substring(2); // 先頭の「..」を削除
		    }
		    p.setImage_data(imageData);
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

	public int listinginsert(Item item) throws Exception {
		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"INSERT INTO ITEM VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		st.setString(1, item.getItem_id());
		st.setString(2, item.getUser_id());
		st.setInt(3, item.getItem_price());
		st.setString(4, item.getCategory());
		st.setString(5, item.getItem_detail());
		st.setString(6, item.getCondition());
		st.setString(7, item.getArea());
		st.setInt(8, item.getShipping_days());
		st.setBoolean(9, true);
		st.setString(10, item.getItem_name());
		int line=st.executeUpdate();

		st.close();
		con.close();

		return line;
	}






	public int getMaxItemId() throws Exception {
		String sql = "SELECT MAX(CAST(item_id AS INTEGER)) AS max_value FROM item";
	    int maxItemId = 0;

	    try (Connection conn = getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {

	        if (rs.next()) {
	            maxItemId = rs.getInt("max_value");
	        }
	    }
	    return maxItemId;

	}

	public int updateinsert(Item item) throws Exception {
		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"UPDATE ITEM SET flag = FALSE where item_id = ?");
		st.setString(1, item.getItem_id());
		int line=st.executeUpdate();

		st.close();
		con.close();

		return line;
	}

	public List<Item> getbuy(String item) throws Exception {


		List<Item> list = new ArrayList<>();

		Connection con=getConnection();

		String sql = "SELECT item_id from Item where user_id = ? and flag = FALSE";

	         PreparedStatement pstmt = con.prepareStatement(sql);
	    	 pstmt.setString(1, item);
	         ResultSet rs = pstmt.executeQuery();

	    	while (rs.next()) {
	        	Item p=new Item();
	        	System.out.println(rs.getString("item_id"));
				p.setItem_id(rs.getString("item_id"));

				list.add(p);
	        }
	    return list;


	}




}

