package Contact;
import java.io.IOException;
import java.text.Normalizer;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns={"/contact/contact"})
public class Contact extends HttpServlet {
   // 不適切ワードのリスト
   private static final List<String> bannedWords = Arrays.asList(

      );
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // フォームからのデータを取得
       request.setCharacterEncoding("UTF-8");
       String name = request.getParameter("name");
       String email = request.getParameter("email");
       String message = request.getParameter("message");
       // データを確認するためにサーバー側で表示
       System.out.println("Name: " + name);
       System.out.println("Email: " + email);
       System.out.println("Message: " + message);
       // 入力内容の検証（不適切な言葉が含まれているかチェック）
       if (containsBannedWords(name) || containsBannedWords(message)) {
           // 不適切なワードが含まれていた場合
           request.setAttribute("error", "不適切な言葉が含まれています。再度ご入力ください。");
           request.getRequestDispatcher("contact.jsp").forward(request, response);
       } else {
           // JSPにデータを渡す
           request.setAttribute("name", name);
           request.setAttribute("email", email);
           request.setAttribute("message", message);
           request.getRequestDispatcher("form.jsp").forward(request, response);
       }
   }
   // 不適切ワードが含まれているかをチェックするメソッド
   private boolean containsBannedWords(String input) {
       if (input == null) {
           return false;
       }
       // 入力を正規化して、カタカナとひらがなの違いを無視して比較
       String normalizedInput = normalizeText(input);
       for (String word : bannedWords) {
           String normalizedWord = normalizeText(word);
           if (normalizedInput.contains(normalizedWord)) {
               return true;
           }
       }
       return false;
   }
   // ひらがなとカタカナの正規化を行うメソッド
   private String normalizeText(String input) {
       if (input == null) {
           return "";
       }
       // テキストを正規化し、カタカナをひらがなに統一
       String normalized = Normalizer.normalize(input, Normalizer.Form.NFKC);
       // カタカナをひらがなに変換
       StringBuilder hiragana = new StringBuilder();
       for (char c : normalized.toCharArray()) {
           if (c >= 'ァ' && c <= 'ン') {
               // カタカナをひらがなに変換（カタカナとひらがなのUnicodeの差は96）
               hiragana.append((char)(c - 0x60));
           } else {
               hiragana.append(c);
           }
       }
       return hiragana.toString().toLowerCase();  // 大文字・小文字の区別を無くすため
   }
}