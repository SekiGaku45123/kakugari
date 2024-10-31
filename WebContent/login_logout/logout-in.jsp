<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>  <!-- パスを確認 -->
<%@include file="../common/base.jsp" %>  <!-- base.jspのパスも確認 -->

<!-- ログインフォーム -->
<form action="<%= request.getContextPath() %>/login_logout/Login.action" method="post"> <!-- パスを修正 -->
    <p>ログイン名<input type="text" name="login" required></p>
    <p>パスワード<input type="password" name="password" required></p>
    <p><input type="submit" value="ログイン"></p>
</form>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />  <!-- パスを確認 -->
