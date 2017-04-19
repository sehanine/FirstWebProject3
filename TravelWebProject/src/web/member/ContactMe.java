package web.member;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import board.dao.TeamVO;

 
public class ContactMe {
	  /**
	   * 
	   * @param to �޴� ���
	   * @param ranCode ���� �ڵ�
	   */
	public ContactMe(TeamVO vo){
		/*
		vo.setName(request.getParameter("inputName"));
		vo.setEmail(request.getParameter("inputEmail"));
		vo.setSubject(request.getParameter("inputPhone"));
		vo.setContent(request.getParameter("inputMessage"));
		*/
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
		               InternetAddress.parse(from));
			
				/*
				vo.setName(request.getParameter("inputName"));
				vo.setEmail(request.getParameter("inputEmail"));
				vo.setSubject(request.getParameter("inputPhone"));
				vo.setpwd(request.getParameter("inputMessage"));
				*/
			   message.setSubject(vo.getName() + "���� (festigo) ���� ����");
			   message.setText(
					   "���� ����: " + vo.getEmail() + "\n"
					 + "����ó: " + vo.getSubject() + "\n\n"
					 + vo.getPwd() );

			   // Send message
			   Transport.send(message);

			   System.out.println("�޼����� ���������� ���������ϴ�.");

		      } catch (MessagingException e) {
		         throw new RuntimeException(e);
		      }
		   
	}

}
