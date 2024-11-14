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
	column-gap: 5px;
	padding: 0 5vw;

}
.narrow_down{
	border:solid 2px #cccccc;
	border-radius: 10px 0 0 10px;
	padding:0 10px;
}

.search_list{
	border:solid 2px #cccccc;
	text-align:center;
  	padding:10px 0 25px 8px;
  	border-radius: 0 10px 10px 0;

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

.underline{
	font-weight: 700;
	margin: 10px 0;
}

.custom-details summary {
  list-style: none; /* デフォルトの三角アイコンを非表示にする */
  cursor: pointer; /* カーソルをポインタにする */
  position: relative;
  padding-right: 1.5em; /* アイコン用のスペースを確保 */
  height: 50px;
  line-height: 50px;
  font-weight: 700;
  padding-left: 10px;
}

.underline_no{
	border-bottom: 1px solid #cccccc;
}

.custom-details summary::after{
	content: "+"; /* 閉じた状態のアイコン */
	position: absolute;
	right: 10px; /* アイコンを右端に表示 */
	font-size: 1.2em;
	color: #333;

}

.custom-details[open] summary::after {
  content: "-"; /* 開いた状態のアイコン */
}

.custom-details summary:hover {
  background-color: #f5f5f5;
  border-radius: 10px 10px 10px 10px;
}

.pet-select{
	width:100%;
	padding: 10px 0;
	margin: 0 0 10px 0;
	border-radius: 5px 5px 5px 5px;
}

select .fontcollarr{
    color: red; /* セレクトボックス全体のフォントカラーを変更 */
}

</style>



<div class="main_search">
	<div class="narrow_down">
		<div class="underline"><font color="#666666">絞り込む</font></div>
		<div class="underline_no"></div>
		<details class="custom-details">
		  <summary>カテゴリー</summary>
			<select name="pets" class="pet-select">
			  <option value="" class="fontcollarr">すべて</option>
			  <option value="dog">あ</option>
			  <option value="cat">い</option>
			  <option value="hamster">う</option>
			  <option value="parrot">え</option>
			  <option value="spider">お</option>
			</select>
		</details>
		<div class="underline_no"></div>
		<details class="custom-details">
		  <summary>販売状況</summary>
		  折りたたまれている部分です。
		</details>
		<div class="underline_no"></div>
		<details class="custom-details">
		  <summary>商品状態</summary>
		  折りたたまれている部分です。
		</details>
		<div class="underline_no"></div>
		<details class="custom-details">
		  <summary>価格</summary>
		  折りたたまれている部分です。
		</details>
		<div class="underline_no"></div>



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
