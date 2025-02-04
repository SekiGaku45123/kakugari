package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Receiving;
import bean.Transaction;

public class TransactionDAO extends DAO {
	public int insert(Transaction p) throws Exception{

		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"INSERT INTO transaction VALUES(?, ?, null, ?, null, ?, ?)");
		st.setString(1, p.getItem_id());
		st.setString(2, p.getPurchaser());
		//st.setString(3, p.getPurchaser());
		st.setString(3, p.getExhibit_user());
		//st.setString(5, p.getPurchaser());
		st.setBoolean(4, true);
		st.setBoolean(5, false);
		int line=st.executeUpdate();

		st.close();
		con.close();

		return line;

	}

	public List<Transaction> search(String keyword) throws Exception{

		List<Transaction> list = new ArrayList<>();

		Connection con=getConnection();

		System.out.println(keyword);

		PreparedStatement st = con.prepareStatement(
				"select t.item_id, m.item_name, i.image_data, u.user_id, u.user_name, t.purchaser from transaction as t join images as i on t.item_id = i.item_id join item as m on t.item_id = m.item_id join user1 as u on t.purchaser = u.user_id where t.exhibit_user = ?");
		st.setString(1, keyword);
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Transaction p = new Transaction();
			System.out.print(rs.getString("item_id"));
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setItem_name(rs.getString("item_name"));
			p.setImage_data(rs.getString("image_data"));
			p.setUser_name(rs.getString("user_name"));
			list.add(p);
		}


		st.close();
		con.close();

		return list;
	}

	public int updateinsert(String p) throws Exception{


		Connection con=getConnection();
		PreparedStatement st=con.prepareStatement(
				"UPDATE transaction SET ORDER_COMP = TRUE where item_id = ?");
		st.setString(1, p);
		int line=st.executeUpdate();
		st.close();
		con.close();

		return line;
	}

	public int updateinsert_come(String p, String pp, String ppp) throws Exception{


		Connection con=getConnection();
		PreparedStatement st=con.prepareStatement(
				"UPDATE transaction SET exhibit_come = ? where exhibit_user = ? and item_id = ?");
		st.setString(1, p);
		st.setString(2, pp);
		st.setString(3, ppp);
		int line=st.executeUpdate();
		st.close();
		con.close();

		return line;
	}

	public List<Transaction> sach(String p, String pp) throws Exception{
		List<Transaction> list = new ArrayList<>();

		Connection con=getConnection();
		PreparedStatement st=con.prepareStatement(
				"select * from transaction where exhibit_user = ? and item_id = ?");
		st.setString(1, p);
		st.setString(2, pp);
		ResultSet rs=st.executeQuery();

		if (rs.next()){
			Transaction p1 = new Transaction();

			p1.setExhibit_come(rs.getString("exhibit_come"));
			System.out.print(rs.getString("exhibit_come")+"kakaka");
			list.add(p1);

		}
		st.close();
		con.close();

		return list;

	}

	public int insert_tuti(Receiving p) throws Exception{

		Connection con=getConnection();

		PreparedStatement st = con.prepareStatement(
				"INSERT INTO RECEIVING VALUES(?, ?, ?)");
		st.setString(1, p.getItem_id());
		st.setString(2, p.getUser_id());
		st.setString(3, p.getExhibit_user());//こっちが購入者
		int line=st.executeUpdate();

		st.close();
		con.close();

		return line;
	}

	public List<Transaction> search_tuti(String keyword)throws Exception{

		List<Transaction> list = new ArrayList<>();

		Connection con=getConnection();

		System.out.println(keyword);

		PreparedStatement st = con.prepareStatement(
				"select t.item_id, m.item_name, i.image_data, u.user_id, u.user_name from transaction as t join images as i on t.item_id = i.item_id join item as m on t.item_id = m.item_id join user1 as u on t.exhibit_user = u.user_id join receiving as r on r.item_id = t.item_id where t.purchaser = ? and order_comp = TRUE;");
		st.setString(1, keyword);
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Transaction p = new Transaction();
			System.out.print(rs.getString("item_id"));
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setItem_name(rs.getString("item_name"));
			p.setImage_data(rs.getString("image_data"));
			p.setUser_name(rs.getString("user_name"));
			list.add(p);
		}



		st.close();
		con.close();

		return list;
	}

	public List<Transaction> search_purchaser_tuti(String keyword) throws Exception{

		List<Transaction> list = new ArrayList<>();

		Connection con=getConnection();

		System.out.println(keyword);

		PreparedStatement st = con.prepareStatement(
				"select DISTINCT t.item_id, m.item_name, i.image_data, u.user_id, u.user_name, t.purchaser from transaction as t join images as i on t.item_id = i.item_id join item as m on t.item_id = m.item_id join user1 as u on t.purchaser = u.user_id join judge as tes on tes.item_id = t.item_id where t.exhibit_user = ? and tes.notification = TRUE");
		st.setString(1, keyword);
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Transaction p = new Transaction();
			System.out.println("なになになに");
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setItem_name(rs.getString("item_name"));
			p.setImage_data(rs.getString("image_data"));
			p.setUser_name(rs.getString("user_name"));
			list.add(p);
		}


		st.close();
		con.close();

		return list;
	}

	public List<Transaction> search_message(String keyword) throws Exception{
		List<Transaction> list = new ArrayList<>();

		Connection con=getConnection();

		System.out.println(keyword);

		PreparedStatement st = con.prepareStatement(
				"select DISTINCT t.exhibit_come, t.item_id, m.item_name, i.image_data, u.user_id, u.user_name, t.purchaser from transaction as t join images as i on t.item_id = i.item_id join item as m on t.item_id = m.item_id join user1 as u on t.purchaser = u.user_id where t.purchaser = ? and exhibit_come IS NOT NULL");
		st.setString(1, keyword);
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Transaction p = new Transaction();
			System.out.println("なになになに");
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setItem_name(rs.getString("item_name"));
			p.setImage_data(rs.getString("image_data"));
			p.setUser_name(rs.getString("user_name"));
			p.setExhibit_come(rs.getString("exhibit_come"));
			list.add(p);
		}


		st.close();
		con.close();

		return list;
	}

	public List<Transaction> search_mess(String keyword)throws Exception{

		List<Transaction> list = new ArrayList<>();


		Connection con=getConnection();

		System.out.println(keyword);

		PreparedStatement st = con.prepareStatement(
				"select ju.comment, ju.evaluate, t.item_id, m.item_name, i.image_data, u.user_id, u.user_name from transaction as t join images as i on t.item_id = i.item_id join item as m on t.item_id = m.item_id join user1 as u on t.purchaser = u.user_id join receiving as r on r.item_id = t.item_id join judge as ju on t.item_id = ju.item_id where t.exhibit_user = ? and ju.user_id = t.purchaser and order_comp = TRUE");
		st.setString(1, keyword);
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Transaction p = new Transaction();
			System.out.print(rs.getString("item_id"));
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setItem_name(rs.getString("item_name"));
			p.setImage_data(rs.getString("image_data"));
			p.setUser_name(rs.getString("user_name"));
			p.setComment(rs.getString("comment"));
			p.setEvaluate(rs.getBoolean("evaluate"));
			list.add(p);
		}



		st.close();
		con.close();

		return list;
	}

	public List<Transaction> search_mess1(String keyword)throws Exception{

		List<Transaction> list = new ArrayList<>();

		Connection con=getConnection();

		System.out.println(keyword);

		PreparedStatement st = con.prepareStatement(
				"select ju.comment, ju.evaluate, t.item_id, m.item_name, i.image_data, u.user_id, u.user_name from transaction as t join images as i on t.item_id = i.item_id join item as m on t.item_id = m.item_id join user1 as u on t.exhibit_user = u.user_id join receiving as r on r.item_id = t.item_id join judge as ju on t.item_id = ju.item_id where t.purchaser = ? and ju.user_id = t.exhibit_user and order_comp = TRUE;");
		st.setString(1, keyword);
		ResultSet rs=st.executeQuery();

		while (rs.next()){
			Transaction p = new Transaction();
			System.out.print(rs.getString("item_id"));
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
			p.setItem_name(rs.getString("item_name"));
			p.setImage_data(rs.getString("image_data"));
			p.setUser_name(rs.getString("user_name"));
			p.setComment(rs.getString("comment"));
			p.setEvaluate(rs.getBoolean("evaluate"));
			list.add(p);
		}



		st.close();
		con.close();

		return list;
	}

}
