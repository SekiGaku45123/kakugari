<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />

<c:import url="/common/base.jsp">
</c:import>


<style>
.main_search{
	background: #f5f5f5;
	display: grid;
	grid-template-columns: 30% 70%;
	padding: 0 2vw;

}
.narrow_down{
	background: red;
	text-align:center;
  	padding:20px 0;
}

.search_list{
	background: blue;
	text-align:center;
  	padding:20px 0 20px 8px;

}

.kakaka{
	max-width: 19%;
	max-right: 19%;
	display: grid;
	grid-template-columns: repeat(5, 100%);
	column-gap: 5%;
	row-gap: 15px;
}

.kakaka div{
	background: yellow;
	width: 100%;
  	padding-top: 100%;

</style>

<div class="main_search">
<div class="narrow_down">
<span>絞り込む</span>


	</div>
<div class="search_list">
<div class="kakaka">
<c:forEach var="p" items="${search}">
<div>${p.getItem_name()}</div>
</c:forEach>
</div>

	</div>



</div>


<br><br><br><br><br><br><br><br><br>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />
