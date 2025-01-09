<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
  <title>画像ギャラリー</title>
  <style>
    .gallery {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    .gallery input[type="radio"] {
      display: none;
    }

    .gallery img {
      max-width: 300px;
      display: none;
    }

    .gallery input[type="radio"]:checked + label + img {
      display: block;
    }

    .thumbnails {
      display: flex;
      gap: 10px;
      margin-top: 10px;
    }

    .thumbnails label {
      cursor: pointer;
      border: 2px solid transparent;
      padding: 5px;
      transition: border 0.3s;
    }

    .thumbnails label:hover {
      border-color: #007bff;
    }
  </style>
</head>
<body>
  <div class="gallery">
    <!-- 画像1 -->
    <input type="radio" id="img1" name="gallery" checked>
    <label for="img1"><img src="CRAZY.jpg" alt="サムネイル1" width="50"></label>
    <img src="風呂.jpg" alt="画像1">

    <!-- 画像2 -->
    <input type="radio" id="img2" name="gallery">
    <label for="img2"><img src="EASY.jpg" alt="サムネイル2" width="50"></label>
    <img src="ちーかわ.jpg" alt="画像2">

    <!-- 画像3 -->
    <input type="radio" id="img3" name="gallery">
    <label for="img3"><img src="FEARLESS.jpg" alt="サムネイル3" width="50"></label>
    <img src="ニンニン.jpg" alt="画像3">

    <!-- サムネイル -->
    <div class="thumbnails">
      <label for="img1"><img src="CRAZY.jpg" alt="サムネイル1"></label>
      <label for="img2"><img src="EASY.jpg" alt="サムネイル2"></label>
      <label for="img3"><img src="FEARLESS.jpg" alt="サムネイル3"></label>
    </div>
  </div>
</body>
</html>
