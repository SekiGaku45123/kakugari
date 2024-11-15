<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>購入履歴 - 過去の取引 - カクガリ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <style>
        html, body {
            margin: 0; padding: 0;
            width: 100%; height: 100%;
            background-color: #f4f4f4; font-family: Arial, sans-serif;
        }
        .container {
            width: 90%; max-width: 1600px; height: auto;
            overflow-y: auto; padding: 20px; background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 8px;
            margin: 80px auto 20px;
        }
        .history table { width: 100%; border-collapse: collapse; }
        .history table th, .history table td {
            padding: 10px; border: 1px solid #ddd; text-align: center;
        }
        .completed { color: green; }
        .button-container { text-align: left; margin-top: 20px; }
        .return-link {
            display: inline-block; padding: 10px 20px; background-color: #f0f0f0;
            color: #000; border: 1px solid #ccc; text-decoration: none; border-radius: 5px;
        }
        .return-link:hover { background-color: #ccc; }
        .purchase-date { font-size: 14px; color: #666; }

        /* フッター全体のスタイル */
        .site-footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            border-top: 2px solid #444;
            text-align: center;
            margin: 0;
            margin-top: auto;
        }
        .site-footer ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            margin: 0;
        }
        .site-footer ul li {
            font-size: 16px;
            font-weight: bold;
        }
        .site-footer ul li a {
            color: #c0c0c0;
            text-decoration: none;
        }
        .site-footer ul li a:hover {
            color: #ffffff;
            border-bottom: 1px solid #ffffff;
        }
        .site-footer ul li:not(:last-child)::after {
            content: "|";
            color: #555;
            margin-left: 15px;
        }
        .site-footer p {
            font-size: 14px;
            color: #aaa;
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <!-- ヘッダーをインクルード -->

    <!-- メインコンテンツエリア -->
    <div class="container">
        <h1>購入履歴</h1>
        <div class="history">
            <c:choose>
                <c:when test="${empty historyList}">
                    <p style="font-size: 30px; color: #333;">履歴がありません。</p>
                </c:when>
                <c:otherwise>
                    <table>
                        <tbody>
                            <c:forEach var="history" items="${historyList}">
                                <c:if test="${history.flag}">
                                    <tr>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/kakugari/product?item_id=${history.item_Id}">
                                                <img src="${pageContext.request.contextPath}/images/${history.image_Data}" alt="商品画像" width="80" height="80">
                                            </a>
                                        </td>
                                        <td class="completed">購入が完了しました。</td>
                                        <td class="purchase-date">
                                            <fmt:formatDate value="${history.purchase_Date}" pattern="yyyy-MM-dd HH:mm" />
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="button-container">
            <a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">← メインメニューに戻る</a>
        </div>
    </div>

    <!-- フッター -->
    <footer class="site-footer">
        <ul>
            <li><a href="${pageContext.request.contextPath}/guide/promise.jsp">カクガリ利用規約</a></li>
            <li><a href="${pageContext.request.contextPath}/contact/guidelines.jsp">ガイドライン</a></li>
            <li><a href="${pageContext.request.contextPath}/guide/selling_guide.jsp">出品ガイド</a></li>
            <li><a href="${pageContext.request.contextPath}/guide/privacy_policy.jsp">プライバシーポリシー</a></li>
        </ul>
        <p>© 2024 TIC<br>カクガリ学園</p>
    </footer>
</body>
</html>
