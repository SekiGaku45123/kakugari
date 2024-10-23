<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>お問い合わせフォーム</title>
</head>
<body>
<h2>お問い合わせフォーム</h2>
<form action="contact" method="post">
<label for="name">名前:</label><br>
<input type="text" id="name" name="name" required><br><br>
<label for="email">返信先メールアドレス:</label><br>
<input type="email" id="email" name="email" required><br><br>
<label for="message">お問い合わせ内容:</label><br>
<textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>
<!-- 利用規約のチェックボックス -->
<label>
<input type="checkbox" id="terms" name="terms" required>
<a href="terms.jsp" target="_blank">利用規約</a>に同意する
</label><br><br>
<input type="submit" value="送信">
</form>
</body>
</html>