package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bean.Comment;

public class CommentDAO extends DAO{
	public int commentinsert(Comment comment) throws Exception {
		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"INSERT INTO COMMENT VALUES(?, ?, ?, ?)");
		st.setString(1, comment.getItem_id());
		st.setString(2, comment.getUser_id());
		st.setString(3, comment.getComment());
		st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
		int line=st.executeUpdate();

		st.close();
		con.close();

		return line;

	}
	public List<Comment> commentsearch(String item_id) throws Exception {

		List<Comment> list = new ArrayList<>();
		System.out.print("移動はしている");

		Connection con=getConnection();

		String catego = "";

		catego = "select * from comment WHERE item_id = ? ";


		PreparedStatement st = con.prepareStatement(
				catego);
		st.setString(1, item_id);
		ResultSet rs=st.executeQuery();


		while (rs.next()){
			Comment p=new Comment();
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setComment(rs.getString("comment"));
			p.setPosted_day(rs.getString("posted_day"));
			list.add(p);
		}

		st.close();
		con.close();

		return list;
	}

}
