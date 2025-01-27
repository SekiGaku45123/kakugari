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

  <c:set var="img" value="${pro[0].getImage_data()}"/>
  <c:set var="img1" value="${pro[0].getImage_data1()}"/>
  <c:set var="img2" value="${pro[0].getImage_data2()}"/>

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

.product-image img:not(.sold) {
   width: 37vw;
   height: 37vw;
   background: #f5f5f5;
   object-fit: contain;
   position: relative;
}

.sold {
   position: absolute;
   width: 37vw;
   height: 37vw;
   left: 0;
   background: none; /* 明示的に背景をリセットする */
}



.custom-checkbox {
      display: none;
    }

    /* ラベルを画像に変更 */
    .custom-label {
      display: inline-block;
      width: 8vw;
      height: 5vw;
      background: url('${img}') no-repeat center center;
      background-size: cover;
      cursor: pointer;

      position: relative;

  	  left: 4vw;
  	  border-radius: 10%;
    }

    /* チェック状態の画像 */
    .custom-checkbox:checked + .custom-label {
      background-image: url('${img}');
      border: 2px solid #ff476f;
    }


.custom-checkbox1 {
      display: none;
    }

    /* ラベルを画像に変更 */
    .custom-label1 {
      display: inline-block;
      width: 8vw;
      height: 5vw;
      background: url('${img1}') no-repeat center center;
      background-size: cover;
      cursor: pointer;

      position: relative;

  	  left: 6vw;
  	  border-radius: 10%;
    }

    /* チェック状態の画像 */
    .custom-checkbox1:checked + .custom-label1 {
      background-image: url('${img1}');
      border: 2px solid #ff476f;
    }


.custom-checkbox2 {
      display: none;
    }

    /* ラベルを画像に変更 */
    .custom-label2 {
      display: inline-block;
      width: 8vw;
      height: 5vw;
      background: url('${img2}') no-repeat center center;
      background-size: cover;
      cursor: pointer;

      position: relative;
  	  left: 8vw;
  	  border-radius: 10%;
    }

    /* チェック状態の画像 */
    .custom-checkbox2:checked + .custom-label2 {
      background-image: url('${img2}');
      border: 2px solid #ff476f;
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

.kounyu .kara {
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

.kounyu .kara2{
  display: block;
  color: white;
  font-weight: 900;
  width: 20vw;
  border-radius: 5px;
  background: blue;
  border: none;
  padding: 10px 20px;

}

.kounyu .kara3{
  display: block;
  color: #595959;
  font-weight: 900;
  width: 20vw;
  border-radius: 5px;
  background: #dbdbdb;
  border: none;
  padding: 10px 20px;

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
 display: block;
 width: 100%;
 height: 250px;
 padding: 20px 0;
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

 .comment_left p{
	padding: 0 10px 0 10px;
	float: left;
	clear:  both;
	background: #e8e8e8;
	border-radius: 0 10px 10px 0;
 }

 .comment_light p{
 	padding: 0 10px 0 15px;
	float: right;
	clear:  both;
	background: #e8e8e8;
	border-radius: 10px 0 0 10px;

 }
 .comment_list:after {
    content: "";
    display: table;
    clear: both;
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

  .product-image img:not(.sold){
  width: 98.2vw;
  height: 98.2vw;
  background: #f5f5f5;
  object-fit: contain;
  position: relative;

  }

.sold {
   position: absolute;
   width: 98.2vw;
   height: 98.2vw;
   right: 0;
   top: 0;
   background: none; /* 明示的に背景をリセットする */
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

.kounyu .kara {
  color: white;
  font-weight: 900;
  width: 100%;
  border-radius: 5px;
  background:black;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
}

.kounyu .kara2{
  color: white;
  font-weight: 900;
  width: 100%;
  border-radius: 5px;
  background:blue;
  border: none;
  padding: 10px 20px;
  cursor: pointer;

}

.kounyu .kara3{
  color: #595959;
  font-weight: 900;
  width: 100%;
  border-radius: 5px;
  background: #dbdbdb;
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
 display: block;
 width: 100%;
 height: 250px;
 padding: 25px 0;
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

 width:55vw;
 overflow-wrap: break-word;
 }
 .comment_light{
 padding: 0 0 0 10px;
 margin: 0 0 0 auto;
 background: #e8e8e8;
 width:55vw;
 overflow-wrap: break-word;

 }

 .comment_left p{
	padding: 0 10px 0 10px;
	float: left;
	clear:  both;
	background: #e8e8e8;
	border-radius: 0 10px 10px 0;
 }

 .comment_light p{
 padding: 0 10px 0 15px;
	float: right;
	clear:  both;
	background: #e8e8e8;
	border-radius: 10px 0 0 10px;
 }
.comment_list:after {
    content: "";
    display: table;
    clear: both;
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


<c:set var="user_name" value="${user_data.getUser_name()}" />

<c:set var="user_id" value="${user_data.getUser_id()}" />

<c:set var="item_idid" value="${pro[0].getItem_id()}"/>

<c:set var="user_idid" value="${pro[0].getUser_id()}"/>

<c:set var="flag" value="${pro[0].getFlag()}"/>

<c:forEach var="pro" items="${pro}">
  <div class="oya">
      <!-- 左側：商品画像 -->
      <div class="product-image">
        <!-- 商品の画像を表示 (item.item_detail に画像URLまたはデータが格納される) -->

        <div id="productImage"><img id="productImg" src="" width="700" height="700" alt="商品画像" ></div><c:if test="${flag == false }"><img class="sold" src="../kakugari_image/SOLD.png" width="700" height="700" alt="SOLD OUT"></c:if>

      	<br>
      	<input type="checkbox" id="myCheckbox" class="custom-checkbox" checked>
		<label for="myCheckbox" class="custom-label"></label>

		<input type="checkbox" id="myCheckbox1" class="custom-checkbox1">
		<label for="myCheckbox1" class="custom-label1"></label>

		<input type="checkbox" id="myCheckbox2" class="custom-checkbox2">
		<label for="myCheckbox2" class="custom-label2"></label>
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


			  <c:choose>
				  <c:when test="${user_id == user_idid}"><button class="kara2" type="submit" disabled>自身の出品商品</button></c:when>
			  	  <c:when test="${flag == false }"><button class="kara3" type="submit" disabled>売り切れました</button></c:when>
			  	  <c:otherwise><button class="kara" type="submit">購入手続きへ</button></c:otherwise>
			  </c:choose>
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
	        	<br>
	        </div>
	        <c:if test="${flag != false }">
	        <div class="comment_input">
	        	<textarea id="comment_input" name="comment_input"></textarea>
	        	<button id="send_button"><img src="../kakugari_image/19610.png" alt="送信"/></button>
	        </div>
	        </c:if>
	        <c:if test="${flag == false }">
				<p>※売り切れのためコメントできません</p>
	        </c:if>


    	</div>

	    <!-- ログインしていない場合にのみ表示する要素 -->
	    <div id="logout-content" style="<%= isLoggedIn ? "display: none;" : "" %>">
	        <div class="login-comment"><button onclick="location.href='../login_logout/login-in.jsp'">ログインして閲覧</button></div>
	    </div>
      </div>
  </div>
</c:forEach>
<c:if test="${not empty sessionScope.alertMessage}">
    <script>
        alert("${sessionScope.alertMessage}");
    </script>
    <c:remove var="alertMessage" scope="session"/>
</c:if>

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
	var user_name = "${user_name }";

	var imd="${img}";
	var imd1="${img1}";
	var imd2="${img2}";

	function fetchComments(isInitialLoad = false) {
		const commentValue = isInitialLoad ? '' : document.getElementById("comment_input").value.trim();
	    $.ajax({
	        url: '../kakugari/comment_insert', // サーバーのURL
	        type: 'POST',
	        data: {
	            comment: commentValue,
	            user_id: user_id,
	            item_id: item_idid,
	            user_name: user_name
	        },
	        success: function (data) {

	        	const { cocomment, list } = data;

	            console.log(list);
	            var dorihu = document.getElementById('dorihu');

	            if (dorihu) {  // dorihu が存在するか確認
	                dorihu.innerHTML = '';

	                    if (list.includes("NG")) {
	                        // 特定の値が含まれている場合の処理
	                    	alert(list);
	                    }else {
	                    	console.log("someProperty は undefined または空です。");
	                	}

	                console.log(cocomment+121);
	                for (var i = 0; i < cocomment.length; i++) {
	                    console.log(user_id, cocomment[i].user_id + "一致");

	                    var br = document.createElement('br');
	                    var br2 = document.createElement('br');
	                    if (user_id == cocomment[i].user_id) {
	                        var commentlight = document.createElement('div');
	                        var commentp = document.createElement('p');
	                        var commenttime = document.createElement("span");

	                        commentlight.className = 'comment_light';
	                        commentp.textContent = cocomment[i].comment;
	                        commentp.appendChild(br);


	                        commenttime.textContent = cocomment[i].posted_day;
	                        commenttime.style.fontSize = "15px";
	                        commenttime.style.color = "#54171f";
	                        commentp.appendChild(commenttime);

	                        commentlight.appendChild(commentp);

	                        dorihu.appendChild(commentlight);
	                    } else {
	                        var commentleft = document.createElement('div');
	                        var commentpp = document.createElement('p');
	                        var commenttime = document.createElement("span");
	                        var username = document.createElement("span");
	                        var keigo = document.createElement("span");

	                        commentleft.className = 'comment_left';  // commentleft を使う
	                        commentpp.textContent = cocomment[i].comment;
	                        commentpp.appendChild(br);

	                        commenttime.textContent = cocomment[i].posted_day;
	                        commenttime.style.fontSize = "15px";
	                        commenttime.style.color = "#54171f";
	                        commentpp.appendChild(commenttime);

	                        username.textContent = "   "+cocomment[i].user_name;
	                        username.style.fontSize = "19px";
	                        username.style.color = "#542e17";
	                        commentpp.appendChild(username)

	                        keigo.textContent = "さん";
	                        keigo.style.fontSize = "17px";
	                        keigo.style.color = "#542e17";
	                        commentpp.appendChild(keigo)

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


	// チェックボックスをグループ化する
	const checkboxes = document.querySelectorAll('.custom-checkbox, .custom-checkbox1, .custom-checkbox2');
    const productImageDiv = document.getElementById('productImage');
    const productImg = document.getElementById('productImg');

    // チェックボックスが変更されたときに他のチェックボックスを解除する
    checkboxes.forEach(checkbox => {
      // 初期状態で最初のチェックボックスを無効にする
      if (checkbox.checked) {
        checkbox.disabled = true;
        productImg.src = imd;
      }

      checkbox.addEventListener('change', function() {
        if (this.checked) {
          // 他のチェックボックスをすべて外す
          checkboxes.forEach(otherCheckbox => {
            if (otherCheckbox !== this) {
              otherCheckbox.checked = false;
              otherCheckbox.disabled = false;  // 他のチェックボックスを再び有効にする
            }
          });
          // 現在選択されているチェックボックスは再度クリックできないようにする
          this.disabled = true;

          console.log(imd);

          // 商品画像を表示
          productImageDiv.style.display = 'block';
          // 商品画像のsrcを動的に設定
          if (this.id === 'myCheckbox') {
        	  console.log(imd+"kakaka");
            productImg.src = imd; // チェックボックス1に対応する画像
          } else if (this.id === 'myCheckbox1') {
        	  console.log(imd1+"kaka");
            productImg.src = imd1; // チェックボックス2に対応する画像
          } else if (this.id === 'myCheckbox2') {
        	  console.log(imd2+"ka");
            productImg.src = imd2; // チェックボックス3に対応する画像
          }
        } else {
          // チェックが外れた場合は画像を非表示
          productImageDiv.style.display = 'none';
        }
      });
    });



</script>
<br><br><br><br><br><br><br><br>
<!-- footerの読み込み -->
<div class="footer-container">
  <jsp:include page="/footer.html" />
</div>



