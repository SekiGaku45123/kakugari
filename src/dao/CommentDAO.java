package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bean.Comment;

public class CommentDAO extends DAO{
	public int commentinsert(Comment comment) throws Exception {
		Connection con = null;
	    PreparedStatement st = null;
	    try {
	        // データベース接続を取得
	        con = getConnection();

	        // SQL文を準備
	        st = con.prepareStatement(
	            "INSERT INTO COMMENT VALUES(?, ?, ?, ?)"
	        );
	        st.setString(1, comment.getItem_id());
	        st.setString(2, comment.getUser_id());
	        st.setString(3, comment.getComment());
	        st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));

	        // クエリ実行
	        int line = st.executeUpdate();

	        // 実行結果を返却
	        return line;

	    } catch (SQLException e) {
	        // SQLエラーが発生した場合の処理
	        System.err.println("SQLエラー: " + e.getMessage());
	        e.printStackTrace();
	        throw e; // 必要に応じて再スロー
	    }

	}
	public List<Comment> commentsearch(String item_id) throws Exception {

		List<Comment> list = new ArrayList<>();
		System.out.print("移動はしている");

		Connection con=getConnection();

		String catego = "";

		catego = "select c.item_id, c.user_id, c.comment, c.posted_day, u.user_name from comment as c join user1 as u on c.user_id = u.user_id WHERE c.item_id = ? ";


		PreparedStatement st = con.prepareStatement(
				catego);
		st.setString(1, item_id);
		ResultSet rs=st.executeQuery();


		while (rs.next()){
			Comment p=new Comment();
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setComment(rs.getString("comment"));
			String a_time = rs.getString("posted_day");
			a_time = a_time.substring(0, 16);
			p.setPosted_day(a_time);
			p.setUser_name(rs.getString("user_name"));
			list.add(p);
		}

		st.close();
		con.close();

		return list;
	}

}
