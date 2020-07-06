package kr.or.iei.notification.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.iei.notification.model.service.NotificationService;
import kr.or.iei.notification.model.vo.Notification;

@Controller
public class NotificationController {
	@Autowired
	@Qualifier("notificationService")
	private NotificationService service;
	
	@ResponseBody
	@RequestMapping(value = "/checkNotify.do",produces = "text/html;charset=utf-8")
	public String checkNotify(Notification n) {
		int checkcount = service.checkCount(n);
		return String.valueOf(checkcount);
	}
	
	@ResponseBody
	@RequestMapping(value = "/alramList.do",produces = "application/json;charset=utf-8")
	public String alramList(Notification n) {
		ArrayList<Notification> list = service.checkNotifi(n);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value = "/zeroCount.do",produces = "text/html;charset=utf-8")
	public String zeroCount(Notification n) {
		int result = service.zeroCount(n);
		if(result>0) {
			System.out.println("카운트정리");
		}else {
			System.out.println("카운트정리 실패");
		}
		return String.valueOf(result);
	}
}
