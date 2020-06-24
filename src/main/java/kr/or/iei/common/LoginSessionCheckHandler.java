package kr.or.iei.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.or.iei.member.controller.MemberController;
import kr.or.iei.member.model.vo.Member;

@ControllerAdvice
@Aspect
public class LoginSessionCheckHandler {
	@Autowired
	MemberController memberController;
		
	// Member 객체를 첫번째 매개변수로 참조하는 모든 Service의 모든 메소드
	@Pointcut("execution(* kr.or.iei..*Service.*(kr.or.iei.member.model.vo.Member,..))")
	public void loginSessionPointcut() {}
	
	@ExceptionHandler(NullPointerException.class)
	public String errorHandler(Model model) {
		
		model.addAttribute("msg","먼저 로그인 해주세요.");
		model.addAttribute("loc","/loginFrm.do");
		
		return "common/msg";
	}
	
	
	// 메소드 실행 전처리
	@Before("loginSessionPointcut()")
	public void memberHandler(JoinPoint jp) {
		
		// 메소드의 매개변수들을 args[] 배열로 저장
		Object[] args = jp.getArgs();		
		
		Member member = (Member)args[0];
		
		// 메소드에서 참조된 매개변수 member가 null일때
		if(member == null) {
			// 고의적 NullPointerException 발생
			member.getMemberId();			
		}		
	}	
}
