<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購入した商品</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: left; /* 左寄せ */
        }

        header {
            text-align: left; /* ヘッダーを左寄せ */
            display: flex;
            align-items: center; /* アイコンと文字を中央揃え */
            margin-bottom: 20px;
        }

        header img {
            vertical-align: middle;
        }

        .kakuspa {
            font-family: "あめちゃんポップ　まる Light";
            font-weight: 300; /* 文字を細く */
            font-size: 24px; /* フォントサイズ調整 */
            margin-left: 10px; /* アイコンと文字の間隔を調整 */
            vertical-align: middle;
        }

        .message {
            font-size: 24px;
            margin-top: 20px;
        }

        ul {
            margin-top: 20px;
            padding-left: 20px;
        }

        ul li {
            font-size: 18px;
            margin-bottom: 10px;
        }

        /* メインメニューに戻るボタンを左寄せに */
        .return-link {
            display: inline-block;
            padding: 5px 10px;
            background-color: #f0f0f0;
            color: #000;
            border: 1px solid #ccc;
            text-decoration: none;
            border-radius: 5px;
            text-align: left;
            width: fit-content; /* ボタン幅をコンテンツに合わせる */
            margin-top: 20px;
        }

        .return-link:hover {
            background-color: #ccc;
        }

        .button-container {
            text-align: left; /* ボタンも左寄せ */
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <img src="../images/kakugari.png" width="66" height="46">
            <span class="kakuspa">カクガリ</span>
        </header>
        <h1>購入した商品</h1>
        <%
            List<String> purchasedItems = (List<String>) request.getAttribute("purchasedItems");
            if (purchasedItems == null || purchasedItems.isEmpty()) {
        %>
            <div class="message">購入した商品はありません</div>
        <%
            } else {
        %>
            <ul>
                <% for (String item : purchasedItems) { %>
                    <li><%= item %></li>
                <% } %>
            </ul>
        <%
            }
        %>

        <!-- メインメニューに戻るボタン -->
        <div class="button-container">
            <a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">← メインメニューに戻る</a>
        </div>
    </div>
</body>
</html>
