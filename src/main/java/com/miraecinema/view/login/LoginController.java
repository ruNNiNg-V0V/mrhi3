package com.miraecinema.view.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.member.impl.MemberDAO;

@Controller
public class LoginController {
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "login.jsp";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, MemberDAO dao_member, HttpSession session) {
		MemberVO user = dao_member.getMember(vo);
		
		if (user != null) {
			session.setAttribute("userName", user.getId());
			return "index.do";
		} else
			return "login.jsp";
	}
}
