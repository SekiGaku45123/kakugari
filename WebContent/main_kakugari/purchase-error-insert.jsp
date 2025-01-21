<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.html" %>

<style>
    body {
        font-family: 'Noto Sans JP', sans-serif;
        background-color: #f9f9f9;
        text-align: center;
        padding-top: 50px;
    }
    .error-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        display: inline-block;
    }
    h2 {
        color: #d9534f;
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        padding: 10px 20px;
        font-size: 16px;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
</style>

<div class="error-container">
    <h2>購入手続き中にエラーが発生しました。</h2>

    <!-- メインメニューに戻るボタン -->
    <div style="margin-top: 20px;">
        <a href="../main_kakugari/all" class="btn btn-primary">メインメニューに戻る</a>
    </div>
</div>

<jsp:include page="/footer.html" />
