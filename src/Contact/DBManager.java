package Contact;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class DBManager {
   private static DataSource dataSource;
   static {
       try {
           InitialContext ctx = new InitialContext();
           dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/YourDBResource");
       } catch (NamingException e) {
           throw new ExceptionInInitializerError(e);
       }
   }
   public static DataSource getDataSource() {
       return dataSource;
   }
}