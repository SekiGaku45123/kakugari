<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.html" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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

        <input type="hidden" name="item_id" value="<% String Year = request.getParameter("item_id"); %><%= Year %>">
        <input type="hidden" name="flag" value="<% String flag = request.getParameter("flag"); %><%= flag %>">
        <input type="hidden" name="image_data" value="<% String image_data = request.getParameter("image_data"); %><%= image_data %>">

        <div class="form-group">
            <label for="address">ご住所</label>
            <input type="text" class="form-control" id="address" name="address"
                   placeholder="ご住所を入力してください"
                   value="${customer.getUser_address()}" required>
        </div>

        <div class="form-group">
            <label>支払い方法</label><br>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="クレジットカード" checked onclick="toggleCreditCardInfo()">
                <label class="form-check-label" for="creditCard">クレジットカード</label>
                <a href="../main_kakugari/credit_register.jsp">
                    <button type="button" class="btn btn-primary w-100">
                        <font color="white">クレジットカード登録へ</font>
                    </button>
                </a>
            </div>
            <p id="text">"${credit.getCredit_()}"</p>
            <button onclick="unmaskText()">最初の12文字をマスクする</button>

			</div>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="bankTransfer" value="銀行振込" onclick="toggleCreditCardInfo()">
                <label class="form-check-label" for="bankTransfer">銀行振込</label>
            </div>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="cashOnDelivery" value="代金引換" onclick="toggleCreditCardInfo()">
                <label class="form-check-label" for="cashOnDelivery">代金引換</label>
            </div>

            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="convenienceStore" value="コンビニ支払い" onclick="toggleCreditCardInfo()">
                <label class="form-check-label" for="convenienceStore">コンビニ支払い</label>
            </div>
        </div>

        <script>
            function toggleCreditCardInfo() {
                const isCreditCardSelected = document.getElementById("creditCard").checked;
                const creditCardInfo = document.getElementById("creditCardInfo");

                creditCardInfo.style.display = isCreditCardSelected ? "block" : "none";
            }

            document.addEventListener("DOMContentLoaded", toggleCreditCardInfo);




            const originalText = '${customer.getUser_address()}';
            let maskedText = originalText.replace(/^.{7}/, "*******");
            // 初期表示時にマスクされたテキストを表示
            document.getElementById("text").innerText = maskedText;
            // ボタンが押されたときに元のテキストを表示する関数
            function unmaskText() {
            	document.getElementById("text").innerText = originalText;
            	}





        </script>

        <button type="submit" class="btn btn-danger w-100">購入する</button>
    </form>
</div>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
