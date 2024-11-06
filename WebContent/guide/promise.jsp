<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>カクガリ利用規約</title>
<style>
       body {
           font-family: "Helvetica Neue", Arial, sans-serif;
           background-color: #f4f7f6;
           color: #444;
           margin: 0;
           padding: 0;
       }
       .container {
           max-width: 900px;
           margin: 0 auto;
           padding: 40px 20px;
           background: #ffffff;
           border-radius: 10px;
           box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
       }
       h1 {
           color: #00796b;
           text-align: center;
           font-size: 2em;
           font-weight: 700;
           margin-bottom: 1em;
       }
       .section-title {
           display: flex;
           align-items: center;
           font-size: 1.3em;
           color: #00796b;
           margin-top: 1.5em;
           border-bottom: 2px solid #00796b;
           padding-bottom: 0.3em;
       }
       .section-title img {
           margin-right: 10px;
           width: 24px;
           height: 24px;
       }
       p, li {
           margin: 0.8em 0;
           line-height: 1.6;
       }
       ul {
           list-style-type: disc;
           padding-left: 1.5em;
       }
       .highlight {
           background-color: #e0f7fa;
           padding: 10px;
           border-radius: 5px;
           margin-top: 10px;
           color: #006064;
           font-weight: bold;
       }
       /* メインメニューリンク */
       .return-link {
           display: inline-block;
           margin-top: 20px;
           padding: 10px 20px;
           color: #fff;
           background-color: #006064;
           text-decoration: none;
           border-radius: 5px;
           transition: background-color 0.3s ease;
       }

</style>
</head>
<body>
<div class="container">
<h1>カクガリ利用規約</h1>
<div class="section-title">
<img src="icons/intro-icon.png" alt="Intro Icon">
<span>第1章 総則</span>
</div>
<p>本規約は、カクガリの利用に関する基本的なルールを定め、ユーザーが安全に利用できる環境を提供することを目的としています。</p>
<div class="section-title">
<img src="icons/registration-icon.png" alt="Registration Icon">
<span>第2章 利用契約</span>
</div>
<p>ユーザーは、本規約を承諾した上で会員登録を行うことが必要です。</p>
<ul>
<li>アカウント情報の正確性を維持すること</li>
<li>未成年者の場合は親権者の同意を得ること</li>
</ul>
<div class="section-title">
<img src="icons/transaction-icon.png" alt="Transaction Icon">
<span>第3章 取引</span>
</div>
<p>取引に関するルールは以下の通りです：</p>
<ul>
<li>商品の適正価格を設定すること</li>
<li>出品内容と実物に相違がないよう注意すること</li>
</ul>
<div class="highlight">重要: 禁止事項を厳守し、他の利用者に迷惑をかけないようご注意ください。</div>
<!-- メインメニューに戻るリンク -->
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">メインメニューに戻る</a></p>
</div>
</div>
</body>
</html>