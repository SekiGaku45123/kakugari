<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>取引評価</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/style.css">
<style>
       body {
           margin: 0;
           padding: 0;
           font-family: 'Arial', sans-serif;
           background-color: #f9f9f9;
           min-height: 100vh;
           display: flex;
           flex-direction: column;
       }
       .content {
           flex: 1;
           display: flex;
           justify-content: center;
           align-items: center;
           padding: 20px;
       }
       .container {
           background: #ffffff;
           padding: 20px;
           border-radius: 10px;
           box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
           max-width: 600px;
           width: 100%;
       }
       h1 {
           text-align: center;
           color: #333333;
           margin-bottom: 20px;
       }
       label {
           font-weight: bold;
           color: #555555;
           display: block;
           margin-bottom: 10px;
       }
       .radio-group {
           display: flex;
           justify-content: space-evenly;
           margin-bottom: 20px;
       }
       .radio-group label {
           display: flex;
           align-items: center;
           gap: 10px;
           font-size: 16px; /* ラベル文字の大きさを調整 */
           padding: 10px 20px;
           border: 1px solid #cccccc;
           border-radius: 5px;
           background-color: #f0f0f0;
           cursor: pointer;
       }
       .radio-group input[type="radio"] {
           display: none;
       }
       .radio-group input[type="radio"]:checked + label {
           background-color: #d6f5d6;
           border-color: #4CAF50;
       }
       textarea {
           width: 100%;
           padding: 10px;
           border: 1px solid #cccccc;
           border-radius: 5px;
           resize: none;
           margin-bottom: 20px;
       }
       button {
           background-color: #4CAF50;
           color: white;
           padding: 10px;
           border: none;
           border-radius: 5px;
           cursor: pointer;
           font-size: 14px;
           display: block;
           width: 100%; /* コメント入力エリアと同じ幅 */
           box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
           transition: background-color 0.3s ease;
       }
       button:hover {
           background-color: #45a049;
       }
</style>
</head>
<body>
<!-- ヘッダー -->



<jsp:include page="/common/base.jsp" />
<!-- メインコンテンツ -->
<div class="content">
<div class="container">
<h1>取引評価</h1>
<form action="${pageContext.request.contextPath}/JudgeServlet" method="post">
<%String item_id=request.getParameter("item_id"); %>
<input type="hidden" name="item_id" value=<%=item_id %>>
<!-- itemIdを隠しフィールドとして送信 -->
<input type="hidden" name="itemId" value="${param.itemId}" />
<!-- 評価選択 -->
<label for="evaluate">評価:</label>
<div class="radio-group">
<input type="radio" id="good" name="evaluate" value="true" required>
<label for="good">Good👍</label>
<input type="radio" id="bad" name="evaluate" value="false">
<label for="bad">Bad👎</label>
</div>
<!-- コメント入力 -->
<label for="comment">コメント:</label>
<textarea name="comment" id="comment" rows="4" placeholder="ここにコメントを入力してください..." required></textarea>
<!-- 送信ボタン -->
<button type="submit">送信</button>
</form>
</div>
</div>
<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
    <script>
        alert("${errorMessage}");
    </script>
<%
        // 表示後、セッションから削除
        session.removeAttribute("errorMessage");
    }
%>
<!-- フッター -->
<jsp:include page="/footer.html" />
</body>
</html>