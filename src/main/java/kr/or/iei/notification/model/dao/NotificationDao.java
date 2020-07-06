package kr.or.iei.notification.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.notification.model.vo.Notification;

@Repository("notificationDao")
public class NotificationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Notification> checkNotifi(Notification n) {
		return sqlSession.selectList("notification.ckecknotifi",n);
	}

	public int checkCount(Notification n) {
		return sqlSession.selectOne("notification.checkCount",n);
	}

	public int zeroCount(Notification n) {
		return sqlSession.update("notification.zeroCount",n);
	}

	public int insertsendMessge(String sender, String receiver) {
		Notification n = new Notification();
		n.setMemberId(receiver);
		n.setNotifyContent("<a href=\"javascript:void(0)\" class=\"openInbox\">"+sender+"님께서 쪽지를 보냈습니다.</a>");
		return sqlSession.insert("notification.insertsendMessge",n);
	}

	public int inserttogether(String sender, String receiver) {
		Notification n = new Notification();
		n.setMemberId(receiver);
		n.setNotifyContent(sender+"님께서 동행에 초대하셨습니다.");
		return sqlSession.insert("notification.insertsendMessge",n);
	}

}
