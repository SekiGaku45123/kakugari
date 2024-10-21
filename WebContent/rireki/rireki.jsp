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
        }
        .container {
            width: 100%;
            margin: auto;
        }


        .history {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .history table {
            width: 60%;
            border-collapse: collapse;
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
            justify-content: flex-start;
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
<header>
<h2><img src="../images/kakugari.png" width="66" height="46"><span class="kakuspa">カクガリ</span></h2>
<div class="container">
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
</header>
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">← メインメニューに戻る</a></p>
</body>
</html>
