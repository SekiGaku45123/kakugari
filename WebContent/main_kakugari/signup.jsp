<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.html" %>

<!-- Bootstrap CSS読み込み -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans JP', sans-serif;
        background-color: #f9f9f9;
    }
    .container {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 40px;
    }
    h2 {
        color: #333;
    }
    button {
        width: 100%;
    }
</style>

<div class="container">
    <h2 class="text-center mb-4">新規登録</h2>
    <form action="../main_kakugari/signup" method="post">  <!-- URLマッピングを修正 -->
        <div class="form-group">
            <label for="name">名前:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="お名前を入力してください" required>
        </div>

        <div class="form-group">
            <label for="hurigana">フリガナ:</label>
            <input type="text" class="form-control" id="hurigana" name="hurigana" placeholder="フリガナを入力してください" required>
        </div>

        <div class="form-group">
            <label for="address">住所:</label>
            <input type="text" class="form-control" id="address" name="address" placeholder="住所を入力してください" required>
        </div>

        <div class="form-group">
            <label for="password">パスワード:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="パスワードを入力してください" required>
        </div>

        <div class="form-group">
            <label for="maleaddress">メールアドレス:</label>
            <input type="email" class="form-control" id="maleaddress" name="maleaddress" placeholder="メールアドレスを入力してください" required>
        </div>
                <div class="form-group">
            <label for="telephone">電話番号:</label>
            <input type="text" class="form-control" id="telephone" name="telephone" placeholder="電話番号を入力してください" required>
        </div>

        <button type="submit" class="btn btn-danger">登録</button> <!-- 赤いボタンに変更 -->
    </form>
</div>

<%@ include file="../footer.html" %>

<!-- Bootstrap JavaScript読み込み -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
