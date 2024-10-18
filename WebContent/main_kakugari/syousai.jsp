<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>

<c:import url="/common/base.jsp">
</c:import>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ホロライブ EXPO 2024 常闇トワ 色紙</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .product-image {
      max-width: 100%;
      height: auto;
    }
    .price {
      font-size: 1.5rem;
      font-weight: bold;
    }
    .buy-button {
      background-color: #ff4d4f;
      color: white;
      font-size: 1.2rem;
    }
    .buy-button:hover {
      background-color: #ff6666;
    }
    .favorite-button {
      background-color: #f0ad4e;
      color: white;
      border: none;
    }
    .favorite-button.favorited {
      background-color: #ffc107;
      color: white;
    }
  </style>
</head>
<body>

  <div class="container mt-5">
    <div class="row">
      <!-- 左側：商品画像 -->
      <div class="col-md-6">
        <img src="https://via.placeholder.com/300" alt="商品画像" class="product-image">
      </div>

      <!-- 右側：商品詳細 -->
      <div class="col-md-6">
        <h1>ホロライブ EXPO 2024 常闇トワ 色紙</h1>
        <p class="price">￥1,350（税込・送料込み）</p>
        <p>ホロライブ EXPO 2024 の常闇トワの色紙です。</p>

        <!-- ボタン群 -->
        <div class="d-grid gap-2">
          <button class="btn btn-primary buy-button">購入手続きへ</button>
        </div>

        <!-- お気に入り機能 -->
        <div class="mt-3">
          <button id="favoriteButton" class="btn favorite-button">お気に入りに追加</button>
        </div>

  </div>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
