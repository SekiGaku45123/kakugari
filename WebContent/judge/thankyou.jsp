<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>送信完了</title>
<style>
       body {
           margin: 0;
           padding: 0;
           font-family: 'Arial', sans-serif;
           background-color: #f9f9f9;
           display: flex;
           justify-content: center;
           align-items: center;
           min-height: 100vh;
       }
       .container {
           background: #ffffff;
           padding: 20px 30px;
           border-radius: 10px;
           box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
           text-align: center;
           max-width: 400px;
           width: 100%;
       }
       h1 {
           font-size: 24px;
           color: #333333;
           margin-bottom: 20px;
       }
       p {
           font-size: 16px;
           color: #555555;
           margin-bottom: 20px;
           line-height: 1.5;
       }
       a.return-link {
           display: inline-block;
           margin-top: 20px;
           padding: 10px 20px;
           background-color: #4CAF50;
           color: white;
           text-decoration: none;
           border-radius: 5px;
           font-size: 16px;
           transition: background-color 0.3s ease;
       }
       a.return-link:hover {
           background-color: #45a049;
       }
</style>
</head>
<body>
<div class="container">
<h1>評価完了🤲</h1>
<p>評価を送信いただき、ありがとうございます。</p>
<p>これからもご利用をお待ちしております。</p>
<!-- メインメニューに戻るリンク -->
<a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">メインメニューに戻る</a>
</div>
</body>
</html>