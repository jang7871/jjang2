package com.increpas.jjs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.increpas.jjs.dao.*;
import com.increpas.jjs.vo.*;

@Controller
@RequestMapping("/member")
public class Member {

		@Autowired
		MemberDao mDao;
		
		@RequestMapping("/login.jjs")
		public String loginPage() {
			return "member/login";
		}
		
		/*
		 * 
		@RequestMapping(path="/loginProc.jjs", params={"id", "pw"}, method=RequestMethod.POST)
		public ModelAndView loginProc(ModelAndView mv, RedirectView rd, MemberVO mVO,
								HttpSession session) {
			String view = "";
			int cnt = mDao.loginCnt(mVO);
			
			if(cnt == 0) {
				rd.setUrl("/jjs/member/login.jjs");
			} else {
				
			}
			
			mv.setView(rd);
			return mv;
		}
		 */
		
		@RequestMapping("/join.jjs")
		public ModelAndView joinForm(HttpSession session, RedirectView rd,
									ModelAndView mv) {
			String sid = (String) session.getAttribute("SID");
			try {
				if(sid != null || sid.length() != 0) {
					rd.setUrl("/jjs/main.jjs");
					mv.setView(rd);
				} else {
					mv.setViewName("member/join");
				}
				
			} catch(Exception e) {}
			
			return mv;
			
		}
}
