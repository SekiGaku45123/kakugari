<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<title>出品ガイド</title>
<style>
       body {
           font-family: Arial, sans-serif;
           margin: 20px;
           padding: 20px;
           background-color: #f9f9f9;
           color: #333;
       }
       h2 {
           color: #007bff;
           border-bottom: 2px solid #007bff;
           padding-bottom: 10px;
       }
       .section {
           background-color: #fff;
           border-radius: 8px;
           padding: 20px;
           box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
           margin-bottom: 20px;
       }
       .section h3 {
           color: #0056b3;
       }
       .list {
           margin-left: 20px;
           list-style-type: disc;
       }
       .note {
           font-style: italic;
           color: #555;
           margin-top: 10px;
       }
       .tips {
           background-color: #e9f7ff;
           border-left: 5px solid #007bff;
           padding: 10px;
           margin: 20px 0;
       }
       /* メインメニューリンク */
       .return-link {
           display: inline-block;
           margin-top: 20px;
           padding: 10px 20px;
           color: #fff;
           background-color: #1E90FF;
           text-decoration: none;
           border-radius: 5px;
           transition: background-color 0.3s ease;
       }
</style>
</head>
<body>
<h2>出品ガイド</h2>
<div class="section">
<h3>1. 出品準備</h3>
<p>出品を行う前に、以下の準備をしましょう。</p>
<ul class="list">
<li>商品の状態を確認し、清潔に保つこと。</li>
<li>販売する商品の情報を整理すること（ブランド、サイズ、色、状態など）。</li>
<li>商品写真を撮影するための明るい場所を選ぶこと。</li>
</ul>
</div>
<div class="section">
<h3>2. 商品写真の撮影</h3>
<p>商品の魅力を伝えるために、良い写真を撮影することが重要です。</p>
<ul class="list">
<li>自然光を利用して、商品の色合いを正確に表現する。</li>
<li>商品の全体像と詳細を撮影する（タグや傷など）。</li>
<li>背景をシンプルに保ち、商品の引き立て役にする。</li>
</ul>
<div class="tips">
<strong>ヒント:</strong> 複数の角度から撮影し、購入者に商品をしっかりイメージしてもらうことが大切です。
</div>
</div>
<div class="section">
<h3>3. 商品説明の作成</h3>
<p>魅力的な商品説明を作成するためのポイントです。</p>
<ul class="list">
<li>商品の特徴や利点を詳しく説明する。</li>
<li>使用した期間や傷の有無を正直に記載する。</li>
<li>購入者が知りたい情報を具体的に記載する（例：サイズ感や使用感）。</li>
</ul>
</div>
<div class="section">
<h3>4. 価格設定</h3>
<p>適切な価格を設定するためのヒントです。</p>
<ul class="list">
<li>同様の商品の相場を調査する。</li>
<li>商品の状態や付属品を考慮に入れる。</li>
<li>セールや特典を利用する場合は、あらかじめ考慮する。</li>
</ul>
<div class="tips">
<strong>ヒント:</strong> 競争力のある価格設定を行い、売れる可能性を高めましょう。
</div>
</div>
<div class="section">
<h3>5. 出品手続き</h3>
<p>出品の際は、以下のステップに従ってください。</p>
<ul class="list">
<li>出品フォームに必要事項を記入する。</li>
<li>商品写真をアップロードする。</li>
<li>商品情報を確認し、出品を確定する。</li>
</ul>
</div>
<div class="section">
<h3>6. 取引後のフォローアップ</h3>
<p>取引後には、以下のことを心がけましょう。</p>
<ul class="list">
<li>購入者からのメッセージには迅速に対応する。</li>
<li>発送通知を忘れずに行う。</li>
<li>評価を行うことで、今後の取引を円滑にする。</li>
</ul>
</div>
<div class="section">
<h3>7. お問い合わせ</h3>
<p>出品に関する疑問や問題がある場合は、カスタマーサポートまでお問い合わせください。</p>
<p class="note">※ お問い合わせは、サポートページから行えます。</p>
</div>
<!-- メインメニューに戻るリンク -->
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">メインメニューに戻る</a></p>
</div>
</body>
</html>