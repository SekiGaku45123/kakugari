<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>お問い合わせ内容確認</title>
</head>
<body>
<h2>お問い合わせ内容確認</h2>
<%
       String subject = request.getParameter("subject");
       String recipient = request.getParameter("recipient");
       String body = request.getParameter("body");
       if (body.contains("死")) {
           request.setAttribute("error", "不適切な言葉が含まれています。");
           request.getRequestDispatcher("contact.jsp").forward(request, response);
       } else {
   %>
<p>お名前: <%= subject %></p>
<p>送信確認用メール: <%= recipient %></p>
<p>お問い合わせ内容:<br><%= body %></p>
<form action="email" method="post">
<input type="hidden" name="subject" value="<%= subject %>">
<input type="hidden" name="recipient" value="<%= recipient %>">
<input type="hidden" name="body" value="<%= body %>">
<input type="submit" value="確認完了">
</form>
<% } %>
</body>
</html>