package kr.or.iei.notification.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

import kr.or.iei.common.alarmHandler;
import kr.or.iei.notification.model.service.NotificationService;
import kr.or.iei.notification.model.vo.Notification;

@Controller
public class NotificationController {
	@Autowired
	@Qualifier("notificationService")
	private NotificationService service;
	
	@Autowired
	@Qualifier("alarmHandler")
	alarmHandler handler;

	@ResponseBody
	@RequestMapping(value = "/checkNotify.do", produces = "text/html;charset=utf-8")
	public String checkNotify(Notification n) {
		int checkcount = service.checkCount(n);
		return String.valueOf(checkcount);
	}

	@ResponseBody
	@RequestMapping(value = "/alramList.do", produces = "application/json;charset=utf-8")
	public String alramList(Notification n) {
		ArrayList<Notification> list = service.checkNotifi(n);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "/zeroCount.do", produces = "text/html;charset=utf-8")
	public String zeroCount(Notification n) {
		int result = service.zeroCount(n);
		if (result > 0) {
			System.out.println("카운트정리");
		} else {
			System.out.println("카운트정리 실패");
		}
		return String.valueOf(result);
	}

	// 쪽지
	public int sendMessge(String sender, String receiver) {
		int count = service.insertsendMessge(sender, receiver);
		if (count > 0) {
			WebSocketSession ws = handler.getMemberSession(receiver);
			try {
				ws.sendMessage(new TextMessage(String.valueOf(count)));
			} catch (IOException e) {
				e.printStackTrace();
			}
			count = 1;
		} else if (count < 0) {
			System.out.println("웹소켓 추가 실패");
			count = -1;
		}
		return count;
	}
	//동행초대
	public int together(String sender, String receiver) {
		int count = service.inserttogether(sender,receiver);
		if(count>0) {
			WebSocketSession ws = handler.getMemberSession(receiver);
			try {
				ws.sendMessage(new TextMessage(String.valueOf(count)));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			count =1;
		}else {
			count = -1;
		}
		return count;
	}
	//예약취소
	public int tourcancel(String receiver) {
		int count = service.inserttourcancel(receiver);
		if(count>0) {
			WebSocketSession ws = handler.getMemberSession(receiver);
			if(ws!=null) {
				try {
					ws.sendMessage(new TextMessage(String.valueOf(count)));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			count =1;
		}else {
			count = -1;
		}
		return count;
		
	}
}
