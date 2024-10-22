<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>購入履歴 - 過去の取引</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 900px;
            width: 100%;
            margin: auto;
            padding: 20px;
            text-align: center;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        header {
            text-align: left; /* ヘッダーを左寄せ */
            display: flex;
            align-items: center; /* アイコンと文字の位置を揃える */
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
        .history {
            display: flex;
            justify-content: center; /* テーブルを中央寄せ */
            margin-top: 20px;
        }
        .history table {
            width: 80%;
            border-collapse: collapse;
            margin: auto;
        }
        .history table th, .history table td {
            padding: 10px;
            border: 1px solid #ddd;
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
        .tabs {
            display: flex;
            justify-content: center; /* タブを中央寄せ */
            margin-bottom: 20px;
        }
        .tabs button {
            padding: 10px 20px;
            margin-right: 10px;
            background-color: #f0f0f0;
            border: none;
            cursor: pointer;
        }
        .tabs button.active {
            background-color: #d90000;
            color: white;
        }

        /* メインメニューに戻るのボタンを左寄せに */
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

        <!-- タブ切り替えのUI -->
        <div class="tabs">
            <button id="tabCurrent" class="active">取引中</button>
            <button id="tabCompleted">過去の取引</button>
        </div>

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
        <p>
            <div class="button-container">
            <a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">← メインメニューに戻る</a>
        </div>
        </p>
    </div>

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
