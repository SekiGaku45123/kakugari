<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        margin-top: 20px;
    }
    h2, h3 {
        color: #333;
    }
    button {
        width: 100%;
    }
</style>

<div class="container my-5">
    <h2 class="mb-4 text-center">商品リスト</h2>

    <hr>

    <h3 class="mb-3">購入情報入力</h3>

<form action="Purchaseaction" method="post">
    <div class="form-group">
        <label for="name">お名前</label>
        <input type="text" class="form-control" id="name" name="name"
               placeholder="お名前を入力してください"
               value="${customer.getUser_name()}" required>
    </div>

    <div class="form-group">
        <label for="address">ご住所</label>
        <input type="text" class="form-control" id="address" name="address"
               placeholder="ご住所を入力してください"
               value="${customer.getUser_address()}" required>
    </div>

<div class="form-group">
    <label>支払い方法</label><br>

    <!-- クレジットカード -->
    <div class="form-check">
        <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="クレジットカード" checked onclick="toggleCreditCardInfo()">
        <label class="form-check-label" for="creditCard">クレジットカード</label>
    </div>

    <!-- 銀行振込 -->
    <div class="form-check">
        <input class="form-check-input" type="radio" name="paymentMethod" id="bankTransfer" value="銀行振込" onclick="toggleCreditCardInfo()">
        <label class="form-check-label" for="bankTransfer">銀行振込</label>
    </div>

    <!-- 代金引換 -->
    <div class="form-check">
        <input class="form-check-input" type="radio" name="paymentMethod" id="cashOnDelivery" value="代金引換" onclick="toggleCreditCardInfo()">
        <label class="form-check-label" for="cashOnDelivery">代金引換</label>
    </div>

    <!-- コンビニ支払い -->
    <div class="form-check">
        <input class="form-check-input" type="radio" name="paymentMethod" id="convenienceStore" value="コンビニ支払い" onclick="toggleCreditCardInfo()">
        <label class="form-check-label" for="convenienceStore">コンビニ支払い</label>
    </div>
</div>

<!-- クレジットカード情報入力欄 -->
<div id="creditCardInfo" style="display: none;">
    <h5>クレジットカード情報</h5>
    <div class="form-group">
        <label for="cardNumber">カード番号</label>
        <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="カード番号を入力してください">
    </div>
    <div class="form-group">
        <label for="expiryDate">有効期限</label>
        <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY">
    </div>
    <div class="form-group">
        <label for="cvv">CVV</label>
        <input type="text" class="form-control" id="cvv" name="cvv" placeholder="CVVを入力してください">
    </div>
</div>

<script>
    function toggleCreditCardInfo() {
        // 「クレジットカード」ラジオボタンがチェックされているかを確認
        const isCreditCardSelected = document.getElementById("creditCard").checked;
        const creditCardInfo = document.getElementById("creditCardInfo");

        // クレジットカード選択時のみ表示
        creditCardInfo.style.display = isCreditCardSelected ? "block" : "none";
    }

    // ページが読み込まれた時に初期化
    document.addEventListener("DOMContentLoaded", toggleCreditCardInfo);
</script>

        <button type="submit" class="btn btn-danger">購入する</button>
    </form>
</div>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
