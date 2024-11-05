<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>

<c:import url="/common/base.jsp">
</c:import>

<!-- 「いいね！一覧」タイトルを中央揃え -->
<h2 style="text-align: center; margin-top: 20px;">いいね！一覧</h2>

<!-- 販売中のみ表示するチェックボックス -->
<div>
    <label><input type="checkbox" id="saleOnlyCheckbox"> 販売中のみ表示</label>
</div>

<c:choose>
    <c:when test="${not empty favoriteItems}">
        <p>${favoriteItems.size()}種類のお気に入り商品があります。</p>

        <!-- 商品リストをテーブルとして表示 -->
        <div class="container">
            <div class="row">
                <c:forEach var="item" items="${favoriteItems}">
                    <div class="col-12 d-flex align-items-center mb-3 p-3" style="border-bottom: 1px solid #eee;">
                        <!-- 商品の画像 -->
                        <div class="me-3">
                            <img src="${item.getImage_data()}" width="80" height="80" alt="${item.item_name}" style="object-fit: cover;">
                        </div>

                        <!-- 商品の詳細 -->
                        <div class="flex-grow-1">
                            <h5 class="mb-1">${item.item_name}</h5>
                            <p class="text-muted mb-1">￥${item.item_price}</p>
                        </div>

                        <!-- 購入ボタンと削除リンク -->
						<div class="d-flex align-items-center">
    					     <!-- 購入ボタン -->
                             <form action="${pageContext.request.contextPath}/main_kakugari/purchase-in.jsp" method="post" class="me-2">
       							 <input type="hidden" name="item_id" value="${item.item_id}">
       							 <button type="submit" class="btn btn-danger btn-sm">購入</button>
    						</form>
                            <!-- お気に入りから削除リンク -->
                            <a href="${pageContext.request.contextPath}/kakugari/favoriteremove?id=${item.item_id}" class="text-secondary">削除</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:when>

    <c:otherwise>
        <p>お気に入りに商品がありません。</p>
    </c:otherwise>
</c:choose>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />
