package kr.or.iei.message.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.message.model.dao.MessageDao;
import kr.or.iei.message.model.vo.Message;
import kr.or.iei.message.model.vo.MessageViewData;
import kr.or.iei.message.model.vo.InboxPageData;

@Service("messageService")
public class MessageService {

	@Autowired
	@Qualifier("messageDao")
	private MessageDao dao;

	public InboxPageData selectMessageList(Message msg) {
		
		ArrayList<Message> list = (ArrayList<Message>) dao.selectMsgList(msg);
		
		InboxPageData pd = new InboxPageData();
		pd.setMsgTotalCount(list.size());		
		pd.setList(list);
		
		if(msg.getMessageReceiver()!=null) {
			int unchkCount = dao.countUncheckMsg(msg.getMessageReceiver());
			pd.setUnchkCount(unchkCount);			
		}


		return pd;
	}

	public int insertMessage(Message m) {
		return dao.insertMessage(m);
	}

	public MessageViewData selectOneMessage(String memberId, int messageNo) {
		
		int result = dao.updateCheckMsg(messageNo);
		
		if(result >0) {
			
			ArrayList<Message> list = (ArrayList<Message>)dao.selectOneMessage(messageNo);
			int unchkCount = dao.countUncheckMsg(memberId);
			int msgTotalCount = dao.countAllMsg(memberId);
			
			MessageViewData mvd = new MessageViewData();
			
			mvd.setMessage(list.get(0));
			mvd.setMsgTotalCount(msgTotalCount);
			mvd.setUnchkCount(unchkCount);
			
			return mvd;
			
		} else {
			
			return null;
		}		
	}

	public int deleteMessage(int messageNo) {
		return dao.deleteMessage(messageNo);
	}

	public MessageViewData selectSendMessage(String memberId, int messageNo) {
		ArrayList<Message> list = (ArrayList<Message>)dao.selectOneMessage(messageNo);
		int sendCount = dao.countSendMsg(memberId);
		
		MessageViewData mvd = new MessageViewData();
		
		mvd.setMessage(list.get(0));
		mvd.setSendCount(sendCount);
		return mvd;
	}
}
