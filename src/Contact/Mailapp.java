package Contact;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contact/email")

public class Mailapp extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response)

           throws ServletException, IOException {

       String recipient = request.getParameter("recipient");

       String subject = request.getParameter("subject");

       String body = request.getParameter("body");


    // データの確認（例: コンソールに出力）

       System.out.println("お名前: " + subject);

       System.out.println("メールアドレス: " + recipient);

       System.out.println("お問い合わせ内容: " + body);

       // 必要に応じて、データベースに保存、メール送信等の処理を行う

       // ここでは仮にメール送信する例を示します。

       try {

           sendEmail(subject, recipient, body);

       } catch (MessagingException e) {

           e.printStackTrace();

       }

       // 結果ページにリダイレクトまたは結果を表示

       response.sendRedirect("thankyou.jsp");

   }


private void sendEmail(String name, String email, String message) throws MessagingException {

    String to = "ngn2349515@stu.o-hara.ac.jp"; // 受信メールアドレス

    String subject = "新しいお問い合わせ";

    String body = "お名前: " + name + "\nメールアドレス: " + email + "\nお問い合わせ内容: " + message;

    // メールの送信（Gmail SMTPサーバーを使用する例）

    Properties props = new Properties();

    props.put("mail.smtp.host", "smtp.gmail.com");

    props.put("mail.smtp.port", "587");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    // Gmailアカウント情報

    String username = "gaku0867motakimaru@gmail.com";

    String password = "hxjb zqkt bolq cics";

    Session session = Session.getInstance(props, new javax.mail.Authenticator() {

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(username, password);

        }

    });

    Message msg = new MimeMessage(session);

    msg.setFrom(new InternetAddress(username));

    msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

    msg.setSubject(subject);

    msg.setText(body);

    Transport.send(msg);

}

}


       //final String username = "gaku0867motakimaru@gmail.com"; // 自分のメールアドレス

      // final String password = "hxjb zqkt bolq cics"; // メールアカウントのパスワード

      // Properties props = new Properties();

      // props.put("mail.smtp.auth", "true");

      // props.put("mail.smtp.starttls.enable", "true");

     //  props.put("mail.smtp.host", "smtp.gmail.com");

     //  props.put("mail.smtp.port", "587");

     //  Session session = Session.getInstance(props,

       //    new javax.mail.Authenticator() {

      //         protected PasswordAuthentication getPasswordAuthentication() {

      //             return new PasswordAuthentication(username, password);

       //        }

       //    });

      // try {

      //     Message message = new MimeMessage(session);

      //     message.setFrom(new InternetAddress(username));

      //     message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));

      //     message.setSubject(subject);

      //     message.setText(body);

       //    Transport.send(message);

       //    response.setContentType("text/html; charset=UTF-8");

       //    response.getWriter().println("<p style='color: blue;'>お問い合わせありがとうございます！送信完了メールが送られます。</p>");

     //      response.getWriter().println("<p><a href=\"" + request.getContextPath() + "/main_kakugari/all\" class=\"return-link\" style='color: blue;'>メインメニューに戻る</a></p>");

   //    } catch (MessagingException e) {

   //        response.getWriter().println("<p style='color: red;'>エラーが発生しました。。: " + e.getMessage() + "</p>");

    //   }

//  }

//}
