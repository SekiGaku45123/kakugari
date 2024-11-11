<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>購入履歴 - 過去の取引</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        html, body {
            margin: 0; padding: 0;
            width: 100%; height: 100%;
            display: flex; justify-content: center; align-items: center;
            background-color: #f4f4f4; font-family: Arial, sans-serif;
        }
        .container {
            width: 90%; max-width: 1600px; height: 90vh;
            overflow-y: auto; padding: 20px; background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); border-radius: 8px;
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

        /* モーダルスタイル */
        .modal {
            display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.5); justify-content: center; align-items: center;
        }
        .modal-content {
            background-color: white; padding: 20px; border-radius: 8px;
            width: 80%; max-width: 400px; text-align: center;
        }
        .modal-content button {
            margin: 10px; padding: 10px 20px; cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>購入履歴 - 過去の取引</h1>
        <div class="history">
            <c:choose>
                <c:when test="${empty historyList}">
                    <p style="font-size: 30px; color: #333;">履歴がありません。</p>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="history" items="${historyList}">
                                <c:if test="${history.flag}">
                                    <tr>
                                        <td>${history.item_Id}</td>
                                        <td><img src="${pageContext.request.contextPath}/images/${history.image_Data}" alt="商品画像" width="80" height="80"></td>
                                        <td class="completed">購入が完了しました。</td>
                                        <td>
                                            <!-- 削除ボタン -->
                                            <button onclick="openDeleteModal('${history.item_Id}')">削除</button>
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

    <!-- 削除確認モーダルウィンドウ -->
    <div id="deleteConfirmModal" class="modal">
        <div class="modal-content">
            <p>本当に削除しますか？</p>
            <button onclick="confirmDelete()">はい</button>
            <button onclick="cancelDelete()">キャンセル</button>
        </div>
    </div>

    <form id="deleteForm" action="${pageContext.request.contextPath}/kakugari3/deleteHistory" method="post" style="display:none;">
        <input type="hidden" id="deleteItemId" name="itemId" value="">
    </form>

    <script>
        // 削除用モーダルの開閉制御
        let currentItemId = null;

        function openDeleteModal(itemId) {
            currentItemId = itemId;
            document.getElementById('deleteConfirmModal').style.display = 'flex';
        }

        function confirmDelete() {
            if (currentItemId) {
                // 削除フォームにアイテムIDを設定して送信
                document.getElementById('deleteItemId').value = currentItemId;
                document.getElementById('deleteForm').submit();
            }
        }

        function cancelDelete() {
            currentItemId = null;
            document.getElementById('deleteConfirmModal').style.display = 'none';
        }

        // モーダル外をクリックした際に閉じる
        window.onclick = function(event) {
            const modal = document.getElementById('deleteConfirmModal');
            if (event.target === modal) {
                cancelDelete();
            }
        }
    </script>
</body>
</html>
