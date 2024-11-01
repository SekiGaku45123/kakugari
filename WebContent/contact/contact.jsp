<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>お問い合わせフォーム</title>
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
       .form-container {
           max-width: 600px;
           margin: 0 auto;
           background: #fff;
           border-radius: 8px;
           box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
           padding: 20px;
       }
       .form-group {
           margin-bottom: 15px;
       }
       label {
           display: block;
           margin-bottom: 5px;
       }
       input[type="text"], input[type="email"], textarea {
           width: 100%;
           padding: 10px;
           border: 1px solid #ccc;
           border-radius: 5px;
       }
       input[type="checkbox"] {
           margin-right: 10px;
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
       .error-message {
           color: red;
           text-align: center;
       }
       .link {
           display: block;
           margin-top: 10px;
           text-align: center;
       }
       a {
           color: #0056b3;
           text-decoration: none;
       }
       a:hover {
           text-decoration: underline;
       }
</style>
</head>
<body>
<h2>お問い合わせフォーム</h2>
<div class="form-container">
<!-- エラーメッセージの表示 -->
<c:if test="${not empty error}">
<p class="error-message">${error}</p>
</c:if>
<form action="confirm.jsp" method="post">
<div class="form-group">
<label for="subject">お名前:</label>
<input type="text" id="subject" name="subject" required>
</div>
<div class="form-group">
<label for="recipient">送信確認用メール:</label>
<input type="email" id="recipient" name="recipient" required>
</div>
<div class="form-group">
<label for="body">お問い合わせ内容:</label>
<textarea id="body" name="body" rows="4" required></textarea>
</div>
<!-- よくある質問へのリンク -->
<p class="link"><a href="faq.jsp" target="_blank">よくある質問</a></p>
<!-- 利用規約のチェックボックス -->
<div class="form-group">
<label>
<input type="checkbox" id="terms" name="terms" required>
<a href="terms.jsp" target="_blank">利用規約</a>に同意する
</label>
</div>
<input type="submit" value="確認">
</form>
</div>
</body>
</html>