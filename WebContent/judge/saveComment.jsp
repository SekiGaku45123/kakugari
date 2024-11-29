<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
   String itemId = request.getParameter("item_id");
   String userId = request.getParameter("user_id");
   String comment = request.getParameter("comment");
   // コメントをデータベースに保存
   try (Connection conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "")) {
       String sql = "UPDATE judge SET comment = ? WHERE item_id = ? AND user_id = ?";
       try (PreparedStatement stmt = conn.prepareStatement(sql)) {
           stmt.setString(1, comment);
           stmt.setString(2, itemId);
           stmt.setString(3, userId);
           stmt.executeUpdate();
       }
   } catch (SQLException e) {
       e.printStackTrace();
   }
   // 保存完了後、完了ページにリダイレクト
   response.sendRedirect("/thankyou.jsp");
%>