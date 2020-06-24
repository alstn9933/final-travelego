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

	public InboxPageData selectMessageList(Message msg) {

		ArrayList<Message> list = (ArrayList<Message>) dao.selectMsgList(msg);

		InboxPageData pd = new InboxPageData();
		pd.setMsgTotalCount(list.size());
		pd.setList(list);

		if (msg.getMessageReceiver() != null) {
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

		if (result > 0) {

			ArrayList<Message> list = (ArrayList<Message>) dao.selectOneMessage(messageNo);
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

	public MessageViewData selectSendMessage(String memberId, int messageNo) {
		ArrayList<Message> list = (ArrayList<Message>) dao.selectOneMessage(messageNo);
		int sendCount = dao.countSendMsg(memberId);

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
		System.out.println("진행 메세지 수 : " + readMessagelist.size());
		ArrayList<Message> deletedMessageList = new ArrayList<Message>();

		// 삭제 이력있는 메세지 분류
		for (int i = 0; i < readMessagelist.size(); i++) {
			if (readMessagelist.get(i).getDeleteLevel() > 0) {
				deletedMessageList.add(readMessagelist.get(i));
				readMessagelist.remove(i);
				i--;
			}
		}

		result += dao.updateMessageDeleteLevelTo1(readMessagelist);
		System.out.println("삭제 레벨 업데이트 : " + result);
		if (!deletedMessageList.isEmpty()) {
			result += dao.deleteMessage(deletedMessageList);
			System.out.println("메시지 삭제 후: " + result);
		}
		if (result == (readMessagelist.size() + deletedMessageList.size())) {
			return 1;
		} else {
			return 0;
		}
	}
	
	public int deleteAllReceivedMessage(Member member) {
		int result = 0;
		
		ArrayList<Message> list = (ArrayList<Message>) dao.listAllReceivedMessage(member);
		ArrayList<Message> deletedList = new ArrayList<Message>();
		
		System.out.println("진행 메세지 수 : " + list.size());
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getDeleteLevel()>0) {
				deletedList.add(list.get(i));
				list.remove(i);
				i--;
			}
		}
		
		// 이후 삭제 로직 진행 필요
		
		return result;
	}
}
