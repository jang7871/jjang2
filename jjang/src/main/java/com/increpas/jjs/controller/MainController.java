package com.increpas.jjs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main.jjs")
	public String getMain() {
		return "main";
	}
	

}
