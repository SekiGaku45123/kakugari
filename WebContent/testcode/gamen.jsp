<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

.parent {
  display: grid;
  grid-template-columns: 1fr 3fr; /* 左側1、右側3の割合 */
  align-items: start;
}

.left {
  border: solid 2px #cccccc;
  position: sticky;
  top: 20px; /* 親要素内で画像を20px下に固定 */
  left: 0; /* 必要に応じて左に配置 */
  z-index: 10; /* 重なり順序を調整 */
}

.right {
  padding-left: 20px;
}
</style>

<div class="parent">
  <div class="left">
    <img src="../images/おーたに.jpg" alt="Sticky Image">
  </div>
  <div class="right">
    <br><br><br>aosifvnjaamsifhoua<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <p>Content goes here...</p>
    <!-- たくさんのコンテンツ -->
  </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>