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
            throws ServletException, IOException
    {
        String recipient = request.getParameter("recipient");
        String subject = request.getParameter("subject");
        String body = request.getParameter("body");

        final String username = "gaku0867motakimaru@gmail.com"; // 自分のメールアドレス
        final String password = "rlhb bgun lygi wael"; // メールアカウントのパスワード

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {

                    return new PasswordAuthentication(username, password);

                }

            });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setText(body);
            Transport.send(message);
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("お問い合わせありがとうございます！送信完了メールが送られます。");
            response.getWriter().println("<p><a href=\"" + request.getContextPath() + "/main_kakugari/all\" class=\"return-link\">メインメニューに戻る</a></p>");
        } catch (MessagingException e) {
            response.getWriter().println("エラーが発生しました。。: " + e.getMessage());
        }
    }
}
