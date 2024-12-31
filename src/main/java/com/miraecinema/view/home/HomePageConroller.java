package com.miraecinema.view.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomePageConroller {
	@RequestMapping(value="/index.do",method=RequestMethod.GET)
	public String homePage() {
			System.out.println("헤더의 홈 버튼 이벤트 : GET 호출");
			return "index.jsp";
	}
	
	@RequestMapping(value="/index.do",method=RequestMethod.POST)
	public String homePage2() {
			System.out.println("헤더의 홈 버튼 이벤트 : POST 호출");
			return "index.jsp";
	}
}
