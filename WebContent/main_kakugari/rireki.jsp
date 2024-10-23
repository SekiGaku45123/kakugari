<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>購入履歴 - 過去の取引</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* 全画面表示に対応 */
        body, html {
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
            max-width: 900px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        header {
            display: flex;
            align-items: center;
            justify-content: space-between; /* アイコンとタイトルを両端に配置 */
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

        .tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tabs button {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            cursor: pointer;
            background-color: #f0f0f0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .tabs button.active {
            background-color: #d90000;
            color: white;
        }

        .history {
            display: flex;
            justify-content: center;
        }

        .history table {
            width: 80%;
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

        .in-progress {
            color: red;
        }

        /* メインメニューに戻るボタンのスタイル */
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

            .tabs button {
                padding: 8px 16px;
                margin: 0 5px;
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

        <!-- タブの部分 -->
        <div class="tabs">
            <button id="tabCurrent" class="active">取引中</button>
            <button id="tabCompleted">過去の取引</button>
        </div>

        <!-- 商品の履歴部分 -->
        <div class="history">
            <!-- 取引中の商品 -->
            <table id="currentDeals">
                <thead>
                    <tr>
                        <th>商品名</th>
                        <th>ステータス</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${purchaseHistory}">
                        <c:if test="${!product.completed}">
                            <tr>
                                <td>${product.name}</td>
                                <td class="in-progress">取引中です。</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <!-- 過去の取引 -->
            <table id="completedDeals" style="display:none;">
                <thead>
                    <tr>
                        <th>商品名</th>
                        <th>ステータス</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${purchaseHistory}">
                        <c:if test="${product.completed}">
                            <tr>
                                <td>${product.name}</td>
                                <td class="completed">取引が完了しました。</td>
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

    <!-- タブの切り替えスクリプト -->
    <script>
        document.getElementById('tabCurrent').addEventListener('click', function() {
            document.getElementById('currentDeals').style.display = 'table';
            document.getElementById('completedDeals').style.display = 'none';
            this.classList.add('active');
            document.getElementById('tabCompleted').classList.remove('active');
        });

        document.getElementById('tabCompleted').addEventListener('click', function() {
            document.getElementById('currentDeals').style.display = 'none';
            document.getElementById('completedDeals').style.display = 'table';
            this.classList.add('active');
            document.getElementById('tabCurrent').classList.remove('active');
        });
    </script>
</body>
</html>
