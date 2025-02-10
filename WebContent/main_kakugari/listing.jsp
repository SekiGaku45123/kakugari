<%@page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList, java.net.URLEncoder"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" />


<style>
.main_listing{
	/*background: brown;*/
	border:2px dotted #000000;
	width: 90%;
	height: auto;
	margin: 20px auto 0;
}


.gazu_main{
	display: grid;
	padding: 10px 0 0;
	grid-template-columns: 30% 30% 30%;
	column-gap: 10px;
	place-content: center;
  	place-items: center;
}

#previewContainer{
	background: #e8e8e8;
	width: 25vw;
	height: 25vw;
}

#previewContainer2{
	background: #e8e8e8;
	width: 25vw;
	height: 25vw;

}

#previewContainer3{
	background: #e8e8e8;
	width: 25vw;
	height: 25vw;

}

#previewContainer img{
	object-fit: cover;
	width: 100%;
	height: 100%;
}

#previewContainer2 img{
	object-fit: cover;
	width: 100%;
	height: 100%;
}

#previewContainer3 img{
	object-fit: cover;
	width: 100%;
	height: 100%;
}

#fileInput {
    display: none;
}
#fileInput2 {
    display: none;
}
#fileInput3 {
    display: none;
}
/* カスタムボタンを作成 */
.custom-button {
    display: inline-block;
    padding: 5px 20px;
    background-color: #dbdbdb;
    /*color: white;*/
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    margin: 5px 0;
}

.custom-button:hover {
    background-color: #dbdbdb;
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

}


.goods_detail textarea{
  position: relative;
  padding: 1px 20px 1px;
  margin: 0 0 10px 0;
  border-radius: 20px;
  z-index:9998;
  field-sizing: content;
  width: 80%;
  height: 5lh;
  resize: none;
  overflow-y: scroll;
  overscroll-behavior: contain;
}

textarea::-webkit-scrollbar{
  display: none;
}
/* メインメニューリンク */
  .return-link {
      display: inline-block;
      margin: 40px 0 0 0; /* 上部マージン */
      padding: 10px 20px;
      color: #fff; /* 文字色を白に設定 */
      background-color: #afafb0; /* 緑ベース */
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease, transform 0.2s ease; /* ホバー時の動き */
  }
  .return-link:hover {
       background: #0d0015;
       color: white;
   }



</style>
<form action="${pageContext.request.contextPath}/kakugari/listing" method="post" enctype="multipart/form-data">
<div class="main_listing">
	<div class ="warning"><font color=red>${messe }</font></div>
  <div class="gazu_main">
	 <div class="images_input1">
		<div id="previewContainer">
	    </div>
	    <label for="fileInput" class="custom-button">画像を選択1</label>
		<input type="file" id="fileInput" accept="image/*" name="photo">
	 </div>

	 <div class="images_input2">
	    <div id="previewContainer2">
	    </div>
	    <label for="fileInput2" class="custom-button">画像を選択2</label>
		<input type="file" id="fileInput2" accept="image/*" name="photo1">
	 </div>

	 <div class="images_input3">
	    <div id="previewContainer3">
	    </div>
		<label for="fileInput3" class="custom-button">画像を選択3</label>
		<input type="file" id="fileInput3" accept="image/*" name="photo2">
	 </div>
  </div>

  <div class="goods_name">

	<p>商品名</p>
	<input type="text" name="item_name" maxlength="40" placeholder="必須(40文字まで)" required>

  </div>
  <br>
  <div class="goods">

  <details class="custom-details">
			<summary><font color="#ff476f">カテゴリ</font></summary>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales1" name="scales" value="ファッション" />
			    	<label for="horns">ファッション</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales2" name="scales" value="ベビー・キッズ" />
			    	<label for="horns">ベビー・キッズ</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales3" name="scales" value="ゲーム・おもちゃ・グッズ" />
			    	<label for="horns">ゲーム・おもちゃ・グッズ</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales4" name="scales" value="ホビー・楽器・アート" />
			    	<label for="horns">ホビー・楽器・アート</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales5" name="scales" value="チケット" />
			    	<label for="horns">チケット</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales6" name="scales" value="本・雑誌・漫画" />
			    	<label for="horns">本・雑誌・漫画</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales7" name="scales" value="CD・DVD・Blu-ray" />
			    	<label for="horns">CD・DVD・Blu-ray</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales8" name="scales" value="スマホ・タブレット・パソコン" />
			    	<label for="horns">スマホ・タブレット・パソコン</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales9" name="scales" value="テレビ・オーディオ・カメラ" />
			    	<label for="horns">テレビ・オーディオ・カメラ</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales10" name="scales" value="生活家電・空調" />
			    	<label for="horns">生活家電・空調</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales11" name="scales" value="スポーツ" />
			    	<label for="horns">スポーツ</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales12" name="scales" value="アウトドア・釣り・旅行用品" />
			    	<label for="horns">アウトドア・釣り・旅行用品</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales13" name="scales" value="コスメ・美容" />
			    	<label for="horns">コスメ・美容</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales14" name="scales" value="ダイエット・健康" />
			    	<label for="horns">ダイエット・健康</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales15" name="scales" value="食品・飲料・酒" />
			    	<label for="horns">食品・飲料・酒</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales16" name="scales" value="キッチン・日用品・その他" />
			    	<label for="horns">キッチン・日用品・その他</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales17" name="scales" value="家具・インテリア" />
			    	<label for="horns">家具・インテリア</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales18" name="scales" value="ペット用品" />
			    	<label for="horns">ペット用品</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales19" name="scales" value="フラワー・ガーデニング" />
			    	<label for="horns">フラワー・ガーデニング</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales20" name="scales" value="ハンドメイド・手芸" />
			    	<label for="horns">ハンドメイド・手芸</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="scales21" name="scales" value="車・バイク・自転車" />
			    	<label for="horns">車・バイク・自転車</label>
			  	</div>

		</details>

  <details class="custom-details">
			<summary><font color="#ff476f">商品状態</font></summary>
				<div class="checkbox1">
			    	<input type="checkbox" id="isNew" name="scales1" class="check" value="新品" />
			    	<label for="horns">新品・未使用</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="noDamage" name="scales1" class="check" value="目立った傷や汚れなし" />
			    	<label for="horns">目立った傷や汚れなし</label>
			  	</div>
			  	<div class="checkbox1">
			    	<input type="checkbox" id="poorCondition" name="scales1" class="check" value="全体的に状態が悪い" />
			    	<label for="horns">全体的に状態が悪い</label>
			  	</div>
		</details>


  </div>
  <div class="goods_detail">
	<p>商品の説明</p>
	<textarea id="comment_input" name="goods_deta" required></textarea>
  </div>
  <div class="price">

  <p>発送について</p>
  <details class="custom-details">
			<summary><font color="#ff476f">発送元の地域</font></summary>
			  	<select name="region">
				    <option value="" selected>選択してください</option>
				    <option value="北海道">北海道</option>
				    <option value="青森県">青森県</option>
				    <option value="岩手県">岩手県</option>
				    <option value="宮城県">宮城県</option>
				    <option value="秋田県">秋田県</option>
				    <option value="山形県">山形県</option>
				    <option value="福島県">福島県</option>
				    <option value="茨城県">茨城県</option>
				    <option value="栃木県">栃木県</option>
				    <option value="群馬県">群馬県</option>
				    <option value="埼玉県">埼玉県</option>
				    <option value="千葉県">千葉県</option>
				    <option value="東京都">東京都</option>
				    <option value="神奈川県">神奈川県</option>
				    <option value="新潟県">新潟県</option>
				    <option value="富山県">富山県</option>
				    <option value="石川県">石川県</option>
				    <option value="福井県">福井県</option>
				    <option value="山梨県">山梨県</option>
				    <option value="長野県">長野県</option>
				    <option value="岐阜県">岐阜県</option>
				    <option value="静岡県">静岡県</option>
				    <option value="愛知県">愛知県</option>
				    <option value="三重県">三重県</option>
				    <option value="滋賀県">滋賀県</option>
				    <option value="京都府">京都府</option>
				    <option value="大阪府">大阪府</option>
				    <option value="兵庫県">兵庫県</option>
				    <option value="奈良県">奈良県</option>
				    <option value="和歌山県">和歌山県</option>
				    <option value="鳥取県">鳥取県</option>
				    <option value="島根県">島根県</option>
				    <option value="岡山県">岡山県</option>
				    <option value="広島県">広島県</option>
				    <option value="山口県">山口県</option>
				    <option value="徳島県">徳島県</option>
				    <option value="香川県">香川県</option>
				    <option value="愛媛県">愛媛県</option>
				    <option value="高知県">高知県</option>
				    <option value="福岡県">福岡県</option>
				    <option value="佐賀県">佐賀県</option>
				    <option value="長崎県">長崎県</option>
				    <option value="熊本県">熊本県</option>
				    <option value="大分県">大分県</option>
				    <option value="宮崎県">宮崎県</option>
				    <option value="鹿児島県">鹿児島県</option>
				    <option value="沖縄県">沖縄県</option>
				</select>
		</details>

  <details class="custom-details">
			<summary><font color="#ff476f">発送までの日数</font></summary>
			<input type="number" name="shopping_days" maxlength="2" placeholder="日数" required>
		</details>


	<p>販売価格</p>
	<input type="number" name="item_price" maxlength="9" placeholder="￥0" required>

  </div>


</div>

<input type="submit" value="出品" id="submitBtn" class="btn btn-primary">
<p><a href="${pageContext.request.contextPath}/main_kakugari/all" class="return-link">トップページに戻る</a></p>
</form>

<br><br><br>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

document.getElementById('fileInput').addEventListener('change', function(event) {
    const file = event.target.files[0]; // 選択されたファイルを取得

    if (file && file.type.startsWith('image/')) { // 画像ファイルか確認
        const reader = new FileReader();

        reader.onload = function(e) {
            // プレビュー用の要素を作成
            const previewContainer = document.getElementById('previewContainer');
            previewContainer.innerHTML = ''; // 前のプレビューをクリア
            const img = document.createElement('img');
            img.src = e.target.result; // 読み込んだデータを画像に設定
            img.alt = '選択した画像';
            //img.style.maxWidth = '300px'; // 画像サイズの調整
            //img.style.maxHeight = '300px';
            previewContainer.appendChild(img);
        };

        reader.readAsDataURL(file); // ファイルをData URLとして読み込む
    } else {
        alert('画像ファイルを選択してください！');
    }
});

document.getElementById('fileInput2').addEventListener('change', function(event) {
    const file = event.target.files[0]; // 選択されたファイルを取得

    if (file && file.type.startsWith('image/')) { // 画像ファイルか確認
        const reader = new FileReader();

        reader.onload = function(e) {
            // プレビュー用の要素を作成
            const previewContainer = document.getElementById('previewContainer2');
            previewContainer.innerHTML = ''; // 前のプレビューをクリア
            const img = document.createElement('img');
            img.src = e.target.result; // 読み込んだデータを画像に設定
            img.alt = '選択した画像';
            //img.style.maxWidth = '300px'; // 画像サイズの調整
            //img.style.maxHeight = '300px';

            previewContainer.appendChild(img);
        };

        reader.readAsDataURL(file); // ファイルをData URLとして読み込む
    } else {
        alert('画像ファイルを選択してください！');
    }
});

document.getElementById('fileInput3').addEventListener('change', function(event) {
    const file = event.target.files[0]; // 選択されたファイルを取得

    if (file && file.type.startsWith('image/')) { // 画像ファイルか確認
        const reader = new FileReader();

        reader.onload = function(e) {
            // プレビュー用の要素を作成
            const previewContainer = document.getElementById('previewContainer3');
            previewContainer.innerHTML = ''; // 前のプレビューをクリア
            const img = document.createElement('img');
            img.src = e.target.result; // 読み込んだデータを画像に設定
            img.alt = '選択した画像';
            //img.style.maxWidth = '300px'; // 画像サイズの調整
            //img.style.maxHeight = '300px';

            previewContainer.appendChild(img);
        };

        reader.readAsDataURL(file); // ファイルをData URLとして読み込む
    } else {
        alert('画像ファイルを選択してください！');
    }
});


$(function() {
    $('.check').on('click', function() {
        if ($(this).prop('checked')) {
            // 一旦全てをクリアして再チェックする
            $('.check').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const checkboxes = document.querySelectorAll('input[name="scales"]');

    checkboxes.forEach(checkbox => {
      checkbox.addEventListener("change", function () {
        if (this.checked) {
          checkboxes.forEach(cb => {
            if (cb !== this) cb.checked = false;
          });
        }
      });
    });
  });



document.getElementById("submitBtn").addEventListener("click", function(event) {
    let checkboxes = document.querySelectorAll('input[name="scales"]:checked');

    if (checkboxes.length === 0) {
        alert("カテゴリを1つ選択してください！");
        event.preventDefault(); // 送信をブロック
    }
});

document.getElementById("submitBtn").addEventListener("click", function(event) {
    let checkboxes = document.querySelectorAll('input[name="scales1"]:checked');

    if (checkboxes.length === 0) {
        alert("商品状態を選択してください！");
        event.preventDefault(); // 送信をブロック
    }
});

</script>