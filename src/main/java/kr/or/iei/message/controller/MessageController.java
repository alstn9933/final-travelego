package kr.or.iei.message.controller;

import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.member.model.vo.Member;
import kr.or.iei.message.model.service.MessageService;
import kr.or.iei.message.model.vo.Message;
import kr.or.iei.message.model.vo.MessageViewData;
import kr.or.iei.message.model.vo.InboxPageData;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	@Qualifier("messageService")
	private MessageService service;

	@RequestMapping("/view.do")
	public String messageView(HttpSession session, String messageNo, Model model) {

		Member m = (Member) session.getAttribute("member");

		if (m != null) {
			MessageViewData mvd = service.selectOneMessage(m.getMemberId(), Integer.parseInt(messageNo));
			model.addAttribute("message", mvd.getMessage());
			model.addAttribute("unchkCount", mvd.getUnchkCount());
			model.addAttribute("msgTotalCount", mvd.getMsgTotalCount());
		}

		return "message/messageView";
	}
	
	@RequestMapping("/viewSendMessage.do")
	public String sendMessageView(HttpSession session, String messageNo, Model model) {
		Member m = (Member) session.getAttribute("member");

		if (m != null) {
			MessageViewData mvd = service.selectSendMessage(m.getMemberId(), Integer.parseInt(messageNo));
			model.addAttribute("message", mvd.getMessage());
			model.addAttribute("sendCount", mvd.getSendCount());
		}

		return "message/messageView";
	}
	
	@RequestMapping("/delete.do")
	public String deleteMessage(String messageNo, Model model) {
		
		int result = service.deleteMessage(Integer.parseInt(messageNo));
		
		if(result >0) {
			model.addAttribute("msg","쪽지가 삭제되었습니다.");	
			model.addAttribute("loc","/message/inbox.do");
		} else {
			model.addAttribute("msg","쪽지 삭제에 실패하였습니다.");
			model.addAttribute("loc","message/view.do?messageNo="+messageNo);
		}
		
		return "common/msg";
	}

	@RequestMapping("/write.do")
	public String messageWriteFrm(String receiver, Model model) {
		if(receiver!=null) {
			model.addAttribute("receiver", receiver);
		}
		return "message/write";
	}

	@RequestMapping("/outbox.do")
	public String selectOutboxMessage(HttpSession session, Model m) {
		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			Message msg = new Message();
			msg.setMessageSender(member.getMemberId());
			InboxPageData pd = service.selectMessageList(msg);

			m.addAttribute("msgTotalCount", pd.getMsgTotalCount());
			m.addAttribute("list", pd.getList());
		}

		return "message/outbox";
	}

	@RequestMapping("/inbox.do")
	public String selectMemberMessage(HttpSession session, Model m) {

		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			Message msg = new Message();
			msg.setMessageReceiver(member.getMemberId());
			InboxPageData pd = service.selectMessageList(msg);

			m.addAttribute("unchkCount", pd.getUnchkCount());
			m.addAttribute("msgTotalCount", pd.getMsgTotalCount());
			m.addAttribute("list", pd.getList());
		}

		return "message/inbox";
	}

	@RequestMapping("/send.do")
	public String messageSend(Message m, Model model) {

		int result = service.insertMessage(m);
		if (result > 0) {
			model.addAttribute("msg", "메세지를 전송하였습니다.");
		} else {
			model.addAttribute("msg", "메세지를 전송에 실패하였습니다.");
		}

		model.addAttribute("loc", "/message/inbox.do");
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncDelete.do", produces = "text/html;charset=utf-8")
	public String deleteMessage(String messageNo) {
		int result = service.deleteMessage(Integer.parseInt(messageNo));
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkId.do", produces = "text/html;charset=utf-8")
	public String checkId(String receiver) {
		if (receiver.equals("user01") || receiver.equals("user02")) {
			return "1";
		} else {
			return "0";
		}
	}

}
