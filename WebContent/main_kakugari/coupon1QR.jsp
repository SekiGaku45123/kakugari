<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, java.net.URLEncoder" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LINE QRコード</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 30px 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 400px;
        }
        .container img {
            width: 60%; /* 画像の幅を調整 */
            max-width: 240px; /* 画像が大きすぎないよう制限 */
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            font-size: 20px;
            color: #333;
            margin: 15px 0;
            font-weight: bold;
            letter-spacing: 1px;
        }
        .container p {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
            margin-top: 10px;
        }
        /* 下部の軽い装飾 */
        .container::after {
            content: '';
            display: block;
            width: 50px;
            height: 4px;
            background: #4caf50;
            margin: 15px auto 0;
            border-radius: 2px;
        }
        .btn-container {
            margin-top: 20px;
            text-align: center;
        }
        .btn {
            display: inline-block;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 14px;
            font-weight: bold;
            color: white;
            background-color: #4caf50;
            border-radius: 6px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }
        .btn:hover {
            background-color: #43a047;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }
        .btn:active {
            background-color: #388e3c;
            box-shadow: none;
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="../kakugari_image/ラインQR.jpg" alt="LINE QRコード">
        <h2>QRコードをスキャンすると<br>LINEの友だちに追加されます</h2>
        <p>LINEアプリを起動し、<br>コードリーダーからスキャンしてください。</p>
        <div class="btn-container">
            <a href="../main_kakugari/coupon1.jsp" class="btn">クーポン詳細に戻る</a>
        </div>
    </div>
</body>
</html>
