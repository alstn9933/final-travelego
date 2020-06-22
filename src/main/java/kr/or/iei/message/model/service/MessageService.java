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

	public InboxPageData selectMsgList(Member member) {
		
		member.setMemberLevel(0);
		ArrayList<Message> list = (ArrayList<Message>) dao.selectMsgList(member);

		dao.countUncheckMsg(member);

		InboxPageData pd = new InboxPageData();
		
		pd.setList(list);
//		pd.setUnchkCount(unchkCount);
		pd.setMsgTotalCount(list.size());

		return pd;
	}

	public int insertMessage(Message m) {
		return dao.insertMessage(m);
	}

	public MessageViewData selectOneMessage(String memberId, int messageNo) {
		Member member = new Member();
		member.setMemberId(memberId);
		
		Message m = dao.selectOneMessage(messageNo);
		int unchkCount = dao.countUncheckMsg(member);
		int msgTotalCount = dao.countAllMsg(member);
		
		MessageViewData mvd = new MessageViewData();
		
		mvd.setMessage(m);
		mvd.setMsgTotalCount(msgTotalCount);
		mvd.setUnchkCount(unchkCount);
		
		return mvd;
	}
}
