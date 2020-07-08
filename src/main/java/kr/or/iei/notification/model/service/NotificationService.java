package kr.or.iei.notification.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.notification.model.dao.NotificationDao;
import kr.or.iei.notification.model.vo.Notification;

@Service("notificationService")
public class NotificationService {
	private static final int ArrayList = 0;
	@Autowired
	@Qualifier("notificationDao")
	private NotificationDao dao;

	public ArrayList<Notification> checkNotifi(Notification n) {
		return (ArrayList<Notification>)dao.checkNotifi(n);
	}

	public int checkCount(Notification n) {
		return dao.checkCount(n);
	}

	public int zeroCount(Notification n) {
		return dao.zeroCount(n);
	}

	public int insertsendMessge(String sender, String receiver) {
		return dao.insertsendMessge(sender,receiver);
	}

	public int inserttogether(String sender, String receiver) {
		return dao.inserttogether(sender, receiver);
	}

	public int inserttourcancel(String receiver) {
		return dao.inserttourcancel(receiver);
	}
}
