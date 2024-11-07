<%@page contentType="text/html; charset=UTF-8" %>
<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>いいね！一覧</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>


<c:import url="/common/base.jsp">
</c:import>

<!-- 「いいね！一覧」タイトルを中央揃え -->
<h2 style="text-align: center; margin-top: 20px;">いいね！一覧</h2>



<c:choose>
    <c:when test="${not empty favoriteItems}">
        <!-- この行にtext-align: center;を追加 -->
        <p style="text-align: center;">${favoriteItems.size()}種類のいいねした商品があります</p>

        <!-- 商品リストをテーブルとして表示 -->
        <div class="container">
    <div class="row">
        <div class="container">
    <div class="row">
        <c:forEach var="item" items="${favoriteItems}">
            <div class="col-12 mb-3 p-3" style="border-bottom: 1px solid #eee;">
                <!-- 商品の画像 -->
                <div class="d-flex align-items-start">
                    <div class="me-3">
                        <a href="../kakugari/product?item_id=${item.getItem_id()}"><img src="${item.getImage_data()}" width="80" height="80" alt="${item.item_name}" style="object-fit: cover;"></a>
                    </div>

                    <!-- 商品の詳細 -->
                    <div class="flex-grow-1">
                        <h5 class="mb-1">${item.item_name}</h5>
                        <p class="text-muted mb-1">￥${item.item_price}</p>
                    </div>
                </div>

                <!-- 購入ボタンと削除リンクを横並びに -->
                <div class="d-flex justify-content-end mt-2">
                    <!-- 購入ボタン -->
                    <form action="${pageContext.request.contextPath}/main_kakugari/purchase-in.jsp" method="post" class="me-3">
                        <input type="hidden" name="item_id" value="${item.item_id}">
                        <input type="hidden" name="flag" value="${item.getFlag()}">
	    	  			<input type="hidden" name="image_data" value="${item.getImage_data()}">
                        <button type="submit" class="btn btn-primary btn-sm">購入</button>
                    </form>

                    <!-- お気に入りから削除リンク -->
                    <a href="${pageContext.request.contextPath}/kakugari/favoriteremove?id=${item.item_id}" class="btn btn-outline-danger btn-sm">削除</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

    </c:when>

    <c:otherwise>
        <p style="text-align: center;">『いいね！』した商品がありません</p>
    </c:otherwise>
</c:choose>

<!-- footerの読み込み -->

<jsp:include page="/footer.html" />

