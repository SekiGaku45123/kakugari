<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>

<c:import url="/common/base.jsp">
</c:import>

<div class="container my-5">
    <div class="alert alert-success text-center" role="alert">
        <h4 class="alert-heading">購入手続きが完了しました！</h4>
        <p>ご利用いただき、ありがとうございます。</p>
        <hr>
        <p class="mb-0">引き続きお買い物をお楽しみください。</p>
        <a href="../main_kakugari/all" class="btn btn-primary mt-3">商品一覧に戻る</a>
    </div>
</div>

<%@include file="../footer.html" %>

<!-- Bootstrap JavaScriptがheader.htmlで読み込まれている前提です -->
