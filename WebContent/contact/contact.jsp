<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<html>
<head>
    <title>メール送信フォーム</title>
</head>
<body>
    <h2>メール送信フォーム</h2>
    <form action="email" method="post">
        受信者: <input type="email" name="recipient" required><br>
        件名: <input type="text" name="subject" required><br>
        本文:<br>
        <textarea name="body" rows="4" cols="50" required></textarea><br>
        <input type="submit" value="送信">
    </form>
</body>
</html>