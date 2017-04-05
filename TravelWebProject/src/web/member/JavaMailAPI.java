package web.member;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

 
public class JavaMailAPI {
	  /**
	   * 
	   * @param to 받는 사람
	   * @param ranCode 랜덤 코드
	   */
	public JavaMailAPI(String to, String ranCode, String nick, String pwd){
		
		String from = "festigo.master@gmail.com";
		
		final String username = "festigo.master@gmail.com";// your mail
		final String password = "webproject"; // your password
		
		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(props,
		         new javax.mail.Authenticator() {
		            protected PasswordAuthentication getPasswordAuthentication() {
		               return new PasswordAuthentication(username, password);
			   }
		});
		 try {
			   Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(from));
			   message.setRecipients(Message.RecipientType.TO,
		               InternetAddress.parse(to));
			
			
			   message.setSubject("festigo 회원가입 이메일 인증");
			   message.setText(
					   "안녕하세요" + nick + "님, festigo입니다.\n\n" 
					  +"닉네임: " + nick + "\n"
					  +"비밀번호: " + pwd + "\n"
					  +"인증번호: " + ranCode + "\n"
					  +"\n이메일을 인증해 주세요.");

			   // Send message
			   Transport.send(message);

			   System.out.println("메세지가 성공적으로 보내졌습니다.");

		      } catch (MessagingException e) {
		         throw new RuntimeException(e);
		      }
		   
	}

}
