<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // セッションからログイン情報を取得
    HttpSession sessions = request.getSession(false);
    boolean isLoggedIn = (session != null && session.getAttribute("customer") != null);
%>

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
  margin: 10px 0 0;
}

.ProductDetails{
  margin: 0 0 10px 0;

}

.ProductDetails_main {
  justify-content: space-between;
  display: flex;
  margin: 20px 0;
}

.ProductDetails_main1 {
  font-size: 15px;
  font-weight: 1000;
  margin: 0;
}

.ProductDetails_exp {
  width: 50%;
}

.user_icon_main {
 display: flex;
 margin: 0 0 17px 0;
}

.user_icon{
  border-radius: 50% 50% 50% 50%;
  /*border: 2px dotted blue;*/
  width: 70px;
  height: 70px;
}

.user_icon img{
  border-radius: 50% 50% 50% 50%;
  object-fit: contain;
  width:100%;
  height:100%;
}

.listing{
  font-weight: 900;
  /*border: 2px dotted red;*/
  width: auto;
  height: 70px;
  text-align:center;
  padding:0 0 0 10px;
  display: flex;
  align-items: center;
  justify-content: center;
}



	@media screen and (min-width: 960px) {
  .oya {
    /*border: 2px dotted red;*/
    position: relative;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    width: max(90%, 960px);
    height: 80%;
    margin: 0 auto;
}

.product-image {
    position: sticky;
    top:145px;
    left: 15%;
    /*border: 2px dotted blue;*/
    border-radius: 10px;
}

  .product-image img {
   width: 37vw;
   height: 37vw;
   background: #f5f5f5;
   object-fit: contain;
  }

  .tkst {
    /*border:2px dotted green;*/
    width: max(30vw, 334px);
    /*height: ;*/
    max-width: 100%;
    margin-left: 100px;
    padding: 0;

    /*スクロールバー非表示*/
    -ms-overflow-style: none;
     scrollbar-width: none;
  }

.botan_mein{
 display: flex;

}

.kounyu {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.kounyu button {
  color: white;
  font-weight: 900;
  width: 20vw;
  border-radius: 5px;
  background: #ff8d02;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
}

.okini{
  display: flex;
  justify-content: center;
  float: right;
  margin-top: 17px;
  justify-content: center;
  border-radius: 10px 10px;

}

.okini button{
  color: #4d9dff;
  border: 2px solid #4d9dff;
  font-weight: 900;
  margin-left: 15px;
  width: 4em;
  border-radius: 5px;
  background: white;
  padding: 10px;
  cursor: pointer;
 }

 .login-comment{
 display: flex;
  justify-content: center;
  margin-top: 10px;

 }
 .login-comment button{
  width: 100%;
  padding: 10px 20px;
  background: white;
  color: #ff8d02;
  font-weight: 900;
  border: 1px solid #ff8d02;
  border-radius: 5px 5px;
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
  width: 98.2vw;
  height: 98.2vw;
  background: #f5f5f5;
  object-fit: contain;
  }


  .tkst {
    /*border:2px dotted blue;*/
    width: 90%;
    padding: 5px;
    box-sizing: border-box;
    margin: 20px auto 0;
 }

.botan_mein{
 display: flex;

}

 .kounyu {
  display: flex;
  justify-content: center;
  margin-top: 10px;

}

.kounyu button {
  color: white;
  font-weight: 900;
  width: 50vw;
  border-radius: 5px;
  background: #ff8d02;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
}


.okini{
  display: flex;
  float: right;
  margin-top: 9px;
  justify-content: center;
  border-radius: 10px 10px;
  /*border: 2px solid #4d9dff;*/

}

.okini button{
  color: #4d9dff;
  border: 2px solid #4d9dff;
  font-weight: 900;
  margin-left: 30px;
  border-radius: 5px;
  background: white;
  padding: 10px 20px;
  cursor: pointer;
 }

 .login-comment{
 display: flex;
  justify-content: center;
  margin-top: 10px;

 }
 .login-comment button{
  width: 100%;
  padding: 10px 20px;
  background: white;
  color: #ff8d02;
  font-weight: 900;
  border: 1px solid #ff8d02;
  border-radius: 5px 5px;
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

		<div class="botan_mein">
	        <div class="kounyu">
	  		 <form action="${pageContext.request.contextPath}/main_kakugari/purchase-in.jsp" method="post">
	    	  <input type="hidden" name="item_id" value="${item.item_id}">
	    	  <button type="submit">購入手続きへ</button>
		     </form>
	        </div>

	        <div class="okini">
	          <!-- 商品IDを送信するフォーム -->
	          <form action="favoriteAddAction" method="post">
	            <input type="hidden" name="item_id" value="<%String Item_id=request.getParameter("Item_id"); %><%=Item_id %>">
	            <input type="hidden" name="user_id" value="<%String User=request.getParameter("User"); %><%=User %>">
	            <button type="submit">♡</button>
	          </form>
	        </div>

	     </div>

		<br><div class="pq"></div>

        <p><span class="taitoru">商品詳細</span><br><font color="#7d7d7d"><%String Detail=request.getParameter("Detail"); %><%=Detail %></font></p>

        <p class="pq"><span class="taitoru">商品情報</span></p>
		<div class="ProductDetails">
		  <div class="ProductDetails_main">
			 <div class="ProductDetails_main1">
			   <span>CATEGORY</span>
			 </div>
			 <div class="ProductDetails_exp">
			   <span><%String Cate=request.getParameter("Cate"); %><%=Cate %></span>
			 </div>
		  </div>
		  <div class="ProductDetails_main">
			 <div class="ProductDetails_main1">
			   <span>CONDITION</span>
			 </div>
			 <div class="ProductDetails_exp">
			   <span><%String Cond=request.getParameter("Cond"); %><%=Cond %></span>
			 </div>
		  </div>
		  <div class="ProductDetails_main">
			 <div class="ProductDetails_main1">
			   <span>AREA</span>
			 </div>
			 <div class="ProductDetails_exp">
			   <span><%String Area=request.getParameter("Area"); %><%=Area %></span>
			 </div>
		  </div>
		  <div class="ProductDetails_main">
			 <div class="ProductDetails_main1">
			   <span>SHOPPING DAYS</span>
			 </div>
			 <div class="ProductDetails_exp">
			   <span><%String Ship=request.getParameter("Ship"); %><%=Ship %>日で発送</span>
			 </div>
		  </div>
		</div>
			<p class="pq"><span class="taitoru">出品者</span></p>
		<div class="user_icon_main">
			<div class="user_icon"><img src="<%=Image %>" alt="商品画像" ></div><div class="listing">浜田省吾</div>
		</div>
		<div class="pq"></div>
		<span class="taitoru">コメント</span>
		<div id="login-content" style="<%= isLoggedIn ? "" : "display: none;" %>">
	        <h2>ログイン済みのユーザーのみ表示されるコンテンツです</h2>
	        <p>あなたのメールアドレス: <%= session.getAttribute("userEmail") %></p>
	        <a href="../login_logout/logout">ログアウト</a>
    	</div>

	    <!-- ログインしていない場合にのみ表示する要素 -->
	    <div id="logout-content" style="<%= isLoggedIn ? "display: none;" : "" %>">
	        <div class="login-comment"><button onclick="location.href='../login_logout/login-in.jsp'">ログインして閲覧</button></div>
	    </div>
      </div>
  </div>

  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>
  <p>oasfhpvunrihgcmneirghfprnogfhwpoevn</p>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

/*<script>*/
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
<!-- footerの読み込み -->
<jsp:include page="/footer.html" />




