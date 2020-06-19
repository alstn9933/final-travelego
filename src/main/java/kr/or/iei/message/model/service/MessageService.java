package kr.or.iei.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.message.model.dao.MessageDao;

@Service("messageService")
public class MessageService {
	
	@Autowired
	@Qualifier("messageDao")
	private MessageDao dao;


	public List selectMsgList(Member member) {
		return dao.selectMsgList(member);
	}
}
