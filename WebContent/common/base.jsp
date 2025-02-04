<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>カクガリ</title>
<!-- ファビコンの設定 -->
<link rel="icon" href="/読書のアイコン.png" type="image/png" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&family=Noto+Serif+JP:wght@200..900&family=Zen+Maru+Gothic&display=swap" rel="stylesheet">
<%
       // セッションからログイン情報を取得
       HttpSession sessionObj = request.getSession(false);
       boolean isLoggedIn = (session != null && session.getAttribute("customer") != null);
  %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
       /* headerスタイル */
       header {
           /*border:solid 1px #000;*/
           display: flex;
           align-items: center; /* 垂直方向の中央揃え */
           position: sticky;
           top: 0;
           width: auto;
           margin: 0 auto 10px;
           background-color: white;
           z-index: 10000;
       }
       header::after {
	       content: '';
    display: block;
    width: 100%;
    height: 10px; /* スペースの高さを指定 */
    background-color: transparent;
       }
       header h2 {
	       font-size: 20px;
	       float: left;
	       margin: 6px 0 10px 20px;
	       align-items: center;
            text-decoration: none;
            color: inherit;
       }
       header a:hover {
       	text-decoration: none;
       }
       .kakuspa{
           font-family: "あめちゃんポップ　まる Light";
           font-weight: 900;
           color: black;
           text-decoration: none;
           position: relative; /* 相対位置を設定 */
           top: 3px;
       }

       header #search {
	       float: left;
	       margin: 5px 20px 0;
	       display: inline-block;
	       width: 50%;
	       padding: 0.5em;
	       border: 1px solid #999;
	       box-sizing: border-box;
	       background: #f2f2f2;
	   }
       header #bar {
	       float: right;
	       margin: 10px 30px 0 0;
       }
       header #menu {
	       width: 95%;
	       clear: both;
	       overflow: hidden;
	       margin: 25px auto;
	   }
	   .login-content{
	   		display: grid;
  			justify-content: flex-end;

	   }
	   .logout-content{
	   		display: grid;
  			justify-content: flex-end;
	   }

       .login_in {
	       display: inline-block;
	       border-width: 1px;
	       margin: 10px 20px 0 40px;
	       border-color: darkgray;
	       text-decoration: none;
       }
       .login_in a {
	       width: 100%;
	       padding: 0 20px 0;
	       color: #525252;
	       font-weight: 900;
	       border-radius: 5px;
	       text-decoration: none;
       }

       .login_in img{
           height:auto;
       }

       .images0{
           width: 34px;
       }

       .images1{
           width: 34px;
       }

       .images2{
           width: 40px;
       }
       .images3{
       	   width: 40px;
       }

       .images4{
       	   width: 37px;
       }

       #bar {
	       display: flex;
	       border: 1px solid #FF9933;
	       background: white;
	       border-radius: 50%;
	       color: blue;
	       cursor: pointer;
       }
       #bar img {
	       border-radius: 50%;
	       object-fit: contain;
	       width: 60px;
	       height: 60px;
       }
       #bar:hover {
           color: darkblue;
       }





	   .menu_slide {
		    position: fixed;
		    top: 0;
		    right: -500px;
		    width: 500px;
		    height: 100%;
		    background-color: #fff;
		    color: #333;
		    transition: right 0.5s ease;
		    padding: 20px;
		    z-index: 1001;
		    border-radius: 10px 0 0 10px;
		}

		.menu_slide.open {
		    right: 0;
		}

		.closeLink {
		    float: right !important;
		    padding: 0 !important;
		    display: block !important;
		    width: 35px !important;
		    overflow: hidden !important;
		}

		.closeLink img {
		    width: 100% !important;
		    height: auto !important;
		    object-fit: cover !important;
		}

		.overlay {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background: rgba(0, 0, 0, 0.5);
		    backdrop-filter: blur(5px);
		    display: none;
		    z-index: 1000;
		}

		.overlay.active {
		    display: block;
		}


		.formm{
			display: flex;
		}
		.sa-tin{
			padding: 0 0 0 20px;
			border:none;/*枠線を消す*/
			outline: none;
			background:#f7f7f7;
			width: 230px;
		}

		.botan {
		    position: relative;
		    border: none;
		    outline: none;
		    width: 50px;
		    height: 50px;
		    background: #f7f7f7;
		}

		.botan::before {
		    content: '';
		    position: absolute;
		    left: 0;
		    top: 10px; /* 開始位置 */
		    bottom: 10px; /* 終了位置 */
		    width: 1.5px;
		    background-color: #d6d6d6;
		}
		.botan img{
			object-fit: contain;
			width: 60%;
			height: 60%;
		}

		.collarfont{
			color: #b3b3b3;
		}

		.custom-list {
		    list-style-type: none; /* リストマーカーを削除 */
		    padding: 0;
		    margin: 0;
		}

		/* <a>のスタイル */
		.custom-link {
		    text-decoration: none; /* 下線を削除 */
		    color: inherit;           /* テキストの色 */
		    padding: 10px;
		    font-size: 20px;
		    display: block;

		}

		.custom-link a{
			font-weight: 100;
		}

		/* <a>リンクにホバー効果を追加 */
		.custom-link a:hover,
		.custom-link a:active,
		.custom-link a:visited {
		    color: inherit !important; /* すべての状態で色を固定 */
		    text-decoration: none !important;
		}

		.hidden {
		    opacity: 0;
		    visibility: hidden;
		    pointer-events: none;
		    position: absolute;
		}

		/* 表示状態 */
		.visible {
			position: absolute;
			border-radius: 10px;
		    opacity: 1;
		    background-color: #f5f5f5;
		    border: 1px solid #000000;
		    margin: 10px 0 0 150px;
		    width:150px;
		    height: 80px;
		    visibility: visible;
		}
		.visible p{
			margin: 10px 0;
			text-align: center;
		}
		.visible p a:hover{
			background-color:#e8e8e8;
			padding: 5px 10px;
		}



		.hidden1 {
		    opacity: 0;
		    visibility: hidden;
		    pointer-events: none;
		    position: absolute;
		}
		.visible1 {
			position: absolute;
			border-radius: 10px;
		    opacity: 1;
		    background-color: #f5f5f5;
		    border: 1px solid #000000;
		    margin: 10px 0 0 240px;
		    width:150px;
		    height: 80px;
		    visibility: visible;
		}
		.visible1 p{
			margin: 10px 0;
			text-align: center;
		}
		.visible1 p a:hover{
			background-color:#e8e8e8;
			padding: 5px 10px;
		}

		.yarukoto_main{
		position: absolute;
		background-color: #ff476f;
		width:25px;
		height:25px;
		top:42px;
		right:6px;
		border-radius:50%
		}

		.count{
		color:white;
		margin:0 0 0;
		text-align: center;
		font-family: cursive;
		}

		#notification{
			position: absolute;
			background-color: #ff476f;
			width:10px;
			height:10px;
			top:10px;
			right:30px;
			border-radius:50%;
		}

		.order_list_main{
		border: 2px solid #000000;
		position: absolute;
		background-color: white;
		max-width: 500px;
		width:50vw;
		height:650px;
		top: 30px;
    	left: 50%;
    	transform: translateX(-50%);
    	-webkit-transform: translateX(-50%);
    	-ms-transform: translateX(-50%);
    	border-radius:2%;
    	overflow: auto;
		}
		.p_gen {
		    text-align: center;
		    font-size: 25px;
		    border-bottom: 1px solid #000;
		    margin: 5px 10px 0 10px;
		    display: grid; /* グリッドレイアウトを適用 */
		    grid-template-columns: 1fr 1fr 1fr; /* 3列に分ける */
		    justify-items: center; /* 水平方向の中央揃え */
		    align-items: center; /* 垂直方向の中央揃え */

		}
		.bu1{
		background-color: white;
		transform: translateY(1px); /* 少し下に移動 */
		}

		.bu1 button{
		background-color: white;
		border-bottom: none;
		}


		.bu2{
		background-color: white;
		transform: translateY(1px); /* 少し下に移動 */
		}

		.bu2 button{
		background-color: white;
		border-bottom: none;
		}

		.bu3{
		background-color: white;
		transform: translateY(1px); /* 少し下に移動 */
		}

		.bu3 button{
		background-color: white;
		border-bottom: none;
		}


		.order_list{
		margin: 10px;
		height:85px;
		display: grid;
		grid-template-columns: 30% 70%;
		}

		.order_img{
		margin: 0 auto;
		background-color: black;
		width: 85px;
		height: 85px;
		}
		.order_img1{
		margin: 0 auto;
		background-color: black;
		width: 85px;
		height: 85px;
		}

		.order_img img{
		object-fit: cover;
		width: 100%;
		height: 100%;

		}
		.order_img1 img{
		filter: brightness(50%);
		object-fit: cover;
		width: 100%;
		height: 100%;

		}

		.order_comment p{

		font-size: 15px;
		padding: 5px 0;
		}

		.margin_order{
		border-bottom: 1px solid #cccccc;
		margin:5px 10px 0 10px;
		}

		.atagu{
		margin: 0; /* 外側の余白を消す */
	  padding: 0; /* 内側の余白を消す */
	  display: inline-block; /* 必要に応じて指定 */
	  text-decoration: none; /* 下線を消す（必要なら） */
		}
		.syupin{
		cursor:pointer;
		position: relative;
		border-radius:5px;
		background: black;
		/*border: 2px solid #bababa;*/
		color: white;
		/*font-weight:bold;*/
		font-family: "HGP創英角ｺﾞｼｯｸUB";
		top:2px;
		}

</style>
</head>
<body>
<header>

	<h2><a href="../main_kakugari/all"><img src="../images/読書のアイコン.png" width="66" height="46"><span class="kakuspa"> カクガリ</span></a>　<button class="syupin" onclick="location.href='../main_kakugari/listing.jsp'" style="<%= isLoggedIn ? "" : "display: none;" %>">出品　</button></h2>

		<div class="logout-content">
		    <div class="login_in" style="<%= isLoggedIn ? "display: none;" : "" %>">
		    	<a href="#" class="openLink" onclick="fetchItems(event)"><img src="../kakugari_image/1023.png" class="images0"></a>
		    	<div class="overlay"></div>
		    	<div class="menu_slide">
			        <a href="#" class="closeLink" id="asyncLink"><img src="../kakugari_image/太いバツのアイコン2.png"></a>
			        <div>
			        	<form action="${pageContext.request.contextPath}/kakugari/productsearch" method="post" class="formm">
			        	<input type="text" name="keyword" placeholder="検索" class="sa-tin">
			        	<div class="waku">
			        	<button type="submit" value="" class="botan"><img src="../kakugari_image/1023.png"></button>
			        	</div>

			        	</form>
			        	<span class="collarfont">CATEGORY</span>
			        	<br><div class="pq"></div><br>
			        	<div id="getData"></div>
			        </div>
			    </div>
		        <a href="${pageContext.request.contextPath}/kakugari/favoritesearch"><img src="../kakugari_image/8760.png" class="images1"></a>
		        <!--<a href="${pageContext.request.contextPath}/history"><img src="../kakugari_image/9654.png" class="images2"></a>-->
		        <a href="../contact/contact.jsp"><img src="../kakugari_image/10894.png" class="images3"></a>
		        <a href="#" id="fadeLink"><img src="../kakugari_image/888.png" class="images4"></a>
		        <div id="fadeElement" class="hidden">
		        	<p><a href="../login_logout/login-in.jsp">ログイン</a></p>
		        	<p><a href="../main_kakugari/signup.jsp">新規作成</a></p>
		        </div>
		        <!--  <a href="../login_logout/login-in.jsp">ログイン</a>   ../login_logout/login-in.jsp-->
		        <!--<a href="../main_kakugari/signup.jsp">新規登録</a>-->
		    </div>

    		<div class="login_in" style="<%= isLoggedIn ? "" : "display: none;" %>">
        		<a href="#" class="openLink" onclick="fetchItems1(event)"><img src="../kakugari_image/1023.png" class="images0"></a>
		    	<div class="overlay"></div>
		    	<div class="menu_slide">
			        <a href="#" class="closeLink" id="asyncLink"><img src="../kakugari_image/太いバツのアイコン2.png"></a>
			        <div>
			        	<form action="${pageContext.request.contextPath}/kakugari/productsearch" method="post" class="formm">
			        	<input type="text" name="keyword" placeholder="検索" class="sa-tin">
			        	<div class="waku">
			        	<button type="submit" value="" class="botan"><img src="../kakugari_image/1023.png"></button>
			        	</div>

			        	</form>
			        	<span class="collarfont">CATEGORY</span>
			        	<br><div class="pq"></div><br>
			        	<div id="getData1"></div>
			        </div>
			    </div>
		        <a href="${pageContext.request.contextPath}/kakugari/favoritesearch"><img src="../kakugari_image/8760.png" class="images1"></a>
		        <a href="${pageContext.request.contextPath}/history"><img src="../kakugari_image/9654.png" class="images2"></a>
		        <a href="../contact/contact.jsp"><img src="../kakugari_image/10894.png" class="images3"></a>
		        <a href="#" id="fadeLink1"><img src="../kakugari_image/888.png" class="images4"></a>

		        <div id="notification"></div>

		        <div id="fadeElement1" class="hidden1">
		        	<p><a href="../login_logout/logout">ログアウト</a></p>
		        	<p><a href="#" id="showOrderList">通知リスト</a></p>
		        	<div class="yarukoto_main">
			        	<div id="yarukoto">
			        </div>
		        </div>
			    </div>

			    <div class="order_list_main" style="display: none;">
				    <span class="p_gen"><div class="bu1"><button id="bu1_1">発送</button></div><div class="bu2"><button id="bu2_1">受取評価</button></div><div class="bu3"><button id="bu3_1">その他</button></div></span>
					    <div id="order_all"></div>
					    <div id="all_order" style="display:none"></div>
					    <div id="message_all" style="display:none"></div>
			    </div>

    		</div>




<script type="text/javascript">


document.getElementById("bu1_1").addEventListener("click", function() {
    document.getElementById("message_all").style.display = "none";
    document.getElementById("all_order").style.display = "none";
    document.getElementById("order_all").style.display = "block";
});
document.getElementById("bu2_1").addEventListener("click", function() {
    document.getElementById("order_all").style.display = "none";
    document.getElementById("message_all").style.display = "none";
    document.getElementById("all_order").style.display = "block";
});
document.getElementById("bu3_1").addEventListener("click", function() {
    document.getElementById("order_all").style.display = "none";
    document.getElementById("all_order").style.display = "none";
    document.getElementById("message_all").style.display = "block";
});



       const links = document.querySelectorAll(".header-nav__item > a");
       links.forEach(function (link) {
           if (link.href === location.href) {
               link.closest(".header-nav__item").classList.add("current");
           }
       });

       document.querySelectorAll(".openLink").forEach(openLink => {
    	    openLink.addEventListener("click", function(event) {
    	        event.preventDefault();
    	        const menuSlide = this.nextElementSibling.nextElementSibling; // メニュー要素を取得
    	        const overlay = this.nextElementSibling; // オーバーレイ要素を取得
    	        menuSlide.classList.add("open");
    	        overlay.classList.add("active");
    	    });
    	});

    	document.querySelectorAll(".closeLink").forEach(closeLink => {
    	    closeLink.addEventListener("click", function(event) {
    	        event.preventDefault();
    	        const menuSlide = this.closest(".menu_slide"); // メニュー要素を取得
    	        const overlay = menuSlide.previousElementSibling; // オーバーレイ要素を取得
    	        menuSlide.classList.remove("open");
    	        overlay.classList.remove("active");
    	    });
    	});


//フェードイン
    	document.getElementById("fadeLink").addEventListener("click", function (event) {
		    event.preventDefault(); // デフォルトのリンク動作を無効化
		    const element = document.getElementById("fadeElement");
		    if (element.classList.contains("hidden")) {
		        element.classList.remove("hidden");
		        element.classList.add("visible");
		    } else {
		        element.classList.remove("visible");
		        element.classList.add("hidden");
		    }
		});
    	document.getElementById("fadeLink1").addEventListener("click", function (event) {
		    event.preventDefault(); // デフォルトのリンク動作を無効化
		    const element = document.getElementById("fadeElement1");
		    if (element.classList.contains("hidden1")) {
		        element.classList.remove("hidden1");
		        element.classList.add("visible1");
		    } else {
		        element.classList.remove("visible1");
		        element.classList.add("hidden1");
		    }
		});



    	function fetchItems(event) {
            // デフォルトのリンク動作を防ぐ
            event.preventDefault();

            var getData = document.getElementById('getData'); // Htmlのdivの部分を指定する
            getData.innerHTML = '';

            // AJAXリクエストを作成
            fetch('${pageContext.request.contextPath}/kakugari/myServlet')  // サーブレットのURLにリクエストを送信
	            .then(response => {
	                // レスポンスがJSONであることを確認
	                console.log("レスポンスを受け取りました", response);
	                return response.json();
	            }) // JSONデータを受け取る
                .then(data => {
                	console.log("取得したデータ:", data);
                	var list = document.createElement('ul');
                	list.className = 'custom-list';
                	var getData = document.getElementById('getData'); // Htmlのdivの部分を指定する


                	for (var i = 0; i < data.length; i++) {

                	    var listItem = document.createElement('li');
                	    var link = document.createElement('a');
                	    link.href = "../kakugari/productsearch?category="+encodeURIComponent(data[i].category); // ここにリンク先のURLを設定します
                	    link.textContent = data[i].category; // リンクのテキストを設定
                	    listItem.className = 'custom-link';

                	    // <li>に<a>を追加
                	    listItem.appendChild(link);

                	    // <ul>の子要素として<li>を追加
                	    list.appendChild(listItem);
                	}


                	getData.appendChild(list);
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }

    	function fetchItems1(event) {
            // デフォルトのリンク動作を防ぐ
            event.preventDefault();

            var getData1 = document.getElementById('getData1'); // Htmlのdivの部分を指定する
            getData1.innerHTML = '';

            // AJAXリクエストを作成
            fetch('${pageContext.request.contextPath}/kakugari/myServlet')  // サーブレットのURLにリクエストを送信
	            .then(response => {
	                // レスポンスがJSONであることを確認
	                console.log("レスポンスを受け取りました", response);
	                return response.json();
	            }) // JSONデータを受け取る
                .then(data => {
                	console.log("取得したデータ:", data);
                	var list = document.createElement('ul');
                	list.className = 'custom-list';
                	var getData1 = document.getElementById('getData1'); // Htmlのdivの部分を指定する


                	for (var i = 0; i < data.length; i++) {

                	    var listItem = document.createElement('li');
                	    var link = document.createElement('a');
                	    link.href = "../kakugari/productsearch?category="+encodeURIComponent(data[i].category); // ここにリンク先のURLを設定します
                	    link.textContent = data[i].category; // リンクのテキストを設定
                	    listItem.className = 'custom-link';

                	    // <li>に<a>を追加
                	    listItem.appendChild(link);

                	    // <ul>の子要素として<li>を追加
                	    list.appendChild(listItem);
                	}


                	getData1.appendChild(list);
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }

    	//${pageContext.request.contextPath}/kakugari/orderlist

		if (<%= isLoggedIn %>) {
    console.log($);
    $.ajax({
        url: '../orderlist',
        type: 'POST',
        success: function(data) {

        	const { response, list, list2, list3, list_co, list_mess, pur_mess, ex_mess} = data;

            try {
                // JSONパースが必要な場合
                if (typeof response === 'string') {
                    response = JSON.parse(response);
                }

                console.log('成功:', response);

                var count = 0;

                var order_all = document.getElementById('order_all');
                order_all.innerHTML = '';
                var all_order = document.getElementById('all_order');
                all_order.innerHTML = '';
                var message_all = document.getElementById('message_all');
                all_order.innerHTML = '';


                var count_two = 0


                if (Array.isArray(ex_mess) && ex_mess.length > 0) {
                    var yarukoto = document.getElementById('yarukoto');
                    yarukoto.innerHTML = '';

                    //count_two = ex_mess.length;

                    console.log("実行してる？2");


                    document.querySelectorAll('#notification').forEach(function(element) {
                        element.style.display = 'block';
                    });

                    document.querySelectorAll('.yarukoto_main').forEach(function(element) {
                        element.style.display = 'block';
                    });


                    for (var i = ex_mess.length - 1; i >= 0; i--){
                    	var order_list_cla_a = document.createElement('a');
                    	var order_list_cla = document.createElement('div');
                    	var order_list_img = document.createElement('div');
                    	var order_list_imgimg = document.createElement('img');

                    	var order_comment_p = document.createElement('div');
                    	var order_comment_p_p = document.createElement('p');

                    	var margin_order_yo = document.createElement('div');


                    	order_list_imgimg.src = ex_mess[i].image_data;
                    	order_list_imgimg.alt = ex_mess[i].item_name;




                    	order_list_cla_a.className = 'atagu'

                    		console.log('カウント:', ex_mess[i].item_id);

                    	//var item_id = response[i].item_id;
                    	var user_name_name = ex_mess[i].user_name;


                    	//order_list_cla_a.href = "../kakugari/tesuto?item_id="+list[i].item_id +"&user_name=" +list[i].user_id ;
                    	let found = false;

                    	console.log(list3+'kakakaka');

                    		order_comment_p_p.textContent = ex_mess[i].user_name + "　さんから受取評価からのメッセージが届きました。";
                    		order_list_cla_a.href = "../main_kakugari/judge_mess.jsp?item_id="+ex_mess[i].evaluate+"&ex_co="+ex_mess[i].comment;
                    		order_list_img.className = 'order_img';


                    	order_comment_p.className = 'order_comment';
                    	order_list_cla.className = 'order_list';
                    	margin_order_yo.className = 'margin_order';



                    	order_list_img.appendChild(order_list_imgimg);
                    	order_comment_p.appendChild(order_comment_p_p);

                    	order_list_cla.appendChild(order_list_img);
                    	order_list_cla.appendChild(order_comment_p);

                    	order_list_cla_a.appendChild(order_list_cla);



                    	message_all.appendChild(order_list_cla_a);
                    	message_all.appendChild(margin_order_yo);


                    }







                }







                if (Array.isArray(pur_mess) && pur_mess.length > 0) {
                    var yarukoto = document.getElementById('yarukoto');
                    yarukoto.innerHTML = '';

                    //count_two = pur_mess.length;

                    console.log("実行してる？2");


                    document.querySelectorAll('#notification').forEach(function(element) {
                        element.style.display = 'block';
                    });

                    document.querySelectorAll('.yarukoto_main').forEach(function(element) {
                        element.style.display = 'block';
                    });


                    for (var i = pur_mess.length - 1; i >= 0; i--){
                    	var order_list_cla_a = document.createElement('a');
                    	var order_list_cla = document.createElement('div');
                    	var order_list_img = document.createElement('div');
                    	var order_list_imgimg = document.createElement('img');

                    	var order_comment_p = document.createElement('div');
                    	var order_comment_p_p = document.createElement('p');

                    	var margin_order_yo = document.createElement('div');


                    	order_list_imgimg.src = pur_mess[i].image_data;
                    	order_list_imgimg.alt = pur_mess[i].item_name;




                    	order_list_cla_a.className = 'atagu'

                    		console.log('カウント:', pur_mess[i].item_id);

                    	//var item_id = response[i].item_id;
                    	var user_name_name = pur_mess[i].user_name;


                    	//order_list_cla_a.href = "../kakugari/tesuto?item_id="+list[i].item_id +"&user_name=" +list[i].user_id ;
                    	let found = false;

                    	console.log(list3+'kakakaka');

                    		order_comment_p_p.textContent = pur_mess[i].user_name + "　さんから受取評価からのメッセージが届きました。";
                    		order_list_cla_a.href = "../main_kakugari/judge_mess.jsp?item_id="+pur_mess[i].evaluate+"&ex_co="+pur_mess[i].comment;
                    		order_list_img.className = 'order_img';


                    	order_comment_p.className = 'order_comment';
                    	order_list_cla.className = 'order_list';
                    	margin_order_yo.className = 'margin_order';



                    	order_list_img.appendChild(order_list_imgimg);
                    	order_comment_p.appendChild(order_comment_p_p);

                    	order_list_cla.appendChild(order_list_img);
                    	order_list_cla.appendChild(order_comment_p);

                    	order_list_cla_a.appendChild(order_list_cla);



                    	message_all.appendChild(order_list_cla_a);
                    	message_all.appendChild(margin_order_yo);


                    }







                }






                if (Array.isArray(list_mess) && list_mess.length > 0) {
                    var yarukoto = document.getElementById('yarukoto');
                    yarukoto.innerHTML = '';

                    //count_two = list_mess.length;

                    console.log("実行してる？2");


                    document.querySelectorAll('#notification').forEach(function(element) {
                        element.style.display = 'block';
                    });

                    document.querySelectorAll('.yarukoto_main').forEach(function(element) {
                        element.style.display = 'block';
                    });


                    for (var i = list_mess.length - 1; i >= 0; i--){
                    	var order_list_cla_a = document.createElement('a');
                    	var order_list_cla = document.createElement('div');
                    	var order_list_img = document.createElement('div');
                    	var order_list_imgimg = document.createElement('img');

                    	var order_comment_p = document.createElement('div');
                    	var order_comment_p_p = document.createElement('p');

                    	var margin_order_yo = document.createElement('div');


                    	order_list_imgimg.src = list_mess[i].image_data;
                    	order_list_imgimg.alt = list_mess[i].item_name;




                    	order_list_cla_a.className = 'atagu'

                    		console.log('yaritaitrti:', list_mess[i].item_id);

                    	//var item_id = response[i].item_id;
                    	var user_name_name = list_mess[i].user_name;


                    	//order_list_cla_a.href = "../kakugari/tesuto?item_id="+list[i].item_id +"&user_name=" +list[i].user_id ;
                    	let found = false;

                    	console.log(list3+'kakakaka');

                    		order_comment_p_p.textContent = list_mess[i].user_name + "　さんからメッセージが届きました。";
                    		order_list_cla_a.href = "../main_kakugari/ex_mess.jsp?item_id="+list_mess[i].item_id+"&ex_co="+list_mess[i].exhibit_come;
                    		order_list_img.className = 'order_img';


                    	order_comment_p.className = 'order_comment';
                    	order_list_cla.className = 'order_list';
                    	margin_order_yo.className = 'margin_order';



                    	order_list_img.appendChild(order_list_imgimg);
                    	order_comment_p.appendChild(order_comment_p_p);

                    	order_list_cla.appendChild(order_list_img);
                    	order_list_cla.appendChild(order_comment_p);

                    	order_list_cla_a.appendChild(order_list_cla);



                    	message_all.appendChild(order_list_cla_a);
                    	message_all.appendChild(margin_order_yo);


                    }







                }



                if (Array.isArray(list2) && list2.length > 0) {
                    var yarukoto = document.getElementById('yarukoto');
                    yarukoto.innerHTML = '';

                    count_two = list2.length;

                    console.log("実行してる？2");


                    document.querySelectorAll('#notification').forEach(function(element) {
                        element.style.display = 'block';
                    });

                    document.querySelectorAll('.yarukoto_main').forEach(function(element) {
                        element.style.display = 'block';
                    });


                    for (var i = list2.length - 1; i >= 0; i--){
                    	var order_list_cla_a = document.createElement('a');
                    	var order_list_cla = document.createElement('div');
                    	var order_list_img = document.createElement('div');
                    	var order_list_imgimg = document.createElement('img');

                    	var order_comment_p = document.createElement('div');
                    	var order_comment_p_p = document.createElement('p');

                    	var margin_order_yo = document.createElement('div');


                    	order_list_imgimg.src = list2[i].image_data;
                    	order_list_imgimg.alt = list2[i].item_name;




                    	order_list_cla_a.className = 'atagu'

                    		console.log('カウント:', list2[i].item_id);

                    	//var item_id = response[i].item_id;
                    	var user_name_name = list2[i].user_name;


                    	//order_list_cla_a.href = "../kakugari/tesuto?item_id="+list[i].item_id +"&user_name=" +list[i].user_id ;
                    	let found = false;

                    	console.log(list3+'kakakaka');

                    	for (let a = 0; a < list3.length; a++) {
                    		if (list3[a].itemId === list2[i].item_id) {
                    			order_list_img.className = 'order_img1';
                    			order_comment_p_p.textContent = "受取評価が完了しました。"
                    	        found = true;
                    	        count_two--;
                    	        break;
                    		}

                    	}

                    	if (!found) {
                    		order_comment_p_p.textContent = list2[i].user_name + "　さんが「" + list2[i].item_name + "」の受取評価しました。";
                    		order_list_cla_a.href = "../judge/judge.jsp?item_id="+list2[i].item_id;
                    		order_list_img.className = 'order_img';
                    	}

                    	order_comment_p.className = 'order_comment';
                    	order_list_cla.className = 'order_list';
                    	margin_order_yo.className = 'margin_order';



                    	order_list_img.appendChild(order_list_imgimg);
                    	order_comment_p.appendChild(order_comment_p_p);

                    	order_list_cla.appendChild(order_list_img);
                    	order_list_cla.appendChild(order_comment_p);

                    	order_list_cla_a.appendChild(order_list_cla);



                    	all_order.appendChild(order_list_cla_a);
                    	all_order.appendChild(margin_order_yo);


                    }







                }


                var count_one = 0

                if (Array.isArray(list) && list.length > 0) {
                    var yarukoto = document.getElementById('yarukoto');
                    yarukoto.innerHTML = '';

                    count_one = list.length;

                    console.log("実行してる？1");


                    document.querySelectorAll('#notification').forEach(function(element) {
                        element.style.display = 'block';
                    });

                    document.querySelectorAll('.yarukoto_main').forEach(function(element) {
                        element.style.display = 'block';
                    });


                    for (var i = list.length - 1; i >= 0; i--){
                    	var order_list_cla_a = document.createElement('a');
                    	var order_list_cla = document.createElement('div');
                    	var order_list_img = document.createElement('div');
                    	var order_list_imgimg = document.createElement('img');

                    	var order_comment_p = document.createElement('div');
                    	var order_comment_p_p = document.createElement('p');

                    	var margin_order_yo = document.createElement('div');


                    	order_list_imgimg.src = list[i].image_data;
                    	order_list_imgimg.alt = list[i].item_name;




                    	order_list_cla_a.className = 'atagu'

                    		console.log('カウント:', list[i].item_id);

                    	//var item_id = response[i].item_id;
                    	var user_name_name = list[i].user_name;


                    	//order_list_cla_a.href = "../kakugari/tesuto?item_id="+list[i].item_id +"&user_name=" +list[i].user_id ;
                    	console.log(list3);
                    	let found = false;

                    	for (let a = 0; a < list3.length; a++) {
                    	    if (list3[a].itemId === list[i].item_id) {
                    	        order_list_img.className = 'order_img1';
                    	        order_comment_p_p.textContent = "受取評価が完了しました。"
                    	        found = true;
                    	        count_one--;
                    	        break;
                    	    }
                    	}

                    	if (!found) {
                    		order_comment_p_p.textContent = list[i].user_name + "　さんが「" + list[i].item_name + "」を発送しました。商品が届いたら、受取評価をしてください。";
                    		order_list_cla_a.href = "../judge/judge.jsp?item_id="+list[i].item_id;
                    	    order_list_img.className = 'order_img';
                    	}



                    	order_comment_p.className = 'order_comment';
                    	order_list_cla.className = 'order_list';
                    	margin_order_yo.className = 'margin_order';



                    	order_list_img.appendChild(order_list_imgimg);
                    	order_comment_p.appendChild(order_comment_p_p);

                    	order_list_cla.appendChild(order_list_img);
                    	order_list_cla.appendChild(order_comment_p);

                    	order_list_cla_a.appendChild(order_list_cla);



                    	all_order.appendChild(order_list_cla_a);
                    	all_order.appendChild(margin_order_yo);


                    }







                }



                // レスポンスが配列かどうか確認
                if (Array.isArray(response) && response.length > 0) {
                    var yarukoto = document.getElementById('yarukoto');
                    yarukoto.innerHTML = '';

                    count = response.length;

                    console.log("実行してる？");


                    document.querySelectorAll('#notification').forEach(function(element) {
                        element.style.display = 'block';
                    });

                    document.querySelectorAll('.yarukoto_main').forEach(function(element) {
                        element.style.display = 'block';
                    });



                    for (var i = response.length - 1; i >= 0; i--){
                    	var order_list_cla_a = document.createElement('a');
                    	var order_list_cla = document.createElement('div');
                    	var order_list_img = document.createElement('div');
                    	var order_list_imgimg = document.createElement('img');

                    	var order_comment_p = document.createElement('div');
                    	var order_comment_p_p = document.createElement('p');

                    	var margin_order_yo = document.createElement('div');


                    	order_list_imgimg.src = response[i].image_data;
                    	order_list_imgimg.alt = response[i].item_name;




                    	order_list_cla_a.className = 'atagu'

                    		console.log('カウント:', response[i].item_id);

                    	//var item_id = response[i].item_id;
                    	var user_name_name = response[i].user_name;

                    	console.log(list_co);
                    	let found = false; // 一致したかどうかのフラグ

                    	for (let a = 0; a < list_co.length; a++) {
                    	    if (list_co[a].item_id === response[i].item_id) {
                    	        console.log("一致:", list_co[a].item_id);
                    	        order_list_img.className = 'order_img1';
                    	        order_comment_p_p.textContent = "発送が完了しました。"
                    	        found = true; // 一致したらフラグを `true` にする
                    	        count--;
                    	        break; // ループを抜ける
                    	    }
                    	}

                    	if (!found) {
                    		order_comment_p_p.textContent = response[i].user_name + "　さんが「" + response[i].item_name + "」を購入しました。内容を確認の上、発送をお願いします。";
                    	    order_list_cla_a.href = "../main_kakugari/order.jsp?item_id=" + response[i].item_id + "&user_name=" + response[i].user_id + "&user_naname=" + response[i].user_name;
                    	    order_list_img.className = 'order_img';
                    	}




                    	order_comment_p.className = 'order_comment';
                    	order_list_cla.className = 'order_list';
                    	margin_order_yo.className = 'margin_order';



                    	order_list_img.appendChild(order_list_imgimg);
                    	order_comment_p.appendChild(order_comment_p_p);

                    	order_list_cla.appendChild(order_list_img);
                    	order_list_cla.appendChild(order_comment_p);

                    	order_list_cla_a.appendChild(order_list_cla);



                    	order_all.appendChild(order_list_cla_a);
                    	order_all.appendChild(margin_order_yo);


                    }






                }





                console.log('カウント:', count);
                console.log('カウント:', count_one);



                var count_new = count + count_one + count_two;

                console.log('カウント:', count_new);

                var count_list = document.createElement('div');
                count_list.textContent = count_new;
                count_list.className = 'count';

                if (yarukoto) {
                    yarukoto.appendChild(count_list);
                } else {
                    console.error("yarukotoが見つかりません");
                }

                if (count_new === 0) {

                	console.log("実行してる？3");

                    document.querySelectorAll('#notification').forEach(function(element) {
                        element.style.display = 'none';
                    });

                    document.querySelectorAll('.yarukoto_main').forEach(function(element) {
                        element.style.display = 'none';
                    });
                }
            } catch (e) {
                console.error('JSONパースエラー:', e.message);
            }
        },
        error: function(xhr, status, error) {
            console.error('エラー:', status, error);
            console.log('レスポンス内容:', xhr.responseText);
            document.querySelectorAll('#notification').forEach(function(element) {
                element.style.display = 'none';
            });

            document.querySelectorAll('.yarukoto_main').forEach(function(element) {
                element.style.display = 'none';
            });
        }
    });
}

		let button1 = document.getElementById("bu1_1");
		document.getElementById("showOrderList").addEventListener("click", function(event) {
		    event.preventDefault(); // aタグのデフォルトの動作を無効化
		    const orderList = document.querySelector(".order_list_main");
		    if (orderList.style.display === "none" || orderList.style.display === "") {
		        orderList.style.display = "block"; // 表示
		        button1.classList.add("active");

		    } else {
		        orderList.style.display = "none"; // 非表示
		    }
		});



</script>
</header>
<!-- 各ページのコンテンツが入る部分 -->
<div id="content">
<!-- ページ固有のコンテンツがここに入ります -->
</div>
</body>
</html>