package kosta.spring.postIT.model.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component
public class SendEmail {

	public int SendEmailMethod(String userId, String userEmail) {
		
		  final String user   = "moonnighthavana@gmail.com";
		  final String password  = "Test123@";
		  
		  //4자리 난수발생  
		  Random random = new Random();		  
		  int result = random.nextInt(10000)+1000;		  
		  if(result>10000) {
			  result = result-1000;
		  }

		  // Get the session object
		  Properties props = new Properties();

		  //구글
		  props.put("mail.transport.protocol", "smtp");
		  props.put("mail.smtp.host", "smtp.gmail.com"); 
		  props.put("mail.smtp.port", "587"); 
		  props.put("mail.smtp.starttls.enable", "true");
		  props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory"); 
		  props.put("mail.smtp.auth","true");
		
		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(user, password);
			   }
		  });
		
		  // Compose the message
		  try {
			   MimeMessage message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(user));
			   message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
			
			   // Subject
			   message.setSubject("[PostIT] 비밀번호 변경관련 메일입니다.");
			   
			   // Text
			   message.setText("<"+userId+">님의 PostIT의 임시 비밀번호는 ["+result+"] 입니다.");
			
			   // send the message
			   Transport.send(message);
			   System.out.println("message sent successfully...");
		
		  } catch (MessagingException e) {
			   e.printStackTrace();
		  }
		  
		  return result;
	 }
} //http://oskardevelopers.blogspot.com/2016/10/java-library-javamail-api.html