<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.html" %>
<%@ include file="../common/base.jsp" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>エラー - ログイン失敗</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Styling for error message box */
        .error-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            text-align: center;
            background-color: #ffffff; /* Set background to white */
            color: #333;
        }
        .error-container {
            max-width: 600px;
            padding: 20px;
            background: #ffffff; /* Set inner box background to white */
            border: 2px solid #ccc; /* Gray border around the message box */
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
        .error-message {
            font-size: 1.5em;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
        }
        .error-details {
            font-size: 1.2em;
            color: #666;
            margin-bottom: 20px;
        }
        .btn-back {
            font-size: 1.1em;
            font-weight: 600;
            color: #fff;
            background-color: #007bff; /* Blue button for back */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="error-wrapper">
    <div class="error-container">
        <p class="error-message">ログイン名またはパスワードが違います。</p>
        <p class="error-details">入力内容を確認し、再度ログインしてください。</p>
        <button class="btn-back" onclick="resetForm()">ログイン画面に戻る</button>
    </div>
</div>

<jsp:include page="/footer.html" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function resetForm() {
        // メールアドレスはそのままにし、パスワードだけリセットする
        var emailValue = document.getElementById('email') ? document.getElementById('email').value : ''; // 入力されたメールアドレスを取得
        window.location.href = 'login-in.jsp?email=' + encodeURIComponent(emailValue);  // メールアドレスをURLパラメータとして渡す
    }
</script>

</body>
</html>
