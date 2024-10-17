<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header.html" %>

<!-- Bootstrap CSS読み込み -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans JP', sans-serif;
        background-color: #f9f9f9; /* 背景色を薄いグレーに */
    }
    .container {
        background-color: #ffffff; /* フォームの背景を白に */
        border-radius: 8px; /* 角を丸く */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 影をつけて浮き上がる印象 */
        padding: 20px; /* パディングを追加 */
        margin-top: 20px; /* 上部にマージンを追加 */
    }
    h2, h3 {
        color: #333; /* 見出しの色 */
    }
    button {
        width: 100%; /* ボタンを全幅に */
    }
</style>
<c:import url="/common/base.jsp">
</c:import>
<div class="container my-5">
    <h2 class="mb-4 text-center">商品リスト</h2>

    <hr>

    <!-- フォームのデザイン -->
    <h3 class="mb-3">購入情報入力</h3>
    <form action="Purchaseaction" method="post">
        <div class="form-group">
            <label for="name">お名前</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="お名前を入力してください" required>
        </div>

        <div class="form-group">
            <label for="address">ご住所</label>
            <input type="text" class="form-control" id="address" name="address" placeholder="ご住所を入力してください" required>
        </div>

        <!-- 支払い方法選択 -->
        <div class="form-group">
            <label>支払い方法</label><br>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="クレジットカード" checked>
                <label class="form-check-label" for="creditCard">
                    クレジットカード
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="bankTransfer" value="銀行振込">
                <label class="form-check-label" for="bankTransfer">
                    銀行振込
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="cashOnDelivery" value="代金引換">
                <label class="form-check-label" for="cashOnDelivery">
                    代金引換
                </label>
            </div>
        </div>

        <button type="submit" class="btn btn-danger">購入を確定</button>
    </form>
</div>

<%@include file="../footer.html" %>

<!-- Bootstrap JavaScript読み込み -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
