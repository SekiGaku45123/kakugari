<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />

<c:import url="/common/base.jsp">
</c:import>
<style>

.scroll-container {
  overflow: hidden;
  white-space: nowrap;
  width: 100%;
  display: flex;
  align-items: center;
  overflow: hidden;
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
    margin: 0 20px 20px;
    display: flex;
    justify-content: center;
}

.img_logo img {
    border-radius: 30px;
    object-fit: cover;
    width: 67vw;
    height: auto;
}

.img_logo p {
    position: absolute;
    color: #ff476f;
    font-weight: bold;
    font-size: 6vw;
    text-align: center;
    top: 12vw;
}


.top-text {
/*    top: 6vw;
    font-size: 7vw;
    text-align: center;*/
}

.font_title{
width: 10vw;
position: relative;
left: 60px;
}

.pq {
  border-bottom: 1px solid #dedede;
  width: 100%;
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

.carousel-inner img {
        border-radius: 15px; /* 角を丸くする */
        margin: 0 auto;
    }

.carousel-control-prev-icon,
    .carousel-control-next-icon {
        filter: invert(1); /* 白いアイコンを黒に反転 */
    }

.cardall{
width:100%;
margin: 0 auto;
}

.cardchildren {
  display: flex;
  flex-wrap: wrap;
  justify-content:center;
  /*background: blue;*/
}


.crad_size{
  position: relative;
  /*border: 2px solid #aaa;*/
  padding: 0 5px;
}

.card_img{
  position: relative;
}

.card_img img {
  object-fit: contain;
  width:250px;
  height: 250px;
  background:#f5f5f5;
}

.price{
  position: absolute;/*重ねたい子要素にabsolute*/
  top:50%;
  left: 5px;
  background-color: rgba(0, 0, 0, 0.6);
  color: white;
  padding: 5px 10px;
  border-radius: 0 30px 30px 0;
  font-weight: bold;

}



</style>
<div class="img_logo">

	<img src="../kakugari_image/image_logo.jpg">
	<p>フリマサイト<br>―FREE MARKET―</p>

</div>


<br><div class="pq"></div><br>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">

	<ol class="carousel-indicators">
<li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
<li data-target="#carouselExampleControls" data-slide-to="1"></li>
<li data-target="#carouselExampleControls" data-slide-to="2"></li>
<li data-target="#carouselExampleControls" data-slide-to="3"></li>
</ol>

 <div class="carousel-inner">
    <div class="carousel-item active">
        <a href="http://localhost:8080/kakugari3/main_kakugari/coupon1.jsp">
            <img class="d-block w-75 rounded" src="../kakugari_image/クーポン1.jpg" alt="Image 1">
        </a>
    </div>
    <div class="carousel-item">
        <a href="https://www.dmm.co.jp/age_check/">
            <img class="d-block w-75 rounded" src="../kakugari_image/初回限定.jpg" alt="Image 2">
        </a>
    </div>
    <div class="carousel-item">
        <a href="https://aespa-official.jp/">
            <img class="d-block w-75 rounded" src="../kakugari_image/送料無料.jpg" alt="Image 3">
        </a>
    </div>
    <div class="carousel-item">
        <a href="https://ponpon.in/">
            <img class="d-block w-75 rounded" src="../kakugari_image/招待コード.jpg" alt="Image 4">
        </a>
    </div>
</div>

    <!-- 前後のコントローラー -->
<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
<span class="carousel-control-prev-icon" aria-hidden="true"></span>
<span class="sr-only">Previous</span>
</a>
<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
<span class="carousel-control-next-icon" aria-hidden="true"></span>
<span class="sr-only">Next</span>
</a>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</div>

<br><div class="pq"></div><br>

<div class="font_title">
<h2><font color="#4f4f4f">ALL</font></h2>
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

<br><div class="pq"></div><br>

<div class="cardall">
<div class="cardchildren">
<!-- カードの数に応じてこの .col を5つ繰り返してください -->
<c:forEach var="p" items="${all}">
<div class="card_img">
<div class="crad_size">
<a href="../kakugari/product?item_id=${p.getItem_id()}"><img src="${p.getImage_data()}"  alt="商品画像"></a>
</div>
<div class="card-body">
<p class="price">¥${p.getItem_price()}</p>
<p class="card-text">${p.getItem_name()}</p>
</div>
</div>
</c:forEach>
</div>
</div>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />