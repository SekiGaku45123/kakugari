<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.html" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>登録成功</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <h2 class="text-center mb-4">クレジットカードの登録が完了しました</h2>
    <div class="text-center">
        <a href="${pageContext.request.contextPath}/confirm" class="btn btn-primary">購入手続き画面に戻る</a>
    </div>
</div>
</body>
</html>
  <jsp:include page="/footer.html" />
