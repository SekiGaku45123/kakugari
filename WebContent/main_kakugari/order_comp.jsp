<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />


<div class="container text-center mt-5">
        <!-- アイコンとメッセージ -->
        <div class="alert alert-success p-4 rounded">
            <h1 class="display-4">📦 発送完了！</h1>
            <p class="lead mt-3">ご利用ありがとうございます。商品の発送が完了しました。</p>
        </div>

        <div class="mt-4">
            <a href="../main_kakugari/all" class="btn btn-primary btn-lg">トップページに戻る</a>
        </div>
    </div>

    <!-- Bootstrap 4のJavaScriptと依存するPopper.js、jQueryを読み込み -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.min.js"></script>