package jcappy.members;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class SendMail {
	
	// 매개변수 : 발신자, 수신자, 제목, 내용
	public static void sendMail(String from, String to, String subject, String content) {

		try {
			// 1. 발신자 (메일서버) 정보 설정 (Property에 설정)
			Properties prop = System.getProperties();
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", "465");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.ssl.enable", "true");
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 에러나는 경우 TLS 버전


			// 2. Session 객체 생성 (http세션을 말하는게 아니고 다운받은걸 말하는거임)
	        Session session = Session.getDefaultInstance(prop, new Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("jcappy0322@gmail.com", "@j1234j@"); // 네이버 아이디 / 비밀번호
				}
			});
	        session.setDebug(true);
			
			// 3. MimeMessage 객체 생성 (발신자, 수신자, 제목, 내용 설정)
			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress(from)); // 발신자
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 수신자
			mimeMessage.setSubject(subject); // 제목
			mimeMessage.setText(content); // 내용
			
			// 4. 메일 전송
			Transport.send(mimeMessage);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void main (String[] args) {
		sendMail("jcappy06@gmail.com", "seee0758@gmail.com", "메일 전송 테스트", "testpwd");
	}
}
