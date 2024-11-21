<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList, java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>クーポン詳細 - カクガリ</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <c:import url="/common/base.jsp" />
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Noto Sans JP', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
        h2 {
            font-size: 1.4rem;
            margin-top: 30px;
            margin-bottom: 10px;
            color: #555;
            border-bottom: 2px solid #e9ecef;
            padding-bottom: 5px;
        }
        .details, .notice {
            margin-top: 15px;
            line-height: 1.8;
            color: #666;
        }
        .highlight {
            color: #d9534f;
            font-weight: bold;
        }
        .btn-primary, .btn-secondary {
            font-size: 1rem;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .list-group-item {
            border: none;
            padding: 10px 0;
        }
        .list-group-item:not(:last-child) {
            border-bottom: 1px solid #e9ecef;
        }
        footer {
            margin-top: 40px;
            text-align: center;
            color: #777;
            font-size: 0.9rem;
        }
        footer a {
            color: #007bff;
            text-decoration: none;
        }
        footer a:hover {
            text-decoration: underline;
        }
        /* LINE QRボタンのスタイル */
        .btn-lineqr {
            background-color: #d9534f;
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            display: inline-block;
        }
        .btn-lineqr:hover {
            background-color: #c9302c;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }
        .btn-lineqr:active {
            background-color: #ac2925;
            box-shadow: none;
            transform: translateY(0);
        }
        .d-flex {
            display: flex;
        }
        .justify-content-center {
            justify-content: center;
        }
        .gap-3 {
            gap: 1rem;
        }
        .flex-wrap {
            flex-wrap: wrap;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="../kakugari_image/クーポン1.jpg" alt="カクガリカード" style="width: 100%; height: auto; margin-bottom: 20px;">
        <h1>クーポン詳細情報</h1>
        <p class="details">これからもお買い物を促進するキャンペーンを予定しています。詳細は以下をご覧ください。</p>
        <h2>クーポン概要</h2>
        <ul class="list-group">
            <li class="list-group-item"><span class="highlight">割引率：</span>5%</li>
            <li class="list-group-item"><span class="highlight">有効期限：</span>クーポン付与日を含む7日目の23:59まで</li>
            <li class="list-group-item"><span class="highlight">対象カテゴリ：</span>すべてのカテゴリ（カクガリストアを含む）</li>
            <li class="list-group-item"><span class="highlight">最大割引額：</span>200円</li>
            <li class="list-group-item"><span class="highlight">使用回数：</span>1回限り</li>
        </ul>
        <h2>クーポン配布期間</h2>
        <p class="details">
            1.「はじめてのID連携でもらえるクーポン」常時実施中<br>
            2.「毎月もらえるクーポン」<br>
            <span class="highlight">2024/11/21（木）12:00 ～ 11/28（木）11:59</span><br>
            ※以降の配布スケジュールは随時更新されます。
        </p>
        <h2>クーポン付与の条件</h2>
        <p class="details">
            <ul>
                <li>カクガリLINE公式アカウントに友だち追加</li>
                <li>カクガリとLINEのID連携を完了</li>
                <li>ID連携済みの方には翌日クーポン付与</li>
            </ul>
        </p>
        <h2>注意事項</h2>
        <p class="notice">
            <ul>
                <li>クーポン付与にはカクガリのアカウントが必要です。</li>
                <li>ID連携解除後に再度連携した場合、クーポンは付与されません。</li>
                <li>不正行為が確認された場合、クーポンは無効化されます。</li>
                <li>本キャンペーンは予告なく変更・中止する場合があります。</li>
            </ul>
        </p>
        <div class="text-center" style="margin-top: 30px;">
            <div class="d-flex justify-content-center gap-3 flex-wrap">
                <a href="../main_kakugari/all" class="btn btn-secondary">トップページに戻る</a>
                <a href="../main_kakugari/coupon1QR.jsp" class="btn btn-lineqr">LINEアプリで友達追加</a>
            </div>
        </div>
    </div>
    <jsp:include page="/footer.html" />
</body>
</html>
