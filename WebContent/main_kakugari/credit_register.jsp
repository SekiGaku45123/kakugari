<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.html" %>


<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>クレジットカード登録</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <h2 class="mb-4 text-center">クレジットカード登録</h2>

    <form action="../kakugari/credit_register" method="post">
        <div class="form-group">
            <label for="cardNumber">カード番号</label>
            <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="カード番号を入力してください" required>
        </div>
        <div class="form-group">
            <label for="expiryDate">有効期限</label>
            <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="例）11月2027年→112027" required>
        </div>
        <div class="form-group">
            <label for="security_code">セキュリティコード</label>
            <input type="text" class="form-control" id="cvv" name="security_code" placeholder="セキュリティコードを入力してください" required>
        </div>
        <button type="submit" class="btn btn-primary">登録する</button>
    </form>
</div>
</body>
</html>
  <jsp:include page="/footer.html" />
