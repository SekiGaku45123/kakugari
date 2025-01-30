<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<c:import url="/common/base.jsp"></c:import>


<style>

.custom-card {
      cursor: pointer;
      transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
    }
    .custom-card:hover {
      transform: scale(1.02);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
    .custom-card.selected {
      border: 2px solid #007BFF;
      box-shadow: 0 4px 15px rgba(0, 123, 255, 0.5);
    }
    textarea {
      resize: none;
    }
  </style>

<div class="container mt-5" style="max-width: 800px;">

  <h2 class="text-center mb-4">発送画面</h2>
  <p>商品が購入され支払いされました。発送方法を選んでください。</p>

  <!-- 発送場所選択 -->
  <h4 class="mt-4">発送場所の選択</h4>
  <div class="row mt-3 justify-content-center">
    <!-- 郵便ポスト -->
    <div class="col-md-4 mb-3">
      <div class="card custom-card text-center p-3" style="max-width: 250px; margin: 0 auto;" id="card1">
        <div class="card-body">
          <h5 class="card-title">郵便ポストに発送</h5>
          <p class="card-text">最寄りの郵便ポストに投函するだけで簡単に発送できます。</p>
        </div>
      </div>
    </div>
    <!-- 郵便局 -->
    <div class="col-md-4 mb-3">
      <div class="card custom-card text-center p-3" style="max-width: 250px; margin: 0 auto;" id="card2">
        <div class="card-body">
          <h5 class="card-title">郵便局へ持ち込みで発送</h5>
          <p class="card-text">郵便局で手続きして発送する方法です。</p>
        </div>
      </div>
    </div>
    <!-- コンビニ -->
    <div class="col-md-4 mb-3">
      <div class="card custom-card text-center p-3" style="max-width: 250px; margin: 0 auto;" id="card3">
        <div class="card-body">
          <h5 class="card-title">コンビニから発送</h5>
          <p class="card-text">お近くのコンビニで発送手続きが可能です。</p>
        </div>
      </div>
    </div>
  </div>

<%String Year=request.getParameter("item_id"); %>
<%String Year1=request.getParameter("user_name"); %>
<%String Year2=request.getParameter("user_naname"); %>

  <!-- ボタン表示 -->
  <div id="buttons" class="mt-4">
    <div id="hayu_button" style="display: none;">
      <form action="${pageContext.request.contextPath}/kakugari/order_comp" method="POST">
        <input type="hidden" name="item_id" value="<%=Year %>">
        <input type="hidden" name="exhibit_user" value="<%=Year1 %>">
        <button type="submit" class="btn btn-primary btn-block">郵便ポストに発送通知</button>
      </form>
    </div>
    <div id="hayu_button_2" style="display: none;">
      <form action="${pageContext.request.contextPath}/kakugari/order_comp" method="POST">
        <input type="hidden" name="item_id" value="<%=Year %>">
        <input type="hidden" name="exhibit_user" value="<%=Year1 %>">
        <button type="submit" class="btn btn-primary btn-block">郵便局へ持ち込みで発送通知</button>
      </form>
    </div>
    <div id="hayu_button_3" style="display: none;">
      <form action="${pageContext.request.contextPath}/kakugari/order_comp" method="POST">
        <input type="hidden" name="item_id" value="<%=Year %>">
        <input type="hidden" name="exhibit_user" value="<%=Year1 %>">
        <button type="submit" class="btn btn-primary btn-block">コンビニから発送通知</button>
      </form>
    </div>
  </div>

  <!-- 購入者情報 -->
  <h4 class="mt-5">購入者</h4>
  <p><font size="5"><b><%=Year2 %></b>さん</font></p>
  <label for="story">購入者へのメッセージを入力してください。</label>
  <textarea id="story" name="story" rows="5" class="form-control mt-2" placeholder="このたびはご購入ありがとうございます。商品の発送までお待ちください。"></textarea>
  <button class="btn btn-success mt-3" id="coco">取引メッセージを送る</button>
</div>
<br>
<br>
<br>
<br>
<br>
<div class="footer-container">
  <jsp:include page="/footer.html" />
</div>

  <!-- JavaScript -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function() {
      $('.custom-card').on('click', function() {
        // カードの選択状態をリセット
        $('.custom-card').removeClass('selected');
        // クリックしたカードを選択状態にする
        $(this).addClass('selected');

        // ボタンの表示をリセット
        $('#buttons div').hide();

        // IDに応じてボタンを表示
        if ($(this).attr('id') === 'card1') {
          $('#hayu_button').show();
        } else if ($(this).attr('id') === 'card2') {
          $('#hayu_button_2').show();
        } else if ($(this).attr('id') === 'card3') {
          $('#hayu_button_3').show();
        }
      });
    });

    const cocoBu = document.getElementById("coco");

    var item = <%=Year %>;

    if (cocoBu) { // ボタンが存在する場合のみ処理を実行
    	cocoBu.addEventListener("click", function() {
    		var storyValue = document.getElementById("story").value;
            $.ajax({
                url: '${pageContext.request.contextPath}/kakugari/Hatyu_come', // サーバーのURL
                type: 'POST',
                data: { id: storyValue,
                	item_id: item},
                success: function(response) {
                    alert("送信ができました。");
                    document.getElementById("coco").disabled = true;

                },
                error: function() {
                    alert("エラーが発生しました！");
                }
            });
        });
    } else {
        console.warn("favo_id が見つかりませんでした！");
    }

    document.addEventListener("DOMContentLoaded", function() {
    	$.ajax({
            url: '${pageContext.request.contextPath}/kakugari/Hatyu_come', // サーバーのURL
            type: 'POST',
            data: {item_id: item },
            success: function(response) {
            	if (response[0].exhibit_come == null) {
            	    // リストに値が入っている場合の処理
            		document.getElementById("coco").disabled = true;
            	} else {
            	    // リストが空の場合の処理
            	    console.log("リストは空です。");
            	}


            },
            error: function() {
                alert("エラーが発生しました！");
            }
        });
    });

  </script>
