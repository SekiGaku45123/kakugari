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
  width: 100%; /* divの幅に対する割合 */
}
.imgagess p {
  color: #ffffff; /* 文字色 */
  font-size: 24px; /* 文字の大きさ */
  position: absolute;
  background-color: rgba(0, 0, 0, 0.5);
  border-radius: 0 20px 20px 0;
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
					<a href="../main_kakugari/1.jsp"><img src="${p.getImage_data()}" width="200" height="200"></a>
    					<p>￥ ${p.getItem_price() }</p>
  					</div>

					${p.getItem_name() }
			</div>
				</c:forEach>
		</div>
	</div>