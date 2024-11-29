<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />

<style>

.custom-checkbox input {
  display: none;
}

/* チェックボックスをボタン風に見せる */
.custom-checkbox .checkmark {
  display: inline-block;
  padding: 10px 20px;
  background-color: #F0F0F0;
  color: black;
  text-align: center;
  border-radius: 5px;
  cursor: pointer;
  user-select: none;
  font-size: 16px;
  font-weight: bold;
  transition: background-color 0.3s;
}

/* チェックが入った場合 */
.custom-checkbox input:checked + .checkmark {
  background-color: #ff1100;
  color: white;
}

/* ホバー時のエフェクト */
/*.custom-checkbox .checkmark:hover {
  background-color: #3e8e41;
}*/


#hayu_button {
  display: none;
}

/* チェックボックスがチェックされている時に表示 */
#hayu_button:checked + .checkmark + #content {
  display: block;
}

</style>


<p>かりかり便で発送する</p>
商品が購入され支払いされました。発送してください。カリカリ便では、郵便局への持ち込み、コンビニへの持ち込み、またはゆうパケットポストの利用を選択できます。



<p>発送場所の選択</p>
<label class="custom-checkbox">
  <input type="checkbox" id="checkbox1">
  <span class="checkmark">郵便ポストに発送</span>
</label>
<label class="custom-checkbox">
  <input type="checkbox" id="checkbox1">
  <span class="checkmark">郵便局へ持ち込みで発送</span>
</label>
<label class="custom-checkbox">
  <input type="checkbox" id="checkbox1">
  <span class="checkmark">コンビニから発送</span>
</label>


<div id="hayu_button" style="display: none;">
</div>



<p>購入者情報</p>

<%String Year=request.getParameter("item_id"); %><%=Year %>
<%String Year1=request.getParameter("user_name"); %><%=Year1 %>



<label for="story">購入者と安心してお取引できるように、商品購入のお礼をメッセージでも伝えましょう。</label>
<br>
<textarea id="story" name="story" rows="5" cols="33" placeholder="このたびはご購入ありがとうございます。商品の発送まで今しばらくお待ちください。">
</textarea>
<button class="ordermessage" type="button">取引メッセージを送る</button>

<script type="text/javascript">

const checkbox = document.getElementById("checkbox1");
const content = document.getElementById("content");

checkbox.addEventListener("change", function() {
  if (checkbox.checked) {
    content.style.display = "block";  // チェックされている時に表示
  } else {
    content.style.display = "none";   // チェック外されたら非表示
  }
});




</script>
