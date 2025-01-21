<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@ include file="../common/base.jsp" %>



<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ログアウト完了 - カクガリ</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 600px;
            margin: 10% auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .message {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .btn-container a {
            display: inline-block;
            margin: 10px 0;
            padding: 10px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            color: #ffffff;
            background-color: #007bff;
        }

        .btn-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <p class="message">ログアウトが完了しました。</p>
        <p>またのご利用をお待ちしております。</p>
        <div class="btn-container">
            <a href="../main_kakugari/all">トップページに戻る</a>
        </div>
    </div>
</body>
</html>
<jsp:include page="/footer.html" />
