package kr.or.iei.member.model.vo;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
	public String mailSend(String email) {
		//1.랜덤코드 생성
				Random r = new Random();
				StringBuilder sb = new StringBuilder();
				for(int i=0;i<6;i++) {
					sb.append(r.nextInt(10));
				}
				System.out.println(sb.toString());
				//2.메일설정(사용할 메일 서버 설정.)
				Properties prop = System.getProperties();
				prop.put("mail.smtp.host", "smtp.gmail.com");
				prop.put("mail.smtp.port", 465);
				prop.put("mail.smtp.auth", "true");
				prop.put("mail.smtp.ssl.enable", "true");
				prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				//메일 계정 정보 설정.
				Session session = Session.getDefaultInstance(prop,new Authenticator(){
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("jh170422@gmail.com","pioxyjrsxqxgrmkz");
					}
					 
				});
				MimeMessage msg = new MimeMessage(session);
				try {
					msg.setSentDate(new Date());
					msg.setFrom(new InternetAddress("jh170422@gmail.com","Tracelego 인증번호 발급."));
					InternetAddress to = new InternetAddress(email);
					msg.setRecipient(Message.RecipientType.TO, to);
					msg.setSubject("인증메일(메일제목)","UTF-8");
					msg.setContent("<h1>Travelego</h1><h3>인증번호["+sb.toString()+"]","text/html;charset=UTF-8");
					Transport.send(msg);
					//메일 전송
					
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return sb.toString();
				
			}
}
