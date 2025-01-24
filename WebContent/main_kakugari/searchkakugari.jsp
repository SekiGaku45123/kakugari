<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />

<c:import url="/common/base.jsp">
</c:import>


<style>
.main_search{
	display: grid;
	grid-template-columns: 25% 75%;
	column-gap: 5px;
	padding: 0 5vw;
	align-items: start;

}
.narrow_down{
	border:solid 2px #cccccc;
	border-radius: 10px 0 5px 10px;
	padding:0 10px;
}

.search_list{
	border:solid 2px #cccccc;
	text-align:center;
  	padding:10px 0 25px 8px;
  	border-radius: 0 10px 10px 5px;

}

.kakaka{
	max-width: 19%;
	display: grid;
	grid-template-columns: repeat(5, 100%);
	column-gap: 5%;
	row-gap: 40px;
	position: relative;
}

.imggmi{
	position: relative;
	width:12vw;
	height: 12vw;
}

.imggmi img:not(.sold1){
	border-radius: 5px 5px 5px 5px;
	object-fit: cover;
	width:100%;
	height: 100%;
	background:Yellow;
}

  .sold1{
  border-radius: 0 5px 0 0;
 position: absolute;
width:100%;
left:0;
background: none;
 }

.imggmi p {
  collar:#8f8d8d;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-line-clamp: 2; /* 2行で切り捨て */
  line-clamp: 2;
}

.underline{
	font-weight: 700;
	margin: 10px 0;
}

.custom-details summary {
  list-style: none; /* デフォルトの三角アイコンを非表示にする */
  cursor: pointer; /* カーソルをポインタにする */
  position: relative;
  padding-right: 1.5em; /* アイコン用のスペースを確保 */
  height: 50px;
  line-height: 50px;
  font-weight: 700;
  padding-left: 10px;
}

.underline_no{
	border-bottom: 1px solid #cccccc;
}

.custom-details summary::after{
	content: "+"; /* 閉じた状態のアイコン */
	position: absolute;
	right: 10px; /* アイコンを右端に表示 */
	font-size: 1.2em;
	color: #333;

}

.custom-details[open] summary::after {
  	content: "-";
}

.custom-details summary:hover {
	  background-color: #f5f5f5;
	  border-radius: 10px 10px 10px 10px;
}

.pet-select{
	width:100%;
	padding: 10px 0 10px 5px;
	margin: 10px 0 10px 0;
	border-radius: 5px 5px 5px 5px;
}

.checkbox1{
	padding: 0 0 0 10px;
}

.price_min_max{
	padding: 0 0 0 0;
	margin: 0 0 10px 0;
	text-align: center;
}

.price_min{
	width:40%;
	margin: 0 5px 0 0;
	padding: 5px 0 5px;
	border-radius: 5px 5px 5px 5px;
}

.price_max{
	width:40%;
	margin: 0 0 0 5px;
	padding: 5px 0  5px;
	border-radius: 5px 5px 5px 5px;
}

.price_min::-webkit-inner-spin-button,
.price_min::-webkit-outer-spin-button {
    -webkit-appearance: none;
    -moz-appearance:textfield;
}

.price_max::-webkit-inner-spin-button,
.price_max::-webkit-outer-spin-button {
    -webkit-appearance: none;
    -moz-appearance:textfield;
}

input[type="number"] {
    padding-left: 5px; /* 左側に5pxの余白を追加 */
}

.price_im{
  position: absolute;/*重ねたい子要素にabsolute*/
  top:65%;
  left: 0;
  background-color: rgba(0, 0, 0, 0.6);
  font-size: 1.3vw;
  color: white;
  padding: 5px 10px;
  border-radius: 0 30px 30px 0;
  font-weight: bold;
}

</style>




<div class="main_search">
	<c:set var="item1" value="${searchtin}" />
	<c:set var="category1" value="${categoryy}" />
	<div class="narrow_down">
		<div class="underline"><font color="#666666">絞り込む</font></div>
		<div class="underline_no"></div>
		<details class="custom-details">
			<summary>カテゴリー</summary>
				<select name="pets" class="pet-select" id="mySelectBox">
					<option value="all" class="font" >すべて</option>
					<c:forEach var="q" items="${searchcategory}">
					<option value="${q.getCategory()}" <c:if test="${item1 == q.getCategory()}">selected</c:if>>${q.getCategory()}</option>
					</c:forEach>
				</select>
		</details>

		<div class="underline_no"></div>
		<details class="custom-details">
			<summary>販売状況</summary>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales1" name="scales" />
			    	<label for="horns">販売中</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales2" name="scales" />
			    	<label for="horns">売り切れ</label>
			  	</div>
		</details>
		<div class="underline_no"></div>
		<details class="custom-details">
			<summary>商品状態</summary>
				<div class="checkbox1">
			    	<input type="checkbox" id="isNew" name="scales" />
			    	<label for="horns">新品・未使用</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="noDamage" name="scales" />
			    	<label for="horns">目立った傷や汚れなし</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="poorCondition" name="scales" />
			    	<label for="horns">全体的に状態が悪い</label>
			  	</div>
		</details>
		<div class="underline_no"></div>
		<details class="custom-details">
			<summary>価格</summary>
			<div class="price_min_max">
			<input type="number" class="price_min" name="price_min" placeholder="￥300"/>～<input type="number" class="price_max" name="price_max" placeholder="￥99999"/>
			</div>
		</details>
		<div class="underline_no"></div>
		<br>

	</div>
	<div class="search_list">

			<div class="kakaka" id="hantei">
			<c:forEach var="p" items="${search}">
			<c:set var="flag" value="${p.getFlag() }"/>
				<div class="imggmi">
						<a href="../kakugari/product?item_id=${p.getItem_id()}"><img src="${p.getImage_data()}"><c:if test="${flag == false }"><img class="sold1" src="../kakugari_image/SOLD.png" alt="SOLD OUT"></c:if>
						<p class="price_im">￥${p.getItem_price()}</p></a>
						<p>${p.getItem_name()}</p>
				</div>
			</c:forEach>

			</div>
			<div class="kakaka" id="result">
			</div>
	</div>



</div>


<br><br><br><br><br><br><br><br><br>

<!-- footerの読み込み -->
<jsp:include page="/footer.html" />

<script type="text/javascript">

var item1 = "${item1}";
var category1 = "${category1}";

	$(document).ready(function() {
		  $('.main_search select, .main_search input[type="checkbox"], .main_search input[type="number"]').change(function() {
			var selectedValue = $('#mySelectBox').val();

			var hanbai = $('#scales1').is(':checked');
			var urikire = $('#scales2').is(':checked');

	        // 価格
	        var priceMin = $('input[name="price_min"]').val();
	        var priceMax = $('input[name="price_max"]').val();

	        // 商品状態
	        var isNew = $('#isNew').is(':checked');              // 新品・未使用
	        var noDamage = $('#noDamage').is(':checked');        // 目立った傷や汚れなし
	        var poorCondition = $('#poorCondition').is(':checked');// 全体的に状態が悪い

		    $.ajax({
		      url: '../kakugari/categorysibori',  // サーバーのURL
		      type: 'POST',
		      data: {
		    	    value: selectedValue,
		    	    hanbai: hanbai,
		    	    urikire: urikire,
	                priceMin: priceMin,
	                priceMax: priceMax,
	                isNew: isNew,
	                noDamage: noDamage,
	                poorCondition: poorCondition,
	                item1: item1,        // 追加されたitem1
	                keyword: category1 // 追加されたcategory1
	                },
	                success: function(response) {
	                    var result = document.getElementById('result'); // Htmlのdivの部分を指定する
	                    var kakaka = document.getElementById('hantei');
	                    result.innerHTML = '';
	                    if (response.length > 0) {
	                        // responseにデータがある場合の処理
	                        kakaka.style.display = 'none';
	                        for (var i = 0; i < response.length; i++) {
	                            // 新しい要素を作成して追加
	                            var imggmi = document.createElement('div');
	                            var itemAtab = document.createElement('a');
	                            var itemImage = document.createElement('img');
	                            var itemprice = document.createElement('p');
	                            var itemname = document.createElement('p');

	                            itemAtab.href = "../kakugari/product?item_id="+response[i].item_id;

	                            console.log("flag"+response[i].flag);

	                            itemImage.src = response[i].image_data;
	                            itemImage.alt = response[i].item_name;

	                            itemprice.textContent = "￥"+ response[i].item_price;

	                            itemname.textContent = response[i].item_name;


	                            itemprice.className = 'price_im';

	                            imggmi.className = 'imggmi';

	                            itemAtab.appendChild(itemImage);

	                            if(response[i].flag === false){
	                            	var soldImage = document.createElement('img');
	                            	soldImage.className = 'sold1';
	                            	soldImage.src = '../kakugari_image/SOLD.png';
	                            	itemAtab.appendChild(soldImage);
	                            }

	                            itemAtab.appendChild(itemprice);

	                            imggmi.appendChild(itemAtab);
	                            imggmi.appendChild(itemname);

	                            result.appendChild(imggmi);
	                        }
	                    } if(response.length === 0){
	                        // responseが空（データがない）場合の処理
	                        kakaka.style.display = 'none'; // kakakaを非表示にする
	                        var noDataDiv = document.createElement('div');
	                        noDataDiv.textContent = 'データが見つかりませんでした'; // メッセージを設定
	                        result.appendChild(noDataDiv); // メッセージを表示
	                    }
	                },
		      error: function(xhr, status, error) {
		        console.error('AJAX request failed:', error);
		      }
		    });
		  });
		});



</script>




