package kr.or.iei.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Component("alarmHandler")
public class alarmHandler extends TextWebSocketHandler {
	//로그인 한 전체
	ArrayList<WebSocketSession>webSessions = new ArrayList<WebSocketSession>();
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
		//if()
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결 종료!");
		webSessions.remove(session);
	}
}
