package com.miraecinema.view.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.member.impl.MemberDAO;
import com.miraecinema.biz.review.impl.ReviewDAO;
import com.miraecinema.biz.ticket.impl.TicketDAO;

// 메인에서 포스터를 누르면 이동하는 페이지
// 현재 기능 및 파라메터 미리보기 페이지로 사용 중 
@Controller
public class ReviewPageController {
	@RequestMapping("/reviewPage.do")
	public ModelAndView reviewPage(MemberVO vo, MemberDAO dao_member, ReviewDAO dao_review, TicketDAO dao_ticket,
			ModelAndView mav) {
		vo.setId("mrhi3");
		vo.setPw("1234");
		mav.addObject("member", dao_member.getMemeber(vo));
		mav.addObject("review", dao_review.getReviewsByMember(vo));
		mav.addObject("ticket", dao_ticket.getTicketsByMember(vo));
		mav.setViewName("reviewPage.jsp");
		return mav;
	}
}
