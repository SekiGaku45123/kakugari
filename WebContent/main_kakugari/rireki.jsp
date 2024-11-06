<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>購入履歴 - 過去の取引</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* 全画面表示対応 */
        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            width: 90%;
            max-width: 1600px;
            height: 90vh; /* 高さを画面にフィットさせる */
            overflow-y: auto; /* 縦スクロール可能に */
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
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
            font-size: 24px;
            margin-left: 10px;
            vertical-align: middle;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 28px;
        }

        .history {
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .history table {
            width: 100%;
            border-collapse: collapse;
        }

        .history table th, .history table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .history table th {
            background-color: #f2f2f2;
        }

        .completed {
            color: green;
        }

        .button-container {
            text-align: left;
            margin-top: 20px;
        }

        .return-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f0f0f0;
            color: #000;
            border: 1px solid #ccc;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .return-link:hover {
            background-color: #ccc;
        }

        /* モバイル対応 */
        @media (max-width: 768px) {
            .history table {
                width: 100%;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <a href="${pageContext.request.contextPath}/main_kakugari/all">
                <img src="${pageContext.request.contextPath}/images/../images/読書のアイコン.png" width="66" height="46" alt="カクガリ">
                <span class="kakuspa">カクガリ</span>
            </a>
        </header>

        <h1>購入履歴 - 過去の取引</h1>

        <!-- 過去の取引 -->
        <div class="history">
            <table id="completedDeals">
                <thead>
                    <tr>
                        <th>商品ID</th>
                        <th>画像</th>
                        <th>ステータス</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="history" items="${historyList}">
                        <c:if test="${history.flag}">
                            <tr>
                                <td>${history.item_Id}</td>
                                <td><img src="${pageContext.request.contextPath}/images/${history.image_Data}" alt="商品画像" width="80" height="80"></td>
                                <td class="completed">取引が完了しました。</td>
                                <td>
                                    <!-- 削除ボタン -->
                                    <form action="${pageContext.request.contextPath}/kakugari3/deleteHistory" method="post" style="display:inline;">
                                        <input type="hidden" name="itemId" value="${history.item_Id}">
                                        <button type="submit" onclick="return confirm('本当に削除しますか？');">削除</button>
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- メインメニューに戻るボタン -->
        <div class="button-container">
            <a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">← メインメニューに戻る</a>
        </div>
    </div>
</body>
</html>
