package com.miraecinema.view.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	@RequestMapping(value="/review.do", method=RequestMethod.GET)
	public String review() {
		System.out.println("헤더의 마이페이지 버튼 이벤트");
		return "review.jsp";
	}
}
