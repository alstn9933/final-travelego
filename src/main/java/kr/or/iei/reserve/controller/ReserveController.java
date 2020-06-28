package kr.or.iei.reserve.controller;

import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.iei.reserve.model.service.ReserveService;

@Controller
public class ReserveController {
	@Autowired
	@Qualifier("reserveService")
	private ReserveService service;
	
	
}
