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
            min-height: 100vh;
            display: flex;
            align-items: center;  /* 垂直方向の中央揃え */
            justify-content: center; /* 水平方向の中央揃え */
        }

        .container {
            max-width: 900px;
            width: 100%;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: left;
            min-height: 80vh;  /* コンテナの最小高さ */
            display: flex;
            flex-direction: column;
            justify-content: space-between;  /* 上下を均等に分配 */
        }

        header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        header a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: inherit;
        }

        header img {
            vertical-align: middle;
        }

        .kakuspa {
            font-family: "あめちゃんポップ　まる Light";
            font-weight: 300;
            font-size: 24px;
            margin-left: 10px;
            vertical-align: middle;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .message {
            font-size: 24px;
            text-align: center;
        }

        ul {
            margin-top: 20px;
            padding-left: 20px;
        }

        ul li {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .return-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f0f0f0;
            color: #000;
            border: 1px solid #ccc;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        .return-link:hover {
            background-color: #ccc;
        }

        .button-container {
            text-align: left;
        }

        /* モバイル対応 */
        @media (max-width: 768px) {
            h1 {
                font-size: 24px;
            }

            ul li {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <a href="${pageContext.request.contextPath}/main_kakugari/all">
                <img src="../images/kakugari.png" width="66" height="46" alt="カクガリ">
                <span class="kakuspa">カクガリ</span>
            </a>
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

        <div class="button-container">
            <a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">← メインメニューに戻る</a>
        </div>
    </div>
</body>
</html>
