<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>

こんにちは、${customer.getUser_name()}さん。

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />
