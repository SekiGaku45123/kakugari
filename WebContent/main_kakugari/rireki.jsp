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
            background-color: #ffff; font-family: Arial, sans-serif;
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
	        background-color: #f5f5f5;  /* 背景色 */
	        color: #fff;  /* テキスト色 */
	        padding: 20px 0;
	        border-top: 2px solid #f5f5f5;  /* 上のボーダー */
	        text-align: center;
	        margin: 0; /* 余白を削除 */
	        margin-top: auto; /* ページの下部にフッターを固定 */
	    }

	    /* リストを横一列に並べるスタイル */
	    .site-footer ul {
	        list-style-type: none;
	        padding: 0;
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        gap: 20px;
	        margin: 0;
	    }

	    /* リンクスタイル */
	    .site-footer ul li {
	        font-size: 16px;
	        font-weight: bold;
	    }

	    .site-footer ul li a {
	        color: #333;  /* リンクの色 */
	        text-decoration: none;
	    }

	    /* リンクホバー時のエフェクト */
	    .site-footer ul li a:hover {
	        color: #0000ff;
	        border-bottom: 1px solid #ffffff;  /* ホバー時の下線 */
	    }

	    /* 区切り線 */
	    .site-footer ul li:not(:last-child)::after {
	        content: "|";
	        color: #555;
	        margin-left: 15px;
	    }

	    /* フッターの著作権表示 */
	    .site-footer p {
	        font-size: 14px;
	        color: #333;
	        margin-top: 20px;
        }
         .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            align-items: center;
            justify-content: center;
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
            width: 90%;
            max-width: 400px;
        }
        .modal-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .modal-buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-confirm {
            background-color: #ff4d4d;
            color: white;
        }
        .btn-cancel {
            background-color: #ccc;
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
<a href="#">
<img src="${pageContext.request.contextPath}/images/${history.image_Data}" alt="商品画像" width="80" height="80">
</a>
</td>
<td class="completed">購入が完了しました。</td>
<td class="purchase-date">
<fmt:formatDate value="${history.purchase_Date}" pattern="yyyy-MM-dd HH:mm" />
</td>
<td>
<c:forEach var="history2" items="${historyList}">
<form action="${pageContext.request.contextPath}/deleteHistory" method="post" style="display:inline;">
<input type="hidden" name="itemId" value="${history2.item_Id}" />
</c:forEach>
<div class="cancel" style="display: ${history.cancel_not == 'not' ? 'none' : 'block'};">
<button type="button" onclick="showModal(${history.item_Id})">キャンセル</button>
</div>
<div class="cancel" style="display: ${history.cancel_not != 'not' ? 'none' : 'block'};">
									キャンセルできません。
</div>
</form>

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

    <div id="confirmationModal" class="modal">
<div class="modal-content">
<p>この履歴をキャンセルしますか？</p>
<form id="deleteForm" action="${pageContext.request.contextPath}/deleteHistory" method="post">
<input type="hidden" name="itemId" id="modalItemId">
<div class="modal-buttons">
<button type="submit" class="btn-confirm">Cancel</button>
<button type="button" class="btn-cancel" onclick="closeModal()">Back</button>
</div>
</form>
</div>
</div>


    <script>
        function showModal(itemId) {
            document.getElementById('modalItemId').value = itemId;
            document.getElementById('confirmationModal').style.display = 'flex';
        }


        function closeModal() {
            document.getElementById('confirmationModal').style.display = 'none';
        }
</script>

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