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

	public List selectMsgList(Member member) {
		return session.selectList("message.selectMsgList", member);
	}

	public int insertMessage(Message m) {
		return session.insert("message.insertMessage",m);
	}

	public Message selectOneMessage(int messageNo) {
		return session.selectOne("message.selectOneMessage", messageNo);
	}

	public int countUncheckMsg(Member member) {		
		return session.selectOne("message.countUncheckMsg",member);
	}

	public int countAllMsg(Member member) {
		return session.selectOne("message.countAllMsg",member);
	}
	
	
}
