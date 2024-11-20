<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<title>よくある質問</title>
<style>
   body {
       font-family: Arial, sans-serif;
       background-color: #f9f9f9;
       color: #333;
       margin: 0;
       padding: 20px;
   }
   h2 {
       text-align: center;
       color: #0056b3;
   }
   .faq-container {
       max-width: 800px;
       margin: 0 auto;
       background: #fff;
       border-radius: 8px;
       box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
       padding: 20px;
   }
   .faq-item {
       margin-bottom: 15px;
       padding: 15px;
       border: 1px solid #e0e0e0;
       border-radius: 5px;
       transition: background 0.3s;
   }
   .faq-item:hover {
       background: #f1f1f1;
   }
   .faq-question {
       font-weight: bold;
       color: #0056b3;
   }
   .faq-answer {
       margin-top: 5px;
       line-height: 1.6;
   }
   a {
       display: inline-block;
       margin-top: 20px;
       text-decoration: none;
       color: #0056b3;
       font-weight: bold;
       text-align: center;
       border: 1px solid #0056b3;
       padding: 10px 15px;
       border-radius: 5px;
       transition: background 0.3s, color 0.3s;
   }
   a:hover {
       background: #0056b3;
       color: white;
   }
</style>
<script>
   function closeTabAndRedirect() {
       // 現在のタブを閉じる
       window.close();
       // 'contact.jsp' に遷移
       window.location.href = 'contact.jsp';
   }
</script>
</head>
<body>
<div class="faq-container">
<h2>よくある質問</h2>
<div class="faq-item">
<div class="faq-question">質問 1: どのように出品することができますか？</div>
<div class="faq-answer">アカウントにログインし、出品したい商品情報を入力して出品ボタンを押してください。</div>
</div>
<div class="faq-item">
<div class="faq-question">質問 2: 取引のキャンセルはできますか？</div>
<div class="faq-answer">商品の発送前であれば、取引をキャンセルすることが可能です。取引画面からキャンセルの手続きを行ってください。</div>
</div>
<div class="faq-item">
<div class="faq-question">質問 3: 送料は誰が負担しますか？</div>
<div class="faq-answer">送料は出品者が設定できます。出品時に「送料負担」の項目で選択してください。</div>
</div>
<div class="faq-item">
<div class="faq-question">質問 4: 支払い方法は何がありますか？</div>
<div class="faq-answer">クレジットカード、銀行振込、コンビニ払いなど、複数の支払い方法を利用できます。</div>
</div>
<div class="faq-item">
<div class="faq-question">質問 5: 商品が届かない場合はどうすればいいですか？</div>
<div class="faq-answer">取引画面から出品者にメッセージを送り、状況を確認してください。それでも解決しない場合は、お問い合わせフォームからご連絡ください。</div>
</div>
<div class="faq-item">
<div class="faq-question">質問 6: 返品・返金はできますか？</div>
<div class="faq-answer">商品に問題がある場合、返品や返金を受け付けています。詳細は利用規約をご確認ください。</div>
</div>
<div class="faq-item">
<div class="faq-question">質問 7: 評価はどのように行われますか？</div>
<div class="faq-answer">取引が完了した後、出品者と購入者の双方が評価を行うことができます。良い取引ができた場合は、ポジティブな評価をお願いします。</div>
</div>
<!-- ボタン押下でFAQタブを閉じ、contact.jspに遷移 -->
<a href="javascript:void(0);" onclick="closeTabAndRedirect()">お問い合わせフォームに戻る</a>
</div>
</body>
</html>