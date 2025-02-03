package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Receiving;
import judge.Judge;
public class JudgeDAO extends DAO{


   public int saveJudge(Judge judge) throws Exception {

	   Connection con = getConnection();

       String query = "INSERT INTO judge VALUES (?, ?, ?, ?, ?)";
           PreparedStatement stmt = con.prepareStatement(query);
           stmt.setString(1, judge.getItemId());
           stmt.setString(2, judge.getUserId());
           stmt.setString(3, judge.getComment());
           stmt.setBoolean(4, judge.isEvaluate());
           stmt.setBoolean(5, true);
           int line = stmt.executeUpdate();

           stmt.close();
           con.close();

       return line;
   }

   public int insert(String item, String user_id) throws Exception {

	   Connection con = getConnection();
	   System.out.print("やってる？");

	   PreparedStatement st = con.prepareStatement(
				"INSERT INTO tesuto VALUES (?,?,?)");
	   st.setString(1, "TRUE");
	   st.setString(2, item);
	   st.setString(3, user_id);
	   int line = st.executeUpdate();

	   st.close();
       con.close();

	   return line;
   }

   public List<Judge> flag_sea(String code) throws Exception {

		List<Judge> list = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
				"select * from judge where user_id = ?");
		st.setString(1, code);
		ResultSet rs=st.executeQuery();



		while (rs.next()){
			Judge p=new Judge();
			p.setItemId(rs.getString("item_id"));
			p.setUserId(rs.getString("user_id"));
		    list.add(p);
			}

			st.close();
			con.close();

			return list;
		}

   public List<Receiving> flag_sea1(String code) throws Exception {

		List<Receiving> list = new ArrayList<>();

		Connection con=getConnection();

		PreparedStatement st=con.prepareStatement(
				"select * from receiving where user_id = ?");
		st.setString(1, code);
		ResultSet rs=st.executeQuery();



		while (rs.next()){
			Receiving p=new Receiving();
			p.setItem_id(rs.getString("item_id"));
			p.setUser_id(rs.getString("user_id"));
		    list.add(p);
			}

			st.close();
			con.close();

			return list;
		}


}
