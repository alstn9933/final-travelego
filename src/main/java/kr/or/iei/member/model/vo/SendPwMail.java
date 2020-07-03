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

public class SendPwMail {
	public void SendPwMail(String memberId, String email, long timeDate) {
				StringBuilder sb = new StringBuilder();
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
					msg.setFrom(new InternetAddress("jh170422@gmail.com","Tracelego 비밀번호 재설정입니다."));
					InternetAddress to = new InternetAddress(email);
					msg.setRecipient(Message.RecipientType.TO, to);
					msg.setSubject("Travelego 비밀번호 재설정.","UTF-8");
					//각 컴퓨터 마다 호스트가 다르기때문에 각컴퓨터에서 확인시  localhost 변경 필 
					msg.setContent("<h1>안녕하세요. Travelego입니다.</h1>"
							+ "<a href='http://localhost/pwChange.do?memberId="+memberId+"&timeDate="+timeDate+"'>비밀번호 변경페이지로 이동</a>"
							+ "<br>비밀번호페이지는 약 5분간 사용이 가능하며 그이외에는 비밀번호 변경이 불가합니다."
							+ "<br>이용해주셔서 감사합니다.","text/html;charset=UTF-8");
					Transport.send(msg);
					//메일 전송
					
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
}
