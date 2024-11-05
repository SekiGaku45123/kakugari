<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>お問い合わせ送信完了</title>
<style>
       /* 背景と全体のレイアウト */
       body {
           font-family: Arial, sans-serif;
           background-color: #f5f5f5;
           color: #333;
           margin: 0;
           display: flex;
           justify-content: center;
           align-items: center;
           height: 100vh;
       }
       /* コンテナ */
       .container {
           background-color: #fff;
           padding: 20px 30px;
           border-radius: 8px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           max-width: 500px;
           text-align: center;
       }
       /* タイトル */
       h2 {
           color: #1E90FF; /* 鮮やかな青 */
           font-size: 24px;
           margin-bottom: 10px;
       }
       /* メッセージ */
       p {
           font-size: 16px;
           line-height: 1.6;
           margin: 10px 0;
           color: #4682B4; /* 柔らかい青 */
       }
       /* 送信内容 */
       .content-info {
           font-weight: bold;
           color: #5A9BD3; /* 少し濃いめの青 */
           margin-bottom: 20px;
       }
       /* メインメニューリンク */
       .return-link {
           display: inline-block;
           margin-top: 20px;
           padding: 10px 20px;
           color: #fff;
           background-color: #1E90FF;
           text-decoration: none;
           border-radius: 5px;
           transition: background-color 0.3s ease;
       }
       .return-link:hover {
           background-color: #1C86EE;
       }
</style>
</head>
<body>
<div class="container">
<h2>お問い合わせありがとうございます！</h2>
<p>以下の内容でお問い合わせを受け付けました。</p>
<div class="content-info">
<p>名前: ${name}</p>
<p>返信先メールアドレス: ${email}</p>
<p>お問い合わせ内容: ${message}</p>
</div>
<!-- メインメニューに戻るリンク -->
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">メインメニューに戻る</a></p>
</div>
</body>
</html>