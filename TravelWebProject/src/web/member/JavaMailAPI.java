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
	   * @param to �޴� ���
	   * @param ranCode ���� �ڵ�
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
			
			
			   message.setSubject("festigo ȸ������ �̸��� ����");
			   message.setText(
					   "�ȳ��ϼ���" + nick + "��, festigo�Դϴ�.\n\n" 
					  +"�г���: " + nick + "\n"
					  +"��й�ȣ: " + pwd + "\n"
					  +"������ȣ: " + ranCode + "\n"
					  +"\n�̸����� ������ �ּ���.");

			   // Send message
			   Transport.send(message);

			   System.out.println("�޼����� ���������� ���������ϴ�.");

		      } catch (MessagingException e) {
		         throw new RuntimeException(e);
		      }
		   
	}

}
