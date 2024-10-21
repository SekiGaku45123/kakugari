<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/common/base.jsp"></c:import>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品詳細</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .col-md-6 {

      max-width: 850px;
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
        <!-- 商品の画像を表示 (item.item_detail に画像URLまたはデータが格納される) -->

        <img src="<%String Image=request.getParameter("Image"); %><%=Image %>" alt="商品画像" class="product-image">
      </div>

      <!-- 右側：商品詳細 -->
      <div class="col-md-6">
        <!-- 商品IDや名前などの情報 -->

        <h1>商品:<%String Name=request.getParameter("Name"); %><%=Name %></h1>
        <p class="price">￥<%String price=request.getParameter("price"); %><%=price %>（税込・送料込み）</p>
        <p>詳細:<br><%String Detail=request.getParameter("Detail"); %><%=Detail %></p>

        <!-- 購入ボタン -->
        <div class="d-grid gap-2">
          <button class="btn btn-primary buy-button">購入手続きへ</button>
        </div>

        <!-- お気に入り機能 -->
        <div class="mt-3">
          <!-- 商品IDを送信するフォーム -->
          <form action="${pageContext.request.contextPath}/kakugari/FavoriteAddAction" method="post">
            <input type="hidden" name="id" value="${item.item_id}">
            <button type="submit" class="btn favorite-button">お気に入りに追加</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
