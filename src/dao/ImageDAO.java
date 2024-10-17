package dao;

import java.io.ByteArrayInputStream;
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
		st.setBlob(2, new ByteArrayInputStream(deta.getImage_data()));
		int line=st.executeUpdate();

		st.close();
		con.close();
		// ここまで
		return line;
	}

	public List<Images> all() throws Exception {

		List<Images> list = new ArrayList<>();

		try (Connection con = getConnection();
	             PreparedStatement st = con.prepareStatement("select * from images");
	             ResultSet rs = st.executeQuery()) {
		while (rs.next()){
			Images p=new Images();
			p.setItem_id(rs.getString("item_id"));
			p.setImage_data(rs.getBytes("image_data"));

			list.add(p);
		}
		st.close();
		con.close();
		}

		return list;
	}



}
