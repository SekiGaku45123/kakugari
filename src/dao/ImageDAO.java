package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Images;

public class ImageDAO extends DAO {
	public int insert(Images deta) throws Exception {
		// ここから
		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
			"insert into images values(?, ?)");
		st.setString(1, deta.getItem_id());
		//st.setBlob(2, new ByteArrayInputStream(deta.getImage_data()));
		int line=st.executeUpdate();

		st.close();
		con.close();
		// ここまで
		return line;
	}

	public List<Images> all() throws Exception {

		List<Images> list = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM images JOIN item ON images.item_id = CAST(item.item_id AS INTEGER);");
		ResultSet rs=st.executeQuery();


		while (rs.next()){
			Images p=new Images();
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

	public List<Images> category() throws Exception {

		List<Images> list = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"select DISTINCT category from item");
		ResultSet rs=st.executeQuery();


		while (rs.next()){
			Images p=new Images();
			p.setCategory(rs.getString("category"));
			list.add(p);
		}

		st.close();
		con.close();

		return list;

	}

	public int imageinsert(Images image) throws Exception {
		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"INSERT INTO IMAGES VALUES(?, ?, ?, ?, ?)");
		st.setString(1, image.getItem_id());
		st.setString(2, image.getImage_data());
		st.setString(3, image.getImage_data1());
		st.setString(4, image.getImage_data2());
		st.setString(5, image.getUser_id());
		int list=st.executeUpdate();

		st.close();
		con.close();

		return list;
	}

}
