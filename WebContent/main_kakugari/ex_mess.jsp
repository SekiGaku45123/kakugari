<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<c:import url="/common/base.jsp"/>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bobo {
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            text-align: center;
        }
        .message {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }
        .sender {
            font-size: 14px;
            color: #666;
            margin-top: 10px;
        }
        .btn-container {
            margin-top: 20px;
        }
    </style>
</head>
<%
    String item_id = request.getParameter("ex_co");
    String sender = request.getParameter("sender"); // 送信者情報を取得
    String item_idid = request.getParameter("item_id");
%>
<div class="bobo">
    <div class="message-box">
        <p class="message"><%=item_id %></p>
        <% if (sender != null && !sender.isEmpty()) { %>
            <p class="sender">送信者: <%=sender %></p>
        <% } %>
        <div class="btn-container">
            <a href="../kakugari/product?item_id=<%=item_idid %>" class="btn btn-primary">メッセージ一覧へ</a>
            <a href="../main_kakugari/all" class="btn btn-secondary">ホームへ</a>
        </div>
    </div>
</div>
<jsp:include page="/footer.html" />