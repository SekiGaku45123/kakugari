package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;

import judge.Judge;
public class JudgeDAO extends DAO{


   public int saveJudge(Judge judge) throws Exception {

	   Connection con = getConnection();

       String query = "INSERT INTO judge (item_id, user_id, comment, evaluate) VALUES (?, ?, ?, ?)";
           PreparedStatement stmt = con.prepareStatement(query);
           stmt.setString(1, judge.getItemId());
           stmt.setString(2, judge.getUserId());
           stmt.setString(3, judge.getComment());
           stmt.setBoolean(4, judge.isEvaluate());
           int line = stmt.executeUpdate();

           stmt.close();
           con.close();

       return line;
   }
}
