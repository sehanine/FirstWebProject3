package web.member;

import java.util.Properties;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;

public class JavaMailAPI {
	  
	public JavaMailAPI(){
		String to = "받는 사람";
		String from = "보내는 사람";
		
		final String username = "~@gmail.com";// your mail
		final String password = "password"; // your password
		
		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
//		
//		Session session = Session.getInstance(props,
//		         new javax.mail.Authenticator() {
//		            protected PasswordAuthentication getPasswordAuthentication() {
//		               return new PasswordAuthentication(username, password);
//			   }
//		});
//		 try {
//			   Message message = new MimeMessage(session);
//			   message.setFrom(new InternetAddress(from));
//			   message.setRecipients(Message.RecipientType.TO,
//		               InternetAddress.parse(to));
//			
//			
//			   message.setSubject("제목");
//			   message.setText("내용");
//
//			   // Send message
//			   Transport.send(message);
//
//			   System.out.println("메세지가 성공적으로 보내졌습니다.");
//
//		      } catch (MessagingException e) {
//		         throw new RuntimeException(e);
//		      }
//		   
	}

	public static void main(String[] args){
		new JavaMailAPI();
	}

}
