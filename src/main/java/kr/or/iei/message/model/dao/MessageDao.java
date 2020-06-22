package kr.or.iei.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.message.model.vo.Message;

@Repository("messageDao")
public class MessageDao {

	@Autowired
	private SqlSessionTemplate session;

	public List selectMsgList(Message msg) {
		return session.selectList("message.selectMsgList", msg);
	}

	public int insertMessage(Message m) {
		return session.insert("message.insertMessage",m);
	}

	public List selectOneMessage(int messageNo) {		
		return session.selectList("message.selectOneMessage", messageNo);
	}

	public int countUncheckMsg(String memberId) {		
		return session.selectOne("message.countUncheckMsg",memberId);
	}

	public int countAllMsg(String memberId) {
		return session.selectOne("message.countAllMsg",memberId);
	}

	public int updateCheckMsg(int messageNo) {
		return session.update("message.updateCheckMsg", messageNo);
	}

	public int deleteMessage(int messageNo) {
		return session.delete("message.deleteMessage", messageNo);
	}

	public int countSendMsg(String memberId) {
		return session.selectOne("message.selectSendMessageCount",memberId);
	}
	
	
}
