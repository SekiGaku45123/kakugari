<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<c:import url="/common/base.jsp"/>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .gogo {
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
        .good {
            color: #28a745;
            font-size: 24px;
            font-weight: bold;
        }
        .bad {
            color: #dc3545;
            font-size: 24px;
            font-weight: bold;
        }
        .detail-message {
            font-size: 18px;
            margin-top: 10px;
            color: #333;
        }
    </style>

</head>
<div class="gogo">
<%String item_id=request.getParameter("ex_co"); %>
<%String judge=request.getParameter("item_id"); %>
<div class="message-box">
    <p id="status" class="good"></p>
    <p id="detail-message" class="detail-message"><%= item_id %></p>
</div>

<script>
    // ここで true なら GOOD、false なら BAD にする
    let isGood = <%= judge %>; // ここを true/false に変えてみろよ？

    let statusElement = document.getElementById("status");
    let detailMessageElement = document.getElementById("detail-message");

    if (isGood) {
        statusElement.textContent = "GOOD！";
        statusElement.classList.add("good");

    } else {
        statusElement.textContent = "BAD...";
        statusElement.classList.add("bad");
    }
</script>

</div>
<jsp:include page="/footer.html" />
