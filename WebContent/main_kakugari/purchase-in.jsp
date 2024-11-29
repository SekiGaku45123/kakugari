<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    .saizu {
        position: relative;
        width: 150px;
        background-color: black;
    }
    .saizu img {
        width: 100%;
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
    <c:set var="image_data" value="${list[0].getImage_data()}" />

    <h3 class="mb-3">購入情報入力</h3>
    <c:forEach var="list" items="${list}">
        <div class="saizu"><img src="${pageContext.request.contextPath}${list.getImage_data()}" alt="商品画像"></div>
        <h2>${list.getItem_name()}</h2>
        <p class="pq">￥<span class="mozi">${list.getItem_price()}</span>（税込・送料込み）</p>
    </c:forEach>

    <form action="${pageContext.request.contextPath}/main_kakugari/Purchaseaction" method="post">
        <input type="hidden" name="item_id" value="${item_id}" />
        <input type="hidden" name="flag" value="${flag}" />
        <input type="hidden" name="image_data" value="${image_data}" />

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

            <!-- クレジットカード番号の表示 -->

            <!-- クレジットカード登録ボタン -->
            <div id="creditRegisterButton" style="display: block;">
			    <div class="form-group">
			        <label for="cardNumber">カード番号</label>
			        <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="カード番号を入力してください" required>
			    </div>
			    <div class="form-group">
			        <label for="expiryDate">有効期限</label>
			        <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="例）11月2027年→112027" required>
			    </div>
			    <div class="form-group">
			        <label for="security_code">セキュリティコード</label>
			        <input type="text" class="form-control" id="cvv" name="security_code" placeholder="セキュリティコードを入力してください" required>
			    </div>
			    <button type="button"  class="btn btn-primary w-75 " id="creditCardButton">クレジットカード登録</button>

  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    登録済みのカード番号　
  </a>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
	<select name="cardnum">
		<c:forEach var="pro" items="${crad}">
			<option  name="" value="${pro.getCreditNumber() }">${pro.getCreditNumber() }</option>
		</c:forEach>
	</select>
  </div>
</div>



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
            <button type="submit" class="btn btn-danger w-100">購入する</button>

    </form>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- JavaScript -->
<script>
function submitCreditCardData(event) {
    // フォーム送信を一旦停止
    event.preventDefault();

    // フォームデータを収集
    const cardNumber = document.getElementById("cardNumber").value;
    const expiryDate = document.getElementById("expiryDate").value;
    const securityCode = document.getElementById("cvv").value;

    // 入力が空でないかを確認
    if (!cardNumber || !expiryDate || !securityCode) {
        alert("すべてのフィールドを入力してください");
        return;
    }

    // AJAXリクエスト作成
    $.ajax({
        url: '${pageContext.request.contextPath}/kakugari/credit_register', // サーバーのURL
        type: 'POST',
        data: {
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            security_code: securityCode
        },
        success: function (response) {
        	console.log(response);
            if (response) {

                alert("クレジットカード登録が完了しました");
                // 成功した場合のみフォームを送信

            } else {
                alert("クレジットカード登録に失敗しました");
            }
        },
        error: function (xhr, status, error) {
            console.error("エラーが発生しました: " + error);
            alert("クレジットカード登録時にエラーが発生しました");
        }
    });
}

// ボタンのクリックイベントリスナーを追加
const button = document.getElementById("creditCardButton");
button.addEventListener("click", submitCreditCardData);



    function toggleCreditCardInfo() {
        const creditCardSelected = document.getElementById("creditCard").checked;
        const creditRegisterButton = document.getElementById("creditRegisterButton");

        const cardNumber = document.getElementById("cardNumber");
        const expiryDate = document.getElementById("expiryDate");
        const securityCode = document.getElementById("cvv");

        if (creditCardSelected) {
            creditRegisterButton.style.display = "block";
            cardNumber.setAttribute("required", "true");
            expiryDate.setAttribute("required", "true");
            securityCode.setAttribute("required", "true");
        } else {
            creditRegisterButton.style.display = "none";
            cardNumber.removeAttribute("required");
            expiryDate.removeAttribute("required");
            securityCode.removeAttribute("required");
        }
    }
    function toggleRequiredFields() {
        const cardDropdown = document.querySelector('select[name="cardnum"]'); // ドロップダウンリスト
        const selectedCardNumber = cardDropdown.value; // 選択されたカード番号
        const isNewCard = selectedCardNumber === ""; // 新規カード選択時は空の値

        // カード情報入力欄
        const cardNumberField = document.getElementById("cardNumber");
        const expiryDateField = document.getElementById("expiryDate");
        const securityCodeField = document.getElementById("cvv");

        if (isNewCard) {
            // 新規カード入力時に必須属性を有効化
            cardNumberField.setAttribute("required", "true");
            expiryDateField.setAttribute("required", "true");
            securityCodeField.setAttribute("required", "true");
        } else {
            // 登録済みカード選択時に必須属性を解除
            cardNumberField.removeAttribute("required");
            expiryDateField.removeAttribute("required");
            securityCodeField.removeAttribute("required");
        }
    }

    // ドロップダウンリストの変更時に必須属性を切り替える
    document.querySelector('select[name="cardnum"]').addEventListener("change", toggleRequiredFields);


</script>

<!-- footer -->
<jsp:include page="/footer.html" />


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
