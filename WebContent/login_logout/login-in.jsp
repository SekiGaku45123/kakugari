<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- base.jspをインクルードしてヘッダーとフッターを共通化 -->


<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ログインページ - カクガリ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <c:import url="/common/base.jsp" />

    <style>
        /* 共通スタイルの適用 */
        .login-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            padding: 20px;
            background-color: #ffffff; /* 白背景 */
        }
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background: #ffffff; /* 内側ボックスも白背景 */
            border: 2px solid #ccc; /* ボーダー */
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .login-container h2 {
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
        .login-container .text-muted {
            font-size: 1em;
            color: #666;
            margin-bottom: 20px;
        }
        .login-form .form-group {
            margin-bottom: 15px;
        }
        .login-form .form-group label {
            float: left;
            font-weight: 600;
            color: #333;
        }
        .login-form .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .login-form .btn-primary {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            font-weight: bold;
            background-color: #007bff;
            border: none;
        }
        .login-form .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="login-wrapper">
    <div class="login-container">
        <h2>ログイン</h2>
        <p class="text-muted">アカウントにサインインしてください</p>
        <div><font color="#ff9514" size="2">${error}</font></div>


        <form action="Login.action" method="post" class="login-form" id="login-form">
            <div class="form-group">
                <label for="email">メールアドレス</label>
                <input type="text" id="email" name="maleaddress" placeholder="例: kakugari@botton.com" value="${param.maleaddress}" required>

            </div>

            <div class="form-group">
                <label for="password">パスワード</label>
                <input type="password" id="password" name="password" placeholder="パスワードを入力" required>
            </div>

            <div class="form-group">
                <input type="submit" value="ログイン" class="btn btn-primary">
            </div>
        </form>
    </div>
</div>

<jsp:include page="/footer.html" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
