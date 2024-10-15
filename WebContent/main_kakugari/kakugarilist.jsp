<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="p" items="${all}">

	${p.getItem_id() }:${p.getUser_id() }:${p.getItem_price() }:${p.getCategory() }:${p.getItem_detail() }:${p.getCondition() }:${p.getArea() }:${p.getShipping_days() }:${p.getFlag() }
<br>

</c:forEach>

<%@include file="../footer.html" %>