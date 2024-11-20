<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>評価ページ</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css">
<c:import url="/common/base.jsp" /> <!-- base.jspをインクルード -->
<style>
       /* 基本設定 */
       body {
           font-family: 'Helvetica Neue', Arial, sans-serif;
           background-color: #f4f8fb;
           margin: 0;
           display: flex;
           flex-direction: column;
           min-height: 100vh;
       }
       /* ヘッダー */
       .header {
           background-color: #007BFF;
           color: white;
           padding: 20px 0;
           font-size: 24px;
       }
       .header a {
           color: white;
           text-decoration: none;
           font-weight: bold;
       }
       .header a:hover {
           text-decoration: underline;
       }
       /* 評価コンテナ */
       .evaluation-container {
           text-align: center;
           background: #ffffff;
           border-radius: 12px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           padding: 40px 30px;
           max-width: 500px;
           width: 90%;
           margin: 40px auto;
       }
       .evaluation-title {
           font-size: 24px;
           font-weight: bold;
           color: #333333;
           margin-bottom: 20px;
       }
       .evaluation-description {
           font-size: 16px;
           color: #666666;
           margin-bottom: 30px;
       }
       .evaluation-buttons {
           display: flex;
           justify-content: space-between;
       }
       .evaluation-button {
           width: 140px;
           height: 140px;
           border: none;
           border-radius: 50%;
           cursor: pointer;
           font-size: 18px;
           font-weight: bold;
           color: #ffffff;
           display: flex;
           align-items: center;
           justify-content: center;
           transition: all 0.3s ease-in-out;
       }
       .evaluation-button:hover {
           transform: scale(1.1);
           box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
       }
       .good-button {
           background: linear-gradient(135deg, #4caf50, #81c784);
       }
       .bad-button {
           background: linear-gradient(135deg, #f44336, #e57373);
       }
       /* フッター */
       .footer {

           color: white;
           text-align: center;
           padding: 15px 0;
           position: relative;
           bottom: 0;
           width: 100%;
       }
       .footer a {
           color: #f1f1f1;
           text-decoration: none;
       }
       .footer a:hover {
           color: #ffcc00;
       }
       .evaluation-footer {
           margin-top: 20px;
           font-size: 14px;
           color: #999999;
       }
       .evaluation-footer a {
           color: #007BFF;
           text-decoration: none;
           transition: color 0.2s;
       }
       .evaluation-footer a:hover {
           color: #0056b3;
       }
</style>
</head>
<body>
<!-- 評価コンテナ -->
<div class="evaluation-container">
<div class="evaluation-title">取引の評価をお願いします</div>
<div class="evaluation-description">この取引が良いか悪いか、率直なご意見をお聞かせください。</div>
<form action="${pageContext.request.contextPath}/evaluate" method="post">
<div class="evaluation-buttons">
<button class="evaluation-button good-button" name="evaluation" value="Good">Good👍</button>
<button class="evaluation-button bad-button" name="evaluation" value="Bad">Bad👎</button>
</div>
</form>
<div class="evaluation-footer">
<p>お困りの場合は<a href="${pageContext.request.contextPath}/contact/contact.jsp">こちら</a>からお願いします。</p>
</div>
</div>
<!-- フッター -->
<div class="footer">
<jsp:include page="/footer.html" />
</body>
</html>