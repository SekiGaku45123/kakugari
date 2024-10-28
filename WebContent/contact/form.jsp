<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>お問い合わせ送信完了</title>
</head>
<body>
<h2>お問い合わせありがとうございます！</h2>
<p>以下の内容でお問い合わせを受け付けました。</p>
<p>名前: ${name}</p>
<p>返信先メールアドレス: ${email}</p>
<p>お問い合わせ内容: ${message}</p>
<!-- メインメニューに戻るリンク -->
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">メインメニューに戻る</a></p>
</body>
</html>