<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    z-index:9998;
    margin-left: 0; /*いつか変えるかもしれない*/
    padding: 0;

    /*スクロールバー非表示*/
    -ms-overflow-style: none;
     scrollbar-width: none;
  }

.botan_mein{
 display: flex;

}

.kounyu {
  z-index: 9999;
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.kounyu button {
  display: block;
  color: white;
  font-weight: 900;
  width: 20vw;
  border-radius: 5px;
  background: black;
  border: none;
  padding: 10px 20px;

  /*cursor: pointer;*/
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

 .comment_list{
 width: 100%;
 height: 250px;
 padding: 50px 0;
 /*background: white;*/
 border: 1px solid #b8b8b8;
 border-radius: 5px 5px;
 box-sizing: border-box;
 overflow-y:scroll;
 overscroll-behavior: contain;
 position: relative; /* static から relative に変更 */
 z-index:9998;

 }

.comment_list::-webkit-scrollbar{
  display: none;
}

 .comment_left{
 padding: 0 10px 0 0;
 background: #e8e8e8;
 border-radius: 0 10px 10px 0;
 width:25vw;
 overflow-wrap: break-word;
 }
 .comment_light{
 padding: 0 0 0 10px;
 margin: 0 0 0 auto;
 background: #e8e8e8;
 border-radius: 10px 0 0 10px;
 width:25vw;
 overflow-wrap: break-word;

 }


.comment_input textarea{
  position: relative;
  padding: 1px 20px 1px;
  margin: 10px 0 10px 0;
  border-radius: 20px;
  z-index:9998;
  field-sizing: content;
  width: 80%;
  min-height: 1lh;
  max-height: 5lh;
  resize: none;
  overflow-y: scroll;
  overscroll-behavior: contain;
}

textarea::-webkit-scrollbar{
  display: none;
}

.comment_input button{

position: relative;
width: 18%;
height: 1lh;
margin: 10px 0;
float: right;
background: transparent;

 border: none;

 outline: none;

 box-shadow: none;

}

.comment_input button img{
object-fit: contain;
width: auto;
height: 100%;
}

.comment_input button img:hover{
filter: brightness(0) saturate(100%) invert(51%) sepia(52%) saturate(5176%) hue-rotate(198deg) brightness(99%) contrast(103%);
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
  width: 100%;
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

 .comment_list{
 width: 100%;
 height: 250px;
 padding: 50px 0;
 /*background: red;*/
 border: 1px solid #b8b8b8;
 border-radius: 5px 5px;
 box-sizing: border-box;
 overflow-y:scroll;
 overscroll-behavior: contain;
 position: relative; /* static から relative に変更 */
 z-index:9998;

 }

.comment_list::-webkit-scrollbar{
  display: none;
}

 .comment_left{
 padding: 0 10px 0 0;
 background: #e8e8e8;
 border-radius: 0 10px 10px 0;
 width:55vw;
 overflow-wrap: break-word;
 }
 .comment_light{
 padding: 0 0 0 10px;
 margin: 0 0 0 auto;
 background: #e8e8e8;
 border-radius: 10px 0 0 10px;
 width:55vw;
 overflow-wrap: break-word;
 }


.comment_input textarea{
  position: relative;
  padding: 1px 20px 1px;
  margin: 10px 0 10px 0;
  border-radius: 20px;
  z-index:9998;
  field-sizing: content;
  width: 80%;
  min-height: 1lh;
  max-height: 5lh;
  resize: none;
  overflow-y: scroll;
  overscroll-behavior: contain;
}

textarea::-webkit-scrollbar{
  display: none;
}

.comment_input button{

position: relative;
width: 18%;
height: 1lh;
margin: 10px 0;
float: right;
background: transparent;

 border: none;

 outline: none;

 box-shadow: none;

}

.comment_input button img{
object-fit: contain;
width: auto;
height: 100%;
}

.comment_input button img:hover{
filter: brightness(0) saturate(100%) invert(51%) sepia(52%) saturate(5176%) hue-rotate(198deg) brightness(99%) contrast(103%);
}

}
  </style>


<c:set var="user_id" value="${user_data.getUser_id()}" />

<c:set var="item_idid" value="${pro[0].getItem_id()}"/>

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
	  		 <form action="${pageContext.request.contextPath}/confirm" method="post">
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
	        <div class="comment_list">
	        	<div id="dorihu"></div>
	        </div>
	        <div class="comment_input">
	        	<textarea id="comment_input" name="comment_input"></textarea>
	        	<button id="send_button"><img src="../kakugari_image/19610.png" alt="送信"/></button>
	        </div>


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


	var user_id = "${user_id }";
	var item_idid="${item_idid}";

	function fetchComments(isInitialLoad = false) {
		const commentValue = isInitialLoad ? '' : document.getElementById("comment_input").value.trim();
	    $.ajax({
	        url: '../kakugari/comment_insert', // サーバーのURL
	        type: 'POST',
	        data: {
	            comment: commentValue,
	            user_id: user_id,
	            item_id: item_idid
	        },
	        success: function (cocomment) {
	            console.log(cocomment);
	            var dorihu = document.getElementById('dorihu');

	            if (dorihu) {  // dorihu が存在するか確認
	                dorihu.innerHTML = '';

	                for (var i = 0; i < cocomment.length; i++) {
	                    console.log(user_id, cocomment[i].user_id + "一致");

	                    if (user_id == cocomment[i].user_id) {
	                        var commentlight = document.createElement('div');
	                        var commentp = document.createElement('p');
	                        commentlight.className = 'comment_light';
	                        commentp.textContent = cocomment[i].comment;
	                        commentlight.appendChild(commentp);
	                        dorihu.appendChild(commentlight);
	                    } else {
	                        var commentleft = document.createElement('div');
	                        var commentpp = document.createElement('p');
	                        commentleft.className = 'comment_left';  // commentleft を使う
	                        commentpp.textContent = cocomment[i].comment;
	                        commentleft.appendChild(commentpp);  // commentleft に追加
	                        dorihu.appendChild(commentleft);  // commentleft を dorihu に追加
	                    }
	                }
	            } else {
	                console.error('dorihu 要素が見つかりません');
	            }
	        },
	    });
	}

	// ページが読み込まれたときに実行
	window.onload = function () {
	    fetchComments(true);
	};

	// ボタンがクリックされたときにも実行
	document.getElementById("send_button").addEventListener("click", function (event) {
	    event.preventDefault(); // フォーム送信を防止
	    const commentValue = document.getElementById("comment_input").value.trim();
	    if (commentValue) {
	        console.log("入力されたコメント:", commentValue);
	        fetchComments(); // コメントを取得する関数を呼び出す
	    } else {
	        console.log("コメントが空です。");
	    }
	});


</script>
<br><br><br><br><br><br><br><br>
<!-- footerの読み込み -->
<div class="footer-container">
  <jsp:include page="/footer.html" />
</div>



