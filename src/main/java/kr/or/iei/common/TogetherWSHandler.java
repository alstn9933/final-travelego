package kr.or.iei.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;


@Component(value = "togetherWSHandler")
public class TogetherWSHandler extends TextWebSocketHandler{

	private ArrayList<WebSocketSession> sessionList;
	
	public TogetherWSHandler() {
		sessionList = new ArrayList<WebSocketSession>();		
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionList.add(session);
		System.out.println("동행게시판 웹 소켓 연결, 전체 : "+sessionList.size());		
	}
	
	
	public void sendInsertAlarm(int boardNum) {
		
		for(WebSocketSession ws : sessionList) {
			try {
				ws.sendMessage(new TextMessage(String.valueOf(boardNum)));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("동행게시판 웹소켓 연결 해제");
		sessionList.remove(session);
	}
	
}
