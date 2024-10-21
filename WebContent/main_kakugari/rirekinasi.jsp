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
            text-align: left;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            margin: auto;
        }
        .message {
            font-size: 24px;
            margin-top: 20px;
        }
        .link {
            margin-top: 20px;
            font-size: 10px;
            color: #007bff;
        }
        .link a {
            text-decoration: none;
            color: #007bff;
        }
        .link a:hover {
            text-decoration: underline;
        }
          a.return-link {
        display: inline-block;
        padding: 5px 10px;
        background-color: #f0f0f0;
        color: #000;
        border: 1px solid #ccc;
        text-decoration: none;
        border-radius: 5px;
    }

    a.return-link:hover {
        background-color: #ccc;
    }
    </style>
</head>
<body>
<h2><img src="../images/kakugari.png" width="66" height="46"><span class="kakuspa">カクガリ</span></h2>
<div class="container">
        <h1>購入した商品</h1>
        <%
            List<String> purchasedItems = (List<String>) request.getAttribute("purchasedItems");
            if (purchasedItems == null || purchasedItems.isEmpty()) {
        %>
            <div class="message">購入した商品はありません</div>

            </div>
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
    </div>
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">← メインメニューに戻る</a></p>
</body>
</html>
