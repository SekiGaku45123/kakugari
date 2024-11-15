<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // セッションからログイン情報を取得
    HttpSession sessions = request.getSession(false);
    boolean isLoggedIn = (session != null && session.getAttribute("customer") != null);
%>



  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品詳細 - カクガリ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <c:import url="/common/base.jsp"></c:import>
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
     display: grid;
  grid-template-columns: 55% 45%; /* 左側1、右側3の割合 */
  align-items: start;
    margin: 0 auto;
}

.product-image {
    position: sticky;
    top:80px;
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
    margin-left: 85px;
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
  background: black;
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
  color: black;
  border: 1px solid black;
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
  color: black;
  font-weight: 100;
  border: 1px solid black;
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
  background:black;
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
  color: black;
  border: 1px solid black;
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
  color: black;
  font-weight: 100;
  border: 1px solid black;
  border-radius: 5px 5px;
 }

}
  </style>


<c:forEach var="pro" items="${pro}">
  <div class="oya">
      <!-- 左側：商品画像 -->
      <div class="product-image">
        <!-- 商品の画像を表示 (item.item_detail に画像URLまたはデータが格納される) -->

        <img src="${pro.getImage_data()}" width="700" height="700" alt="商品画像" >
      </div>

      <!-- 右側：商品詳細 -->
       <div class="tkst">
        <!-- 商品IDや名前などの情報 -->

        <h2>${pro.getItem_name()}</h2>
        <p class="pq">￥<span class="mozi">${pro.getItem_price()}</span>（税込・送料込み）</p>

		<div class="botan_mein">
	        <div class="kounyu">
	  		 <form action="${pageContext.request.contextPath}/main_kakugari/purchase-in.jsp" method="post">
	    	  <input type="hidden" name="item_id" value="${pro.getItem_id()}">
	    	  <input type="hidden" name="flag" value="${pro.getFlag()}">

	    	  <input type="hidden" name="image_data" value="${pro.getImage_data()}">
	    	  <button type="submit">購入手続きへ</button>
		     </form>
	        </div>

	        <div class="okini">
	          <!-- 商品IDを送信するフォーム -->
	          <form action="favoriteAddAction" method="post">
	            <input type="hidden" name="item_id" value="${pro.getItem_id()}">
	            <button type="submit">♡</button>
	          </form>
	        </div>

	     </div>

		<br><div class="pq"></div>

        <p><span class="taitoru">商品詳細</span><br><font color="#7d7d7d">${pro.getItem_detail()}</font></p>

        <p class="pq"><span class="taitoru">商品情報</span></p>
		<div class="ProductDetails">
		  <div class="ProductDetails_main">
			 <div class="ProductDetails_main1">
			   <span>CATEGORY</span>
			 </div>
			 <div class="ProductDetails_exp">
			   <span>${pro.getCategory()}</span>
			 </div>
		  </div>
		  <div class="ProductDetails_main">
			 <div class="ProductDetails_main1">
			   <span>CONDITION</span>
			 </div>
			 <div class="ProductDetails_exp">
			   <span>${pro.getCondition()}</span>
			 </div>
		  </div>
		  <div class="ProductDetails_main">
			 <div class="ProductDetails_main1">
			   <span>AREA</span>
			 </div>
			 <div class="ProductDetails_exp">
			   <span>${pro.getArea()}</span>
			 </div>
		  </div>
		  <div class="ProductDetails_main">
			 <div class="ProductDetails_main1">
			   <span>SHOPPING DAYS</span>
			 </div>
			 <div class="ProductDetails_exp">
			   <span>${pro.getShipping_days()}日で発送</span>
			 </div>
		  </div>
		</div>
			<p class="pq"><span class="taitoru">出品者</span></p>
		<div class="user_icon_main">
			<div class="user_icon"><img src="${pro.getImage_data()}" alt="商品画像" ></div><div class="listing">浜田省吾</div>
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
</c:forEach>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

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
<br><br><br><br><br><br><br><br>
<!-- footerの読み込み -->
<div class="footer-container">
  <jsp:include page="/footer.html" />
</div>



