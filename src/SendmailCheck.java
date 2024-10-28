import java.io.IOException;
public class SendmailCheck {
   public static void main(String[] args) {
       try {
           // which sendmail コマンドを実行して結果を確認
           Process process = new ProcessBuilder("which", "sendmail").start();
           int exitCode = process.waitFor();
           if (exitCode == 0) {
               System.out.println("sendmail がインストールされています。");
           } else {
               System.out.println("sendmail はインストールされていません。");
           }
       } catch (IOException | InterruptedException e) {
           e.printStackTrace();
       }
   }
}