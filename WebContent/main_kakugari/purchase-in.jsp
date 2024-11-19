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

    .saizu{
    	position: relative;
    	left:0;
    	width: 150px;
    	right: 150px;
    	background-color: black;
    }
    .saizu img{
    	width: 100%;
    	right: auto;
    	object-fit: contain;
    	background-color: black;
    }

</style>
<c:set var="customer" value="${sessionScope.customer}" />
<div class="container my-5">
    <h2 class="mb-4 text-center">商品リスト</h2>

    <hr>
    <c:set var="item_id" value="${list[0].item_id}" />

    <c:set var="flag" value="${list[0].flag}" />

    <h3 class="mb-3">購入情報入力</h3>
    <c:forEach var="list" items="${list}">
        <div class="saizu"><img src="${pageContext.request.contextPath}${list.getImage_data()}" alt="商品画像" ></div>
        <h2>${list.getItem_name()}</h2>
        <p class="pq">￥<span class="mozi">${list.getItem_price()}</span>（税込・送料込み）</p>
     </c:forEach>

    <form action="${pageContext.request.contextPath}/main_kakugari/Purchaseaction" method="post">


    	<input type="hidden" name="item_id" value="${item_id} "/>
    	<input type="hidden" name="flag" value="${flag}"/>

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

            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="クレジットカード" checked onclick="toggleCreditCardInfo()">
                <label class="form-check-label" for="creditCard">クレジットカード</label>
                <a href="../kakugari/credit_register.jsp">
                    <button type="button" class="btn btn-primary w-100">
                        <font color="white">クレジットカード登録へ</font>
                    </button>
                </a>
            </div>
<p id="text">${fn:escapeXml(credit.getCreditNumber())}</p>
<button id="unmaskButton" type="button" class="btn btn-info mt-2">最初の12文字をマスク/解除</button>



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



<script>
    document.addEventListener("DOMContentLoaded", () => {
        const originalText = '${fn:escapeXml(credit.getCreditNumber())}';
        const maskedText = originalText.replace(/^.{12}/, "**** **** ****");

        const textElement = document.getElementById("text");
        textElement.innerText = maskedText;

        let isMasked = true;
        document.getElementById("unmaskButton").addEventListener("click", () => {
            if (isMasked) {
                textElement.innerText = originalText;
            } else {
                textElement.innerText = maskedText;
            }
            isMasked = !isMasked;
        });
    });
</script>

                    <button type="submit" class="btn btn-danger w-100">購入する</button>


    </form>
</div>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
