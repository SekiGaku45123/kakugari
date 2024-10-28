<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>

<c:import url="/common/base.jsp">
</c:import>
<style>
.imgagess{
  position: relative;
}
.imgagess img {
  background-color: #f0f0f0;
  width: 100%;
  border-radius: 10px 5px 5px 5px;
  object-fit: contain;
}
.imgagess p {
  color: #ffffff; /* 文字色 */
  font-size: 24px; /* 文字の大きさ */
  position: absolute;
  background-color: rgba(0, 0, 0, 0.5);
  border-radius: 10px 20px 20px 0;
  padding: 0 5% 0 0;
  font-weight: 900;
  left: 0;
  top: 0;
}



</style>
	<div class="container text-center">
		<div class="row grid gap-1">
				<c:forEach var="p" items="${all}">
			<div class="col-6 col-lg-3 p-1 g-col-6 ">
			<div class="imgagess">
					<a href="../main_kakugari/syousai.jsp?User=${p.getUser_id()}&Image=${p.getImage_data()}&Name=${p.getItem_name()}&Detail=${p.getItem_detail()}&price=${p.getItem_price()}&Cate=${p.getCategory()}&Cond=${p.getCondition()}&Area=${p.getArea()}&Ship=${p.getShipping_days()}&flag=${p.getFlag()}"><img src="${p.getImage_data()}" width="200" height="200"></a>
    					<p>￥ ${p.getItem_price() }</p>
  					</div>


					${p.getItem_name() }
			</div>
				</c:forEach>
		</div>
	</div>