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

#bar {
 display: flex;
 border: 1px solid #ffc954;
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
 <div id="bar">
    <img src="../icon_image/アイコン.png" alt="アイコン画像" >
</div>
 <nav id="menu">
 	<ul>
	 	<li class="header-nav__item"><a href="../main_kakugari/all">ホーム１</a></li>
	 	<li class="header-nav__item"><a href="../main_kakugari/1.jsp">ホーム２</a></li>
	 	<li class="header-nav__item"><a href="../main_kakugari/2.jsp">ホーム３</a></li>
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