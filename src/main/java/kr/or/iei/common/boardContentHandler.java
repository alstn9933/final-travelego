package kr.or.iei.common;

import java.util.ArrayList;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import kr.or.iei.message.model.vo.Message;
import kr.or.iei.together.model.vo.TogetherBoardVO;
import kr.or.iei.together.model.vo.TogetherCommentVO;

@Service
@Aspect
public class boardContentHandler {
	
	@Pointcut("execution(java.util.List kr.or.iei.message.model.dao.MessageDao.select*(..)) ")
	public void selectMsgPointcut() {}
	
	@Pointcut("execution(* kr.or.iei.together.model.dao.TogetherDao.insert*(kr.or.iei.together.model.vo.TogetherBoardVO,..))")
	public void insertBoardPointcut() {}
	
	@Pointcut("execution(* kr.or.iei.together.model.dao.TogetherDao.insert*(kr.or.iei.together.model.vo.TogetherCommentVO,..))")
	public void insertCommentPointcut() {}
	
	@Around("selectMsgPointcut()")
	public Object addLineOnMessageContent(ProceedingJoinPoint pjp) throws Throwable{
		Object obj = pjp.proceed();		
		ArrayList<Message> list = (ArrayList<Message>)obj;
		
		for(Message vo : list) {
			vo.setMessageContent(vo.getMessageContent().replaceAll("\r\n", "<br/>"));
		}
		
		return list;
	}
	
	@Before("insertBoardPointcut()")
	public void addLineOnBoardContent(JoinPoint jp) {
		TogetherBoardVO board = (TogetherBoardVO)jp.getArgs()[0];
		board.setTogetherContent(board.getTogetherContent().replaceAll("\r\n", "<br/>"));
		
		return;
	}
	
	@Before("insertCommentPointcut()")
	public void addLineOnCommentContent(JoinPoint jp) {
		TogetherCommentVO comment = (TogetherCommentVO)jp.getArgs()[0];
		comment.setCommentContent(comment.getCommentContent().replaceAll("\n", "<br/>"));
		return;
	}
	
}
