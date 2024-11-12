<%@ page contentType="text/html; charset=UTF-8" %>

<!-- CSSを内部スタイルとして埋め込み -->
<style>
    /* ベーススタイル */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* 中央配置のためのラッパー */
    .login-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100vh;
        background-color: #f0f2f5;
    }

    /* ログインフォームのコンテナ */
    .login-container {
        background-color: #fff;
        padding: 40px;
        width: 100%;
        max-width: 400px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        border-radius: 8px;
        text-align: center;
        border: 1px solid #ddd;
    }

    .login-container h2 {
        font-size: 28px;
        color: #333;
        margin-bottom: 10px;
    }

    .text-muted {
        font-size: 14px;
        color: #777;
        margin-bottom: 30px;
    }

    /* フォームスタイル */
    .login-form .form-group {
        margin-bottom: 20px;
        text-align: left;
    }

    .login-form label {
        font-size: 14px;
        color: #555;
    }

    .login-form input[type="text"],
    .login-form input[type="password"] {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 5px;
    }

    .login-form input[type="submit"] {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .login-form input[type="submit"]:hover {
        background-color: #45a049;
    }

    /* メディアクエリ（レスポンシブ対応） */
    @media (max-width: 500px) {
        .login-container {
            padding: 20px;
        }
    }
</style>

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

