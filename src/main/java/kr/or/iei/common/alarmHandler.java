package kr.or.iei.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.iei.notification.model.service.NotificationService;

@Component("alarmHandler")
public class alarmHandler extends TextWebSocketHandler {
	
	//로그인 한 전체
	ArrayList<WebSocketSession> webSessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessionMap =  new HashMap<String, WebSocketSession>();
	
	//소켓이 생성되어 연결 되었을때 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("소켓연결성공");
		webSessions.add(session);//신규 전속자 정보 저장
	}
	@Override
	protected void handleTextMessage(WebSocketSession session,TextMessage message)throws Exception {
		JsonParser parser = new JsonParser();
		JsonElement element  = parser.parse(message.getPayload());
		String type=element.getAsJsonObject().get("type").getAsString();
		if(type.equals("register")) {
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			userSessionMap.put(memberId,session);
		}else if(type.equals("exit")) {
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			userSessionMap.remove(memberId);
			System.out.println(memberId + ": 웹소켓 종료, 세션 제거");			
		}else {
			String target = element.getAsJsonObject().get("target").getAsString();
			String msg = element.getAsJsonObject().get("msg").getAsString();
			WebSocketSession ws = userSessionMap.get(target);
			if(ws != null) {
				ws.sendMessage(new TextMessage(msg));
			}
		}
	}
	
	public WebSocketSession getMemberSession(String memberId) {			
		return userSessionMap.get(memberId);
	}
	
	public void removeMemberSession(String memberId) {
		userSessionMap.remove(memberId);
		System.out.println("웹소켓 세션 제거 : " + memberId);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
//		Set<String> keys = userSessionMap.keySet();
//		
//		for(String memberId : keys) {
//			if(userSessionMap.get(memberId).equals(session)) {
//				System.out.println(memberId+"님의 세션 제거");
//				userSessionMap.remove(memberId);
//			}
//		}
		
		webSessions.remove(session);
	}
}
