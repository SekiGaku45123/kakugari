package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
