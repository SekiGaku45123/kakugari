<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>お問い合わせ内容確認</title>
<style>
       body {
           font-family: Arial, sans-serif;
           background-color: #f9f9f9;
           color: #333;
           margin: 0;
           padding: 20px;
       }
       h2 {
           text-align: center;
           color: #0056b3;
       }
       .confirm-container {
           max-width: 600px;
           margin: 0 auto;
           background: #fff;
           border-radius: 8px;
           box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
           padding: 20px;
       }
       .confirm-details {
           margin-bottom: 20px;
       }
       .button-group {
           display: flex;
           justify-content: space-between;
       }
       input[type="submit"] {
           background-color: #0056b3;
           color: white;
           padding: 10px 15px;
           border: none;
           border-radius: 5px;
           cursor: pointer;
           font-size: 16px;
       }
       input[type="submit"]:hover {
           background-color: #004494;
       }
</style>
</head>
<body>
<h2>お問い合わせ内容確認</h2>
<div class="confirm-container">
<%
           String subject = request.getParameter("subject");
           String recipient = request.getParameter("recipient");
           String body = request.getParameter("body");
           if (body.contains("死")) {
               request.setAttribute("error", "不適切な言葉が含まれています。");
               request.getRequestDispatcher("contact.jsp").forward(request, response);
           } else {
       %>
<div class="confirm-details">
<p><strong>お名前:</strong> <%= subject %></p>
<p><strong>送信確認用メール:</strong> <%= recipient %></p>
<p><strong>お問い合わせ内容:</strong><br><%= body %></p>
</div>
<div class="button-group">
<form action="email" method="post">
<input type="hidden" name="subject" value="<%= subject %>">
<input type="hidden" name="recipient" value="<%= recipient %>">
<input type="hidden" name="body" value="<%= body %>">
<input type="submit" value="確認完了">
</form>
<!-- 入力しなおすボタン -->
<form action="contact.jsp" method="get">
<input type="submit" value="入力内容を変更">
</form>
</div>
<%
           }
       %>
</div>
</body>
</html>
