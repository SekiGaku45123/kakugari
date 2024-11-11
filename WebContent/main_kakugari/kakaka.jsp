<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>

<button id="loadDataBtn">データを読み込む</button>
<div id="dataContainer"></div>


<script type="text/javascript">

    	document.getElementById("loadDataBtn").addEventListener("click", function() {
            fetch('${pageContext.request.contextPath}/getDataFromH2')  // サーブレットにGETリクエストを送信
                .then(response => response.json())  // JSON形式でレスポンスを受け取る
                .then(data => {
                    // 取得したデータをHTMLに表示
                    let output = '<ul>';
                    data.forEach(item => {
                        output += `<li>ID: ${item.id}, Name: ${item.name}</li>`;
                    });
                    output += '</ul>';
                    document.getElementById("dataContainer").innerHTML = output;
                })
                .catch(error => console.error('Error:', error));  // エラーハンドリング
        });
</script>