<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css" />
<style>

#bar {
  position: relative;
  height: 46px;
  width: 46px;
  display: inline-block;
  box-sizing: border-box;
  background-color: #fff;
  border: 2px solid #444;
  border-radius: 4px;
}
#bar div {
  position: absolute;
  left: 7px;
  height: 2px;
  width: 28px;
  background-color: #444;
  border-radius: 2px;
  display: inline-block;
  box-sizing: border-box;
}
#bar div:nth-of-type(1) {
  bottom: 10px;
}
#bar div:nth-of-type(2) {
  bottom: 20px;
}
#bar div:nth-of-type(3) {
  bottom: 30px;
}


#bar {
  color: blue; /* 文字の色 */
  cursor: pointer; /* マウスポインタを手の形にする */
}

#bar:hover {
  color: darkblue; /* ホバー時の色 */
}

</style>
</head>
<body>
<header>
 <h2><img src="../images/kakugari.png" width="66" height="77"><span class="kakuspa">カクガリ</span></h2>
 <input type="text" id="search" name="name" size="30" placeholder="なにをお探しですか？" />
 <div id="bar">
  <div></div>
  <div></div>
  <div></div>
</div>
 <nav id="menu">
 	<ul>
	 	<li><a href="#">ホーム１</a></li>
	 	<li><a href="#">ホーム２</a></li>
	 	<li><a href="#">ホーム３</a></li>
	 	<li><a href="#">ホーム４</a></li>
 	</ul>
 </nav>
 </header>
</body>
</html>