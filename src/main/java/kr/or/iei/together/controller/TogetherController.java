package kr.or.iei.together.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/together")
public class TogetherController {
	
	@RequestMapping("/open.do")
	public String test() {
		return "together/main";
	}
}
