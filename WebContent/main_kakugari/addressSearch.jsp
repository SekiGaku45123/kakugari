<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
  <head>
    <meta charset="UTF-8">
    <title>郵便番号から住所を検索</title>
    <script>
    function searchAddress() {
        const postalCode = document.getElementById("postalCode").value;
        const resultField = document.getElementById("addressResult");

        if (!postalCode.match(/^\d{3}-?\d{4}$/)) {
            resultField.textContent = "正しい郵便番号を入力してください (例: 123-4567)";
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
                const outputBox = document.getElementById("outputBox");
                const resultField1 = address.address1 + address.address2 + address.address3;
                resultField.textContent = address.address1 + address.address2 + address.address3;
                outputBox.value = resultField1;
            } else {
                resultField.textContent = "住所が見つかりませんでした。";
            }
        })
        .catch(error => {
            console.error("エラー:", error);
            resultField.textContent = "エラーが発生しました。再度お試しください。";
        });
    }

    // ボタンクリックでsearchAddress関数を実行
    window.addEventListener('DOMContentLoaded', function() {
        const searchButton = document.getElementById("searchButton");
        searchButton.addEventListener("click", function(event) {
            event.preventDefault();
            searchAddress();
        });
    });
    </script>
</head>
<body>
    <h1>郵便番号から住所を検索</h1>
    <div>
        <label for="postalCode">郵便番号:</label>
        <input type="text" id="postalCode" placeholder="例: 123-4567" required>
        <button id="searchButton">検索</button>
    </div>
    <p><input id="outputBox" type="text" size="30" placeholder="文字が自動で現れます" class="textbox"></p>
    <div id="addressResult" style="margin-top: 20px; font-weight: bold;"></div>
</body>
</html>