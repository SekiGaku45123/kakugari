<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />

<c:import url="/common/base.jsp">
</c:import>


<style>
.main_search{
	display: grid;
	grid-template-columns: 25% 75%;
	padding: 0 2vw;

}
.narrow_down{
	background: red;
	padding:0 10px;
}

.search_list{
	text-align:center;
  	padding:0 0 20px 8px;

}

.kakaka{
	max-width: 19%;
	display: grid;
	grid-template-columns: repeat(5, 100%);
	column-gap: 5%;
	row-gap: 40px;
	position: relative;
}

.imggmi{
	position: relative;
	width:12vw;
	height: 12vw;
}

.imggmi img{
	border-radius: 5px 5px 5px 5px;
	object-fit: cover;
	width:100%;
	height: 100%;
	background:Yellow;
}

.imggmi p {
  collar:#8f8d8d;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 2; /* 2行で切り捨て */
  line-clamp: 2;
}



</style>

<div class="main_search">
	<div class="narrow_down">
		<span>絞り込む</span>
		<details>
		  <summary>カテゴリー</summary>
		  折りたたまれている部分です。
		</details>
		<details>
		  <summary>販売状況</summary>
		  折りたたまれている部分です。
		</details>
		<details>
		  <summary>商品状態</summary>
		  折りたたまれている部分です。
		</details>
		<details>
		  <summary>価格</summary>
		  折りたたまれている部分です。
		</details>



	</div>
	<div class="search_list">
		<div class="kakaka">
		<c:forEach var="p" items="${search}">
			<div class="imggmi">
			<img src="${p.getImage_data()}">
			<p>${p.getItem_name()}</p>
			</div>

		</c:forEach>
		</div>

	</div>




</div>



<br><br><br><br><br><br><br><br><br>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />
