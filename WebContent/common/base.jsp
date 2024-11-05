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

		#closeLink {
			float: right; /* 右寄せ */
			padding:0;
		    display: block; /* aタグをブロック要素にしてサイズを指定 */
		    width: 35px;
		    overflow: hidden; /* はみ出た部分を隠す */
		}

		#closeLink img {
		    width: 100%; /* aタグの幅に合わせる */
		    height: auto; /* 高さは自動調整 */
		    object-fit: cover; /* 画像を枠に収める */
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
		    display: block; /* オーバーレイを表示 */
		}
</style>
</head>
<body>
<header>

	<h2><a href="../main_kakugari/all"><img src="../images/読書のアイコン.png" width="66" height="46"><span class="kakuspa"> カクガリ</span></a></h2>
		<div class="logout-content">
		    <div class="login_in" style="<%= isLoggedIn ? "display: none;" : "" %>">
		    	<a href="#" id="openLink"><img src="../kakugari_image/1023.png" class="images0"></a>
		    	<div id="overlay" class="overlay"></div>
		    	<div id="slideMenu" class="menu_slide">
			        <a href="#" id="closeLink"><img src="../kakugari_image/太いバツのアイコン2.png"></a>
			        <p>おれはジャイアン櫻井翔</p>
			    </div>
		        <a href="${pageContext.request.contextPath}/kakugari/favoritesearch"><img src="../kakugari_image/8760.png" class="images1"></a>
		        <!--<a href="${pageContext.request.contextPath}/history"><img src="../kakugari_image/9654.png" class="images2"></a>-->
		        <a href="../contact/contact.jsp"><img src="../kakugari_image/10894.png" class="images3"></a>
		        <a href="#"><img src="../kakugari_image/888.png" class="images4"></a>
		        <!--  <a href="../login_logout/login-in.jsp">ログイン</a>-->
		        <!--<a href="../main_kakugari/signup.jsp">新規登録</a>-->
		    </div>
    		<div class="login_in" style="<%= isLoggedIn ? "" : "display: none;" %>">
        		<a href="#" id="openLink"><img src="../kakugari_image/1023.png" class="images0"></a>
        		<div id="overlay" class="overlay"></div>
        		<div id="slideMenu" class="menu_slide">
			        <a href="#" id="closeLink">×</a>
			        <p>おれはジャイアン櫻井翔</p>
			    </div>
		        <a href="${pageContext.request.contextPath}/kakugari/favoritesearch"><img src="../kakugari_image/8760.png" class="images1"></a>
		        <a href="${pageContext.request.contextPath}/history"><img src="../kakugari_image/9654.png" class="images2"></a>
		        <a href="../contact/contact.jsp"><img src="../kakugari_image/10894.png" class="images3"></a>
		        <a href="#"><img src="../kakugari_image/888.png" class="images4"></a>
		</div>
    </div>
<script type="text/javascript">
       const links = document.querySelectorAll(".header-nav__item > a");
       links.forEach(function (link) {
           if (link.href === location.href) {
               link.closest(".header-nav__item").classList.add("current");
           }
       });

       document.getElementById("openLink").addEventListener("click", function(event) {
    	    event.preventDefault(); // デフォルトのリンク動作を無効化
    	    document.getElementById("slideMenu").classList.add("open");
    	    document.getElementById("overlay").classList.add("active");
       });

    	document.getElementById("closeLink").addEventListener("click", function(event) {
    	    event.preventDefault(); // デフォルトのリンク動作を無効化
    	    document.getElementById("slideMenu").classList.remove("open");
    	    document.getElementById("overlay").classList.remove("active");
    	});
</script>
</header>
<!-- 各ページのコンテンツが入る部分 -->
<div id="content">
<!-- ページ固有のコンテンツがここに入ります -->
</div>
</body>
</html>