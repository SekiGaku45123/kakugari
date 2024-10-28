package Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;
public class InquiryDAO {
   private DataSource dataSource;
   public InquiryDAO(DataSource dataSource) {
       this.dataSource = dataSource;
   }
   public void insertInquiry(Inquiry inquiry) throws SQLException {
       String sql = "INSERT INTO inquiries (name, email, message) VALUES (?, ?, ?)";
       try (Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
           pstmt.setString(1, inquiry.getName());
           pstmt.setString(2, inquiry.getEmail());
           pstmt.setString(3, inquiry.getMessage());
           pstmt.executeUpdate();
       }
   }
}