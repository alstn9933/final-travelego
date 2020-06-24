package kr.or.iei.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	public InboxPageData selectSendMessageList(Member member) {

		Message msg = new Message();
		msg.setMessageSender(member.getMemberId());

		ArrayList<Message> list = (ArrayList<Message>) dao.selectMsgList(msg);

		InboxPageData pd = new InboxPageData();
		pd.setMsgTotalCount(list.size());
		pd.setList(list);

		return pd;
	}

	public InboxPageData selectReceiveMessageList(Member member) {

		Message msg = new Message();
		msg.setMessageReceiver(member.getMemberId());

		ArrayList<Message> list = (ArrayList<Message>) dao.selectMsgList(msg);
		int unchkCount = dao.countUncheckMsg(msg.getMessageReceiver());

		InboxPageData pd = new InboxPageData();
		pd.setMsgTotalCount(list.size());
		pd.setList(list);
		pd.setUnchkCount(unchkCount);

		return pd;
	}

	public int insertMessage(Message m) {
		return dao.insertMessage(m);
	}

	public MessageViewData selectOneMessage(Member member, int messageNo) {

		int result = dao.updateCheckMsg(messageNo);

		if (result > 0) {

			ArrayList<Message> list = (ArrayList<Message>) dao.selectOneMessage(messageNo);
			int unchkCount = dao.countUncheckMsg(member.getMemberId());
			int msgTotalCount = dao.countAllMsg(member.getMemberId());

			MessageViewData mvd = new MessageViewData();

			mvd.setMessage(list.get(0));
			mvd.setMsgTotalCount(msgTotalCount);
			mvd.setUnchkCount(unchkCount);

			return mvd;

		} else {

			return null;
		}
	}

	public int deleteMessage(Member member, int messageNo) {

		Message message = (Message) dao.selectOneMessage(messageNo).get(0);

		int result = 0;

		// 메시지 삭제 이력이 있을 경우 (보낸사람 or 받는사람 둘 중 한사람이 이미 삭제를 했던경우 == 테이블에서 삭제)
		if (message.getDeleteLevel() > 0) {
			result = dao.deleteMessage(messageNo);
		} else { // 메시지 삭제 이력이 없을 경우 -> delete_level update
			HashMap<String, String> map = new HashMap<String, String>();

			map.put("messageNo", String.valueOf(messageNo));
			map.put("memberId", member.getMemberId());
			map.put("messageSender", message.getMessageSender());
			map.put("messageReceiver", message.getMessageReceiver());

			result = dao.updateMessageDeleteLevel(map);
		}

		return result;
	}

	public MessageViewData selectSendMessage(Member member, int messageNo) {
		ArrayList<Message> list = (ArrayList<Message>) dao.selectOneMessage(messageNo);
		int sendCount = dao.countSendMsg(member.getMemberId());

		MessageViewData mvd = new MessageViewData();

		mvd.setMessage(list.get(0));
		mvd.setSendCount(sendCount);
		return mvd;
	}

	public InboxPageData selectUnreadMessage(Member member) {

		ArrayList<Message> list = (ArrayList<Message>) dao.selectUnreadMessage(member);
		int unchkCount = dao.countUncheckMsg(member.getMemberId());
		InboxPageData pd = new InboxPageData();
		pd.setMsgTotalCount(list.size());
		pd.setList(list);
		pd.setUnchkCount(unchkCount);

		return pd;
	}

	@Transactional
	public int deleteAllReadMessage(Member member) {

		int result = 0;
		ArrayList<Message> readMessagelist = (ArrayList<Message>) dao.listReadMessage(member);
		ArrayList<Message> deletedMessageList = new ArrayList<Message>();

		if (readMessagelist.isEmpty()) {
			return -1;
		}

		// 삭제 이력있는 메세지 분류
		for (int i = 0; i < readMessagelist.size(); i++) {
			if (readMessagelist.get(i).getDeleteLevel() > 0) {
				deletedMessageList.add(readMessagelist.get(i));
				readMessagelist.remove(i);
				i--;
			}
		}

		if (!readMessagelist.isEmpty()) {
			result += dao.updateMessageDeleteLevelTo1(readMessagelist);
		}
		if (!deletedMessageList.isEmpty()) {
			result += dao.deleteMessage(deletedMessageList);
		}
		if (result == (readMessagelist.size() + deletedMessageList.size())) {
			return 1;
		} else {
			return 0;
		}
	}

	@Transactional
	public int deleteAllReceivedMessage(Member member) {
		int result = 0;

		ArrayList<Message> list = (ArrayList<Message>) dao.listAllReceivedMessage(member);
		ArrayList<Message> deletedList = new ArrayList<Message>();

		if (list.isEmpty()) {
			return -1;
		}

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getDeleteLevel() > 0) {
				deletedList.add(list.get(i));
				list.remove(i);
				i--;
			}
		}

		if (!list.isEmpty()) {
			result += dao.updateMessageDeleteLevelTo1(list);
		}

		if (!deletedList.isEmpty()) {
			result += dao.deleteMessage(deletedList);
		}

		if (result == (list.size() + deletedList.size())) {
			return 1;
		} else {
			return 0;
		}
	}

	@Transactional
	public int deleteAllSendMessage(Member member) {
		int result = 0;
		
		Message msg = new Message();
		
		msg.setMessageSender(member.getMemberId());
		
		ArrayList<Message> sendList = (ArrayList<Message>) dao.selectMsgList(msg);
		ArrayList<Message> deletedList = new ArrayList<Message>();
		
		if(sendList.isEmpty()) {
			return -1;
			
		} else {
			for(int i=0; i<sendList.size(); i++) {
				if(sendList.get(i).getDeleteLevel()>0) {
					deletedList.add(sendList.get(i));
					sendList.remove(i);
					i--;
				}
			}
			
			if(!sendList.isEmpty()) {
				result += dao.updateMessageDeleteLevelTo2(sendList);
			}
			if(!deletedList.isEmpty()) {
				result += dao.deleteMessage(deletedList);
			}
			
			if(result == (sendList.size()+deletedList.size())) {
				return 1;
			} else {
				return 0;
			}
		}		
	}
	
	@Transactional
	public int deleteAllSendRead(Member member) {
		int result = 0;
		
		Message msg = new Message();
		
		msg.setMessageSender(member.getMemberId());
		msg.setMessageCheck(1);
		
		ArrayList<Message> sendList = (ArrayList<Message>) dao.selectMsgList(msg);
		ArrayList<Message> deletedList = new ArrayList<Message>();
		
		if(sendList.isEmpty()) {
			return -1;
			
		} else {
			for(int i=0; i<sendList.size(); i++) {
				if(sendList.get(i).getDeleteLevel()>0) {
					deletedList.add(sendList.get(i));
					sendList.remove(i);
					i--;
				}
			}
			
			if(!sendList.isEmpty()) {
				result += dao.updateMessageDeleteLevelTo2(sendList);
			}
			if(!deletedList.isEmpty()) {
				result += dao.deleteMessage(deletedList);
			}
			
			if(result == (sendList.size()+deletedList.size())) {
				return 1;
			} else {
				return 0;
			}
		}		
	}
	
	@Transactional
	public int deleteCheckMessage(Member member, int[] messageNo) {
		
		int result = 0;
		
		ArrayList<Message> list = (ArrayList<Message>) dao.listCheckMessage(messageNo);
		ArrayList<Message> deletedList = new ArrayList<Message>();
		if(!list.isEmpty()) {
			
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getDeleteLevel()>0) {
					deletedList.add(list.get(i));
					list.remove(i);
					i--;
				}
			}
			
			if(!deletedList.isEmpty()) {
				result += dao.deleteMessage(deletedList);
			}
			
			if(!list.isEmpty()) {
				if(list.get(0).getMessageReceiver().equals(member.getMemberId())) { // inbox 삭제
					result += dao.updateMessageDeleteLevelTo1(list);
				} else { //outbox 삭제
					result += dao.updateMessageDeleteLevelTo2(list);
				}
				
			}
			
			if(result == (list.size()+deletedList.size())){
				if(list.get(0).getMessageReceiver().equals(member.getMemberId())) { // inbox 삭제
					return 1;
				} else { //outbox 삭제
					return -1;
				}
			} else {
				return 0;
			}
		} else { // 체크한 메시지가 없을 때
			return result;
		}
		
	}
}
