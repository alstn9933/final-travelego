package kr.or.iei.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	public List selectUnreadMessage(Member member) {
		return session.selectList("message.selectUnreadMessage",member);
	}

	public int updateMessageDeleteLevel(HashMap<String, String> map) {
		return session.update("message.updateMessageDeleteLevel", map);
	}

	public List listReadMessage(Member member) {
		return session.selectList("message.selectAllReadMessage", member);
	}

	public int updateMessageDeleteLevelTo1(ArrayList<Message> messageList) {
		return session.update("message.updateListDeleteLevelTo1", messageList);
	}

	public int deleteMessage(ArrayList<Message> messageList) {
		return session.delete("message.deleteMessageByList", messageList);
	}

	public List listAllReceivedMessage(Member member) {
		return session.selectList("message.selectAllReceivedMessage", member);
	}

	public int updateMessageDeleteLevelTo2(ArrayList<Message> sendList) {
		return session.update("message.updateListDeleteLevelTo2", sendList);
	}

	public List listCheckMessage(int[] messageNo) {
		return session.selectList("message.selectCheckMessage",messageNo);
	}
	
}
