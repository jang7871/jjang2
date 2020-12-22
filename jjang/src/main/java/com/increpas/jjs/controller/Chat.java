package com.increpas.jjs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat")
public class Chat {

	@RequestMapping("/chat.jjs")
	public ModelAndView getChat(ModelAndView mv) {
		System.out.println("### getChat 메서드 호출");
		mv.setViewName("chat");
		return mv;
	}	
}
