<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
<title>お問い合わせ送信完了</title>
<link rel="stylesheet" type="text/css" href="style.css"> <!-- CSSファイルをリンク -->
</head>
<body>
<h2>お問い合わせありがとうございます！</h2>
<p>以下の内容でお問い合わせを受け付けました。</p>
<p>名前: ${name}</p>
<p>返信先メールアドレス: ${email}</p>
<p>お問い合わせ内容: ${message}</p>
<!-- メインメニューに戻るボタン -->
<form action="All" method="get">
<button type="submit">メインメニューに戻る</button>
</form>
</body>
</html>