<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, java.net.URLEncoder" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>いいね！一覧 - カクガリ</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css">

<c:import url="/common/base.jsp" /> <!-- base.jspをインクルード -->

<!-- base.jspのheaderはインクルードされているので、この時点でheaderが表示される -->

<div id="content"> <!-- content IDで内容を囲む -->
    <h2 style="text-align: center; margin-top: 20px;">いいね！一覧</h2>

    <c:choose>
        <c:when test="${not empty favoriteItems}">
            <p style="text-align: center;">${favoriteItems.size()}個の『いいね！』した商品があります</p>
            <div class="container">
                <div class="row">
                    <c:forEach var="item" items="${favoriteItems}">
                        <div class="col-12 mb-3 p-3" style="border-bottom: 1px solid #eee;">
                            <div class="d-flex align-items-start">
                                <div class="me-3">
                                    <a href="../kakugari/product?item_id=${item.getItem_id()}">
                                        <img src="${item.getImage_data()}" width="80" height="80" alt="${item.item_name}" style="object-fit: cover;">
                                    </a>
                                </div>
                                <div class="flex-grow-1">
                                    <h5 class="mb-1">${item.item_name}</h5>
                                    <p class="text-muted mb-1">￥${item.item_price}</p>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end mt-2">
                                <form action="${pageContext.request.contextPath}/main_kakugari/purchase-in.jsp" method="post" class="me-3">
                                    <input type="hidden" name="item_id" value="${item.item_id}">
                                    <input type="hidden" name="flag" value="${item.getFlag()}">
                                    <input type="hidden" name="image_data" value="${item.getImage_data()}">
                                    <button type="submit" class="btn btn-primary btn-sm">購入</button>
                                </form>
                                <a href="${pageContext.request.contextPath}/kakugari/favoriteremove?id=${item.item_id}" class="btn btn-outline-danger btn-sm">削除</a>

                            </div>

                        </div>

                    </c:forEach>
                    <br><br><br><br><br><br><br><br><br><br>
                </div>
            </div>
        </c:when>

        <c:otherwise>
            <p style="text-align: center;">『いいね！』した商品がありません</p>
            <br><br><br><br><br><br><br><br><br><br>
        </c:otherwise>
    </c:choose>
</div>

<!-- Footer inclusion with the footer container to remove extra space -->


<jsp:include page="/footer.html" />
