<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>プライバシーポリシー / Privacy Policy</title>
<style>
       body {
           font-family: Arial, sans-serif;
           margin: 0;
           padding: 20px;
           background-color: #f4f4f9;
       }
       .container {
           max-width: 800px;
           margin: auto;
           background-color: #fff;
           padding: 20px;
           border-radius: 8px;
           box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
       }
       h2 {
           color: #4CAF50;
           text-align: center;
       }
       .section-title {
           font-weight: bold;
           margin-top: 20px;
           color: #333;
       }
       p {
           line-height: 1.6;
           color: #666;
       }
       .language-switch {
           text-align: center;
           margin-top: 10px;
       }
       .language-switch button {
           background-color: #4CAF50;
           color: white;
           border: none;

           padding: 8px 16px;
           border-radius: 4px;
           cursor: pointer;
           font-size: 14px;
       }
       ul {
           margin-top: 10px;
           padding-left: 20px;
           color: #666;
       }
       /* メインメニューリンク */
       .return-link {
           display: inline-block;
           margin-top: 20px;
           padding: 10px 20px;
           color: #fff;
           background-color: #4CAF50;
           text-decoration: none;
           border-radius: 5px;
           transition: background-color 0.3s ease;
       }
</style>
</head>
<body>
<div class="container">
<h2>Privacy Policy</h2>
<!-- 言語切り替えボタン -->
<div class="language-switch">
<form action="privacy_policy.jsp" method="get">
<button type="submit" name="lang" value="jp">日本語</button>
<button type="submit" name="lang" value="en">English</button>
</form>
</div>
<!-- プライバシーポリシー内容 -->
<c:choose>
<c:when test="${param.lang == 'en'}">
<div>
<h2>Privacy Policy</h2>
<p>This Privacy Policy explains how we handle your personal information in accordance with our commitment to protect your privacy.</p>
<h3 class="section-title">1. Information We Collect</h3>
<p>We may collect personal information such as:</p>
<ul>
<li>Name, email address, phone number</li>
<li>Device information, IP address, and location data</li>
<li>Transaction and payment information</li>
</ul>
<h3 class="section-title">2. Purpose of Use</h3>
<p>Your personal information is used for the following purposes:</p>
<ul>
<li>Providing and improving our services</li>
<li>Personalizing user experience</li>
<li>Preventing fraudulent activity</li>
</ul>
<h3 class="section-title">3. Sharing of Information</h3>
<p>We may share your personal data with third parties in the following cases:</p>
<ul>
<li>With your consent</li>
<li>For legal compliance and enforcement</li>
<li>With service providers supporting our business</li>
</ul>
<h3 class="section-title">4. Security Measures</h3>
<p>We implement appropriate security measures to protect your data.</p>
<h3 class="section-title">5. User Rights</h3>
<p>You have the right to access, correct, and delete your personal information.</p>
<h3 class="section-title">6. Policy Updates</h3>
<p>We may update this policy periodically. Please review it for the latest updates.</p>
</div>
</c:when>
<c:otherwise>
<div>
<h2>プライバシーポリシー</h2>
<p>本プライバシーポリシーは、お客様の個人情報の取扱いに関して、当社が責任を持って保護する方針を示します。</p>
<h3 class="section-title">1. 収集する情報</h3>
<p>当社は、以下のような個人情報を収集することがあります：</p>
<ul>
<li>氏名、メールアドレス、電話番号</li>
<li>デバイス情報、IPアドレス、位置情報</li>
<li>取引および支払い情報</li>
</ul>
<h3 class="section-title">2. 利用目的</h3>
<p>お客様の個人情報は以下の目的で使用されます：</p>
<ul>
<li>サービスの提供および改善</li>
<li>ユーザー体験の個別化</li>
<li>不正行為の防止</li>
</ul>
<h3 class="section-title">3. 情報の共有</h3>
<p>当社は以下のケースで第三者と個人情報を共有することがあります：</p>
<ul>
<li>お客様の同意がある場合</li>
<li>法的義務を遵守するため</li>
<li>業務を支援するサービスプロバイダーとの提携</li>
</ul>
<h3 class="section-title">4. セキュリティ対策</h3>
<p>当社はお客様のデータを保護するために適切なセキュリティ対策を講じています。</p>
<h3 class="section-title">5. ユーザーの権利</h3>
<p>お客様には、個人情報の確認、訂正、削除を求める権利があります。</p>
<h3 class="section-title">6. ポリシーの更新</h3>
<p>当社は本ポリシーを随時更新する場合があります。最新の情報を本ページでご確認ください。</p>
</div>
</c:otherwise>
</c:choose>
</div>
<!-- メインメニューに戻るリンク -->
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">メインメニューに戻る</a></p>
</div>
</body>
</html>