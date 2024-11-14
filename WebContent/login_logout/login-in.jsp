<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- base.jspをインクルードしてヘッダーとフッターを共通化 -->
<c:import url="/common/base.jsp" />


<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ログインページ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styling for the login form */
        .login-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            padding: 20px;
            background-color: #f8f9fa;
        }
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .login-container h2 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #333;
        }
        .login-container .text-muted {
            font-size: 0.9em;
            color: #666;
            margin-bottom: 20px;
        }
        .login-form .form-group {
            margin-bottom: 15px;
        }
        .login-form .form-group label {
            float: left;
            font-weight: 500;
        }
        .login-form .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }
        .login-form .btn-primary {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            font-weight: 600;
            background-color: #007bff;
            border-color: #007bff;
        }
        .login-form .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="login-wrapper">
    <div class="login-container">
        <h2>ログイン</h2>
        <p class="text-muted">アカウントにサインインしてください</p>

        <form action="Login.action" method="post" class="login-form">
            <div class="form-group">
                <label for="email">メールアドレス</label>
                <input type="text" id="email" name="maleaddress" placeholder="例: example@example.com" required>
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
