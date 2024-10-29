<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>お問い合わせフォーム</title>
</head>
<body>
<h2>お問い合わせフォーム</h2>
<!-- エラーメッセージの表示 -->
<c:if test="${not empty error}">
<p style="color:red;">${error}</p>
</c:if>
<form action="confirm.jsp" method="post">
       お名前: <input type="text" name="subject" required><br>
       送信確認用メール: <input type="email" name="recipient" required><br>
       お問い合わせ内容:<br>
<textarea name="body" rows="4" cols="50" required></textarea><br>
<!-- 利用規約のチェックボックス -->
<label>
<input type="checkbox" id="terms" name="terms" required>
<a href="terms.jsp" target="_blank">利用規約</a>に同意する
</label><br><br>
<input type="submit" value="確認">
</form>
</body>
</html>