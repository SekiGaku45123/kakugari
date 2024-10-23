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
@WebServlet(urlPatterns = {"/contact/contact"})
public class Contact extends HttpServlet {
   private static final List<String> bannedWords = Arrays.asList(
       "死", "しね", "殺", "うんち", "きんたま", "金玉", "あなる", "シャブ", "はげ", "ちんこ",
       "クスリ", "ファック", "fucker", "fuck", "fxxk", "f××k", "おなら", "おっぱい",
       "shit", "hell", "しっと", "コロナ", "クズ", "ポルノ", "風俗", "kill", "刺",
       "ダサい", "ヤリ捨て", "びっち", "レイプ", "性病", "奴隷", "カス", "クソ",
       "闇バイト", "反社", "キャバ", "ホモ", "ゲイ", "レズ", "バイセクシャル", "黒人",
       "ちび", "デブ", "無能", "ざこ", "きもい", "どっかいけ", "消えろ"
   );
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       String name = request.getParameter("name");
       String email = request.getParameter("email");
       String message = request.getParameter("message");
       System.out.println("Name: " + name);
       System.out.println("Email: " + email);
       System.out.println("Message: " + message);
       if (containsBannedWords(name) || containsBannedWords(message)) {
           request.setAttribute("error", "不適切な言葉が含まれています。再度ご入力ください。");
           request.getRequestDispatcher("contact.jsp").forward(request, response);
       } else {
           // Inquiryオブジェクトを作成
           Inquiry inquiry = new Inquiry(name, email, message);
           InquiryDao inquiryDao = new InquiryDao();
           // データベースに保存
           if (inquiryDao.saveInquiry(inquiry)) {
               request.setAttribute("name", name);
               request.setAttribute("email", email);
               request.setAttribute("message", message);
               request.getRequestDispatcher("form.jsp").forward(request, response);
           } else {
               request.setAttribute("error", "データベースエラーが発生しました。再度お試しください。");
               request.getRequestDispatcher("contact.jsp").forward(request, response);
           }
       }
   }
   private boolean containsBannedWords(String input) {
       if (input == null) {
           return false;
       }
       String normalizedInput = normalizeText(input);
       for (String word : bannedWords) {
           String normalizedWord = normalizeText(word);
           if (normalizedInput.contains(normalizedWord)) {
               return true;
           }
       }
       return false;
   }
   private String normalizeText(String input) {
       if (input == null) {
           return "";
       }
       String normalized = Normalizer.normalize(input, Normalizer.Form.NFKC);
       StringBuilder hiragana = new StringBuilder();
       for (char c : normalized.toCharArray()) {
           if (c >= 'ァ' && c <= 'ン') {
               hiragana.append((char) (c - 0x60));
           } else {
               hiragana.append(c);
           }
       }
       return hiragana.toString().toLowerCase();
   }
}