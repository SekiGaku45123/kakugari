<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<%@ include file="../common/base.jsp" %>

<form action="Login.action" method="post">
<p>メールアドレス<input type="text" name="maleaddress"></p>
<p>パスワード<input type="password" name="password"></p>
<p><input type="submit" value="ログイン"></p>
</form>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />
