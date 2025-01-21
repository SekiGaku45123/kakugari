<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お問い合わせフォーム - カクガリ</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css">
<c:import url="/common/base.jsp" /> <!-- base.jspをインクルード -->
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
      text-align: left; /* 左揃え */
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
  form {
      text-align: center; /* 確認ボタンのみ中央揃え */
  }
  input[type="submit"] {
      display: inline-block;
      background-color: #0056b3;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      margin-top: 15px; /* 上部に余白を追加 */
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
  /* メインメニューリンク */
  .return-link {
      display: inline-block;
      margin: 40px 0 0 0; /* 上部マージン */
      padding: 10px 20px;
      color: #fff; /* 文字色を白に設定 */
      background-color: #0056b3; /* 緑ベース */
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease, transform 0.2s ease; /* ホバー時の動き */
  }
  .return-link:hover {
       background: #0056b3;
       color: white;
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
<input type="text" id="subject" name="subject" value="${param.subject}" required>
</div>
<div class="form-group">
<label for="recipient">送信確認用メール:</label>
<input type="email" id="recipient" name="recipient" value="${param.recipient}" required>
</div>
<div class="form-group">
<label for="body">お問い合わせ内容:</label>
<textarea id="body" name="body" rows="4" required>${param.body}</textarea>
</div>
<!-- よくある質問へのリンク -->
<p class="link"><a href="faq.jsp" target="_blank">よくある質問</a></p>
<input type="submit" value="確認">
</form>
</body>
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">トップページに戻る</a></p>
</div>
<jsp:include page="/footer.html" />