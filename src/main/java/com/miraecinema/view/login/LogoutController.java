package com.miraecinema.view.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutController {
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "index.jsp";
	}

}
