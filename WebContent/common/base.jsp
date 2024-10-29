<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&family=Noto+Serif+JP:wght@200..900&family=Zen+Maru+Gothic&display=swap" rel="stylesheet">
<style>

header {
  position: sticky; /* スティッキーに設定 */
  top: 0; /* スクロール時に上部に固定 */
  width: auto; /* 幅を自動設定 */
  margin: 5px auto; /* マージンを自動設定 */
  text-decoration: underline;
  background-color:white;
  text-decoration-color: #000000;
  z-index: 9999; /* 必要に応じてz-indexを設定 */
}

header::after {
  content: '';
  display: block;
  width: 100%;
  height: 1.5px; /* 高さを調整 */
  background-color: #e3e3e3; /* ボーダーの色を指定 */
  position: absolute;
  bottom: -1px; /* 下に配置 */
  left: 0; /* 左に配置 */
}

header h2 {
  font-family: "あめちゃんポップ　まる Light";
  font-size: 20px;
  float: left;
  margin: 5px 0 10px 20px;
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

header #menu ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

header #menu ul li {
  width: 19.8%;
  float: left;
  margin-right: 1px;
  text-align: center;
}

header #menu ul li a {
  font-family: "HGS創英角ｺﾞｼｯｸUB";
  display: block;
  padding: 16px;
  color: #969696;
  text-decoration: none;
}

header #menu ul li a:hover {
  background-color: #f0f0f0;
}



/*分ける*/

 .login_in{
 display: inline-block;
  border-width:1px;
  margin: 14px 0 0 40px;
  border-color: darkgray;
  text-decoration: none;

 }
 .login_in a{
  width: 100%;
  padding: 10px 20px;
  color: #525252;
  font-weight: 900;
  border-radius: 5px 5px;
   text-decoration: none;
 }


}

#bar {
 display: flex;
 border: 1px solid FF9933;
 background: white;
 border-radius: 50% 50%;
}
#bar img {
  border-radius: 50% 50% 50% 50%;
  object-fit: contain;
  width:60px;
  height:60px;
}


#bar {
  color: blue; /* 文字の色 */
  cursor: pointer; /* マウスポインタを手の形にする */
}

#bar:hover {
  color: darkblue; /* ホバー時の色 */
}

header #menu ul li.header-nav__item.current a {
	border-bottom: 3px solid #ffa759;
	background-color: white;
	color: #ffa759;
}

header #menu ul li.header-nav__item.current a:hover {
	background-color: #f0f0f0;
	color: #ffa759;
}
</style>
</head>
<body>
<header>
 <h2><img src="../images/kakugari.png" width="66" height="46"><span class="kakuspa">　カクガリ</span></h2>
 <input type="text" id="search" name="name" size="30" placeholder="なにをお探しですか？" />
 <div class="login_in">
  <a href="../login_logout/login-in.jsp">ログイン</a>
  <a href="../main_kakugari/signup.jsp">新規登録</a>
 </div>
 <!-- <div id="bar">
    <img src="../icon_image/main_icon.png" alt="アイコン画像" >
</div> -->
 <nav id="menu">
 	<ul>
	 	<li class="header-nav__item"><a href="../main_kakugari/all">ホーム１</a></li>
	 	<li class="header-nav__item"><a href="../main_kakugari/1.jsp">${customer.getUser_name()}さん</a></li>
	 	<li class="header-nav__item"><a href="../main_kakugari/2.jsp">お気に入り一覧</a></li>
	     <li class="header-nav__item">
    <a href="${pageContext.request.contextPath}/main_kakugari/rirekinasi.jsp">購入履歴</a>
</li>

	 	<li class="header-nav__item"><a href="../main_kakugari/4.jsp">ホーム５</a></li>
 	</ul>
 </nav>
<script type="text/javascript">
	const links = document.querySelectorAll(".header-nav__item > a");

	links.forEach(function (link) {
	    if (link.href === location.href) {
	        link.closest(".header-nav__item").classList.add("current");
	    }
	});
</script>
 </header>
</body>
</html>