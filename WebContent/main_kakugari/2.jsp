<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.html" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*, java.util.*, bean.Item, bean.User, java.net.URLEncoder" %>

<c:import url="/common/base.jsp">
</c:import>



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
