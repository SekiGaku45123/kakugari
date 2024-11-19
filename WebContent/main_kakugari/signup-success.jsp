<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, java.net.URLEncoder" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録完了画面 - カクガリ</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css">

<c:import url="/common/base.jsp" />
    <!-- base.jspをインポート -->

    <style>
        body {
            background-color: #f8f9fa;
        }

        /* ページ全体を調整し、メニューと重ならないようにする */
        .page-container {
            padding-top: 0px; /* メニューの高さ分余白を確保 */
        }

        .completion-container {
            text-align: center;
            margin: 5% auto;
            padding: 40px;
            max-width: 600px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .completion-icon {
            font-size: 80px;
            color: #28a745;
        }

        .completion-message {
            margin-top: 20px;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .completion-details {
            margin-top: 15px;
            font-size: 16px;
            color: #555;
        }

        .btn-container {
            margin-top: 30px;
        }

        .btn-container .btn {
            margin: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }
    </style>
</head>
	<body>
	    <!-- base.jspが提供するメインメニューと重ならないよう調整 -->
	    <div class="page-container">
	        <div class="completion-container">
	            <div class="completion-icon">✔</div>
	            <p class="completion-message">登録が完了しました！</p>
	            <p class="completion-details">登録ありがとうございます。これから素晴らしいカクガリをお楽しみください。</p>
	            <div class="btn-container">
	                <a href="../login_logout/login-in.jsp" class="btn btn-primary">ログイン</a>
	                <a href="../main_kakugari/all" class="btn btn-secondary">トップページに戻る</a>
	            </div>
	        </div>
	    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<jsp:include page="/footer.html" />
