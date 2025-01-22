<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />



<style>
        .completion-container {
            margin-top: 50px;
            text-align: center;
        }
        .completion-container h1 {
            font-size: 2.5rem;
            color: #28a745;
        }
        .completion-container p {
            font-size: 1.2rem;
        }
        .btn-custom {
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>

    <div class="container completion-container">
        <h1>出品が完了しました！</h1>
        <p>ご出品いただきありがとうございます。</p>
        <p>商品ページを確認するには、以下のボタンをクリックしてください。</p>
        <a href="../kakugari/product?item_id=${ItemId}" class="btn btn-custom btn-lg">商品ページを見る</a>
        <p class="mt-4">他の商品を出品する場合は、<a href="../main_kakugari/all">こちら</a>をクリックしてください。</p>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>