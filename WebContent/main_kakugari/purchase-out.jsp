<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header.html" %>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans JP', sans-serif;
        background-color: #f9f9f9;
    }
    .container {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 20px;
    }
    h2 {
        color: #333;
    }
</style>

<div class="container my-5">
    <h2 class="mb-4 text-center">購入手続きが完了しました！</h2>

    <div class="alert alert-success text-center" role="alert">
        <h4 class="alert-heading">ご利用いただき、ありがとうございます。</h4>
        <p>引き続きお買い物をお楽しみください。</p>
        <hr>
        <a href="../main_kakugari/all" class="btn btn-primary mt-3">商品一覧に戻る</a>
    </div>
</div>

<%@include file="../footer.html" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
