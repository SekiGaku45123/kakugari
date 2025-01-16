<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList, java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録 - カクガリ</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/style.css">

<c:import url="/common/base.jsp" /> <!-- base.jspをインクルード -->

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
    .form-check {
        margin-top: 20px;
        text-align: left;
    }
</style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">新規登録</h2>
    <form action="../main_kakugari/signup" method="post">
        <div class="form-group">
            <label for="name">名前:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="お名前を入力してください" required>
        </div>

        <div class="form-group">
            <label for="hurigana">フリガナ:</label>
            <input type="text" class="form-control" id="hurigana" name="hurigana" placeholder="フリガナを入力してください" required>
        </div>

        <div class="form-group">
            <label for="postalCode">郵便番号:</label>
            <div class="input-group">
                <input type="text" class="form-control" id="postalCode" name="postalCode" placeholder="例：123-4567" required>
                <div class="input-group-append">
                    <button type="button" id="searchButton" class="btn btn-primary">住所検索</button>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="address">住所:</label>
            <input type="text" class="form-control" id="address" name="address" placeholder="住所を入力してください" required>
        </div>

        <div class="form-group">
            <label for="maleaddress">メールアドレス:</label>
            <input type="email" class="form-control" id="maleaddress" name="maleaddress" placeholder="メールアドレスを入力してください" required>
        </div>

        <div class="form-group">
            <label for="password">パスワード:</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="パスワードを入力してください" required>
        </div>

        <div class="form-group">
            <label for="telephone">電話番号:</label>
            <input type="text" maxlength = "11" class="form-control" id="telephone" name="telephone" placeholder="ハイフンなしで記入してください" required>
        </div>

        <!-- 利用規約チェックボックス -->
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="terms" name="terms" required>
            <label class="form-check-label" for="terms">
                <a href="../contact/terms.jsp">利用規約</a>に同意する
            </label>
        </div>

        <button type="submit" class="btn btn-danger mt-4">登録</button>
    </form>
</div>


<jsp:include page="/footer.html" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function searchAddress() {
    const postalCode = document.getElementById("postalCode").value;

    if (!postalCode.match(/^\d{3}-?\d{4}$/)) {
    	alert("正しい郵便番号を入力してください (例: 123-4567)");
        return;
    }

    // AJAXでサーブレットにリクエスト送信
    const contextPath = "<%= request.getContextPath() %>";
    fetch("../AddressSearchServlet", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: "zipcode=" + encodeURIComponent(postalCode)
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);
        if (data.status === 200 && data.results) {
            console.log("取得したデータ:");
            const address = data.results[0];
            console.log(address);
            const outputBox = document.getElementById("address");
            const resultField1 = address.address1 + address.address2 + address.address3;
            outputBox.value = resultField1;
        } else {
        	alert("住所が見つかりませんでした。");
        }
    })
    .catch(error => {
        console.error("エラー:", error);
        alert("エラーが発生しました。再度お試しください。");
    });
}

document.getElementById('searchButton').addEventListener('click', function() {
    searchAddress();
});
</script>
</body>
</html>
