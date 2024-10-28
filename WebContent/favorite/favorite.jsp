<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.html" %>
<%@ include file="../common/base.jsp" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="bean.Item" %> <!-- Itemクラスのインポート -->
<%@ page import="bean.User" %> <!-- Userクラスのインポート -->

<%
    User user = (User) session.getAttribute("user"); // ユーザー情報を取得

    if (user != null) {
        List<Item> favoriteItems = new ArrayList<>();
        String userId = user.getUser_id(); // USER_ID を取得

        // データベースからお気に入りアイテムを取得
        try (Connection conn = DriverManager.getConnection("jdbc:h2:~/test", "sa", "");
             PreparedStatement pstmt = conn.prepareStatement("SELECT ITEM_ID FROM FAVORITE WHERE USER_ID = ?")) {
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String itemId = rs.getString("ITEM_ID");
                // Itemオブジェクトを取得し、お気に入りリストに追加
                // 例: Item item = ItemDAO.getItemById(itemId);
                // favoriteItems.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("favoriteItems", favoriteItems);
    }
%>

<c:choose>
    <c:when test="${not empty favoriteItems}">
        <p>${favoriteItems.size()}種類のお気に入り商品があります。</p>
        <hr>
    </c:when>
    <c:otherwise>
        <p>お気に入りに商品がありません。</p>
    </c:otherwise>
</c:choose>

<table style="border-collapse:separate; border-spacing:10px;">
<c:forEach var="item" items="${favoriteItems}">
<tr>
    <td>商品${item.item_id}</td>
    <td><img src="image/${item.item_id}.jpg" height="96"></td>
    <td>${item.item_name}</td>
    <td>${item.item_price}円</td>
    <td><a href="FavoriteRemove.action?id=${item.item_id}">お気に入りから削除</a></td>
</tr>
</c:forEach>
</table>

<%@ include file="../footer.html" %>
