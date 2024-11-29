<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>コメントを入力してください</title>
</head>
<body>
<h2>コメントを入力してください</h2>
<form action="saveComment.jsp" method="post">
<!-- アイテムIDとユーザーIDをフォームで送信 -->
<input type="hidden" name="item_id" value="<%= request.getParameter("item_id") %>">
<input type="hidden" name="user_id" value="<%= request.getParameter("user_id") %>">
<textarea name="comment" rows="5" cols="40"></textarea><br>
<input type="submit" value="コメントを保存">
</form>
</body>
</html>