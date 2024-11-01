<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>

<c:import url="/common/base.jsp">
</c:import>
<style>

.scroll-container {
  overflow: hidden;
  white-space: nowrap;
  max-width: 100%;
  display: flex;
  align-items: center;
}

.scroll-content {
  display: inline-flex;
animation: scroll 30s linear infinite;
}

.scroll-content1{
	display: inline-flex;
	animation: scro 30s -15s linear infinite;
}


.toire {
  display: inline-block;
  margin: 0 10px;
  width: auto;
}

.imgagess {
  position: relative;
}

.imgagess img {
  object-fit: contain;
  width: 300px;
  height: 300px;
  background: #f5f5f5;
}

.price-overlay {
  position: absolute;
  bottom: 10px;
  left: 10px;
  background-color: rgba(0, 0, 0, 0.6);
  color: white;
  padding: 5px 10px;
  border-radius: 10px;
  font-weight: bold;
  font-size: 14px;
}

.toire p {
  word-wrap: break-word;
  white-space: normal;
  overflow-wrap: break-word;
}

.img_logo {
    position: relative;
    color: white;
    margin: 0 60px 10px;
    display: flex;
    justify-content: center;
}

.img_logo img {
    border-radius: 10px;
    object-fit: cover;
    width: 100vw;
    height: 50vw;
}

.img_logo p {
    position: absolute;
    color: #ff476f;
    font-weight: bold;
}


.top-text {
    top: 20%;
    font-size: 9vw;
}


.bottom-text {
    bottom: 30%;
    font-size: 8vw;
}

@keyframes scroll {
  0% {
    transform: translateX(100%);
  }
  100%{
    transform: translateX(-100%);
  }
}

@keyframes scro {
  0% {
    transform: translateX(0);
  }
  100%{
    transform: translateX(-200%);
  }
}


</style>
<div class="img_logo">
	<img src="../kakugari_image/image_logo.jpg">
	<p class="top-text">フリマサイト</p><br>
	<p class="bottom-text">―FREE MARKET―</p>
</div>
<div class="scroll-container">
  <div class="scroll-content">
    <c:forEach var="p" items="${all}">
      <div class="toire">
        <div class="imgagess mese">
          <a href="../kakugari/product?item_id=${p.getItem_id()}">
            <img src="${p.getImage_data()}"  class="sasa">
            <div class="price-overlay">￥${p.getItem_price()}</div>
          </a>
        </div>
        <p>${p.getItem_name()}</p>
      </div>
    </c:forEach>
   </div>
   <div class="scroll-content1">
    <!-- 2回目の繰り返し -->
    <c:forEach var="p" items="${all}">
      <div class="toire">
        <div class="imgagess mese">
          <a href="../kakugari/product?item_id=${p.getItem_id()}">
            <img src="${p.getImage_data()}"  class="sasa">
            <div class="price-overlay">￥${p.getItem_price()}</div>
          </a>
        </div>
        <p>${p.getItem_name()}</p>
      </div>
    </c:forEach>
   </div>
</div>


<!-- footerの読み込み -->
<jsp:include page="/footer.html" />