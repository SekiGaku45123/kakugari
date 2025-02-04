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
    </style>
</head>
<div class= "bobo">
<%String item_id=request.getParameter("ex_co"); %>
<div class="message-box">
    <p class="message"><%=item_id %></p>
</div>
</div>
<jsp:include page="/footer.html" />


