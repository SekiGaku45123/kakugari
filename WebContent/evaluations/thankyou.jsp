<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>取引完了</title>
<style>
       body {
           font-family: Arial, sans-serif;
           background-color: #f9f9f9;
           display: flex;
           justify-content: center;
           align-items: center;
           height: 100vh;
           margin: 0;
       }
       .thankyou-container {
           text-align: center;
           background: #fff;
           padding: 30px;
           border-radius: 12px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           max-width: 400px;
           width: 90%;
       }
       .thankyou-message {
           font-size: 20px;
           color: #333;
           line-height: 1.6;
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
</style>
</head>
<body>
<div class="thankyou-container">
<div class="thankyou-message">
       評価ありがとうございました！<br>
       これで取引は完了です！<br>
       引き続きお買い物をお楽しみください！
</div>
<!-- メインメニューに戻るリンク -->
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">メインメニューに戻る</a></p>
</div>
</body>
</html>