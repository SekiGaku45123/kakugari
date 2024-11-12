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
           z-index: 9999;
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
</style>
</head>
<body>
<header>


	<h2><a href="../main_kakugari/all"><img src="../images/読書のアイコン.png" width="66" height="46"><span class="kakuspa"> カクガリ</span></a></h2>
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
		        <a href="../login_logout/login-in.jsp"><img src="../kakugari_image/888.png" class="images4"></a>
		        <!--  <a href="../login_logout/login-in.jsp">ログイン</a>-->
		        <!--<a href="../main_kakugari/signup.jsp">新規登録</a>-->
		    </div>
    		<div class="login_in" style="<%= isLoggedIn ? "" : "display: none;" %>">
        		<a href="#" class="openLink"><img src="../kakugari_image/1023.png" class="images0"></a>
		    	<div class="overlay"></div>
		    	<div class="menu_slide">
			        <a href="#" class="closeLink"><img src="../kakugari_image/太いバツのアイコン2.png"></a>
			        <div>
			        	<form action="${pageContext.request.contextPath}/kakugari/productsearch" method="post" class="formm">
			        	<input type="text" name="keyword" placeholder="　検索" class="sa-tin">
			        	<div class="waku">
			        	<button type="submit" value="" class="botan"><img src="../kakugari_image/1023.png"></button>
			        	</div>
			        	</form>
			        </div>
			    </div>
		        <a href="${pageContext.request.contextPath}/kakugari/favoritesearch"><img src="../kakugari_image/8760.png" class="images1"></a>
		        <a href="${pageContext.request.contextPath}/history"><img src="../kakugari_image/9654.png" class="images2"></a>
		        <a href="../contact/contact.jsp"><img src="../kakugari_image/10894.png" class="images3"></a>
		        <a href="../login_logout/logout"><img src="../kakugari_image/888.png" class="images4"></a>
		</div>
    </div>
<script type="text/javascript">
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
</script>
</header>
<!-- 各ページのコンテンツが入る部分 -->
<div id="content">
<!-- ページ固有のコンテンツがここに入ります -->
</div>
</body>
</html>