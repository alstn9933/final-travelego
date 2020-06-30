package kr.or.iei.together.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/together")
public class TogetherController {
	
	@RequestMapping("/open.do")
	public String test(HttpServletRequest request) {
		
		return "together/main";
	}
}
