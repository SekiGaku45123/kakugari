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

  .mozi {
  font-size: 30px;
  font-weight: 900;
}

.pq {
  border-bottom: 1px solid #dedede;
}

.taitoru {
  display:inline-block;
  font-size: 20px;
  font-weight: 900;
  color:#7d7d7d;
  margin: 10px 0;
}


	@media screen and (min-width: 960px) {
  .oya {
    border: 2px dotted red;
    position: relative; /* 親要素を相対位置に設定 */
    display: flex; /* フレックスボックスを使用 */
    justify-content: center; /* 中央揃え */
    align-items: flex-start; /* 上揃え */
    max-width: 80%; /* 幅を80%に設定 */
    height: 80%;
    margin: 0 auto; /* 中央揃え */
}

.product-image {
    position: fixed; /* ビューポートに対して固定 */
    top:149px; /* ビューポートの底に配置 */
    left: 15%; /* ビューポートの左から15%の位置に配置 */
    border: 2px dotted blue;
    border-radius: 10px; /* 角を丸める */
}

  .product-image img {
   width: 37vw;
   height: 37vw;
   background: #f5f5f5;
   object-fit: contain;
  }

  .tkst {
    border:2px dotted green;
    width: 30vw;
    /*height: ;*/
    margin-left: 62%;
    padding: 0 0 0px 0;

    /*スクロールバー非表示*/
    -ms-overflow-style: none;
     scrollbar-width: none;
  }

  .kounyu {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.kounyu button {
  color: white;
  font-weight: 900;
  width: 30vw;
  border-radius: 5px;
  background: #ff8d02;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
}

.okini{
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.okini button{
  color: white;
  font-weight: 900;
  width: 30vw;
  border-radius: 5px;
  background: #4d9dff;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
}
}

@media screen and (max-width: 959px) {
  .oya {
    flex-direction: column;
    align-items: center;
  }

  .product-image {
     position: relative;
  }

  .product-image img{
  width: 100vw;
  height: 100vw;
  background: #f5f5f5;
  object-fit: contain;
  }


  .tkst {
    /*border:2px dotted blue;*/
    width: 90%;
    max-width: 600px;
    padding: 5px;
    box-sizing: border-box;
    margin: 20px auto 0;
 }

 .kounyu {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.kounyu button {
  color: white;
  font-weight: 900;
  width: 30em;
  border-radius: 5px;
  background: #ff8d02;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
}

.okini{
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.okini button{
  color: white;
  font-weight: 900;
  width: 30em;
  border-radius: 5px;
  background: #4d9dff;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
 }
}
  </style>

</head>
<body>

  <div class="oya">
      <!-- 左側：商品画像 -->
      <div class="product-image">
        <!-- 商品の画像を表示 (item.item_detail に画像URLまたはデータが格納される) -->

        <img src="<%String Image=request.getParameter("Image"); %><%=Image %>" width="700" height="700" alt="商品画像" >
      </div>

      <!-- 右側：商品詳細 -->
       <div class="tkst">
        <!-- 商品IDや名前などの情報 -->

        <h2><%String Name=request.getParameter("Name"); %><%=Name %></h2>
        <p class="pq">￥<%String price=request.getParameter("price"); %><span class="mozi"><%=price %></span>（税込・送料込み）</p>

		<div class="okini">
          <!-- 商品IDを送信するフォーム -->
          <form action="${pageContext.request.contextPath}/kakugari/FavoriteAddAction" method="post">
            <input type="hidden" name="id" value="${item.item_id}">
            <button type="submit">お気に入りに追加</button>
          </form>
        </div>

        <div class="kounyu">
  		 <form action="${pageContext.request.contextPath}/main_kakugari/purchase-in.jsp" method="post">
    	  <input type="hidden" name="item_id" value="${item.item_id}">
    	  <button type="submit">購入手続きへ</button>
	     </form>
        </div>

		<br><div class="pq"></div>

        <p><span class="taitoru">商品詳細</span><br><font color="#7d7d7d"><%String Detail=request.getParameter("Detail"); %><%=Detail %></font></p>

        <p class="pq"><span class="taitoru">商品情報</span></p>
        <p><font color="#7d7d7d"><%String oi=request.getParameter("Detail"); %><%=Detail %></font></p>

      </div>
  </div>
  <div>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>

    <p>noadsofhaouvnouilcrenu.crelibeu</p>
    <p>noadsofhaouvnouilcrenu.crelibeu</p>

    <p>noadsofhaouvnouilcrenu.crelibeu</p>

    <p>noadsofhaouvnouilcrenu.crelibeu</p>

  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

<script>
	const targets = document.querySelectorAll(".tkst");

	document.addEventListener("wheel", function(e){
	  // デフォルトのスクロール動作を防止
	  e.preventDefault();

	  // 各 .tkst 要素をスクロール
	  targets.forEach(target => {
	    target.scrollBy(e.deltaX, e.deltaY);
	  });
	});
</script>



</html>
