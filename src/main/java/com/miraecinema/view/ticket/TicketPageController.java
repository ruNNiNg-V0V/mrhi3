package com.miraecinema.view.ticket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.member.impl.MemberDAO;
import com.miraecinema.biz.ticket.impl.TicketDAO;

@Controller
public class TicketPageController {
	@RequestMapping("/tickets.do")
	public ModelAndView myTicketPage(MemberDAO dao_member, TicketDAO dao_ticket,
			ModelAndView mav) {
		MemberVO member = new MemberVO();
		member.setId("mrhi3");
		member.setPw("1234");
		mav.addObject("tickets", dao_ticket.getTicketsByMember(member));
		mav.setViewName("myTicket.jsp");
		return mav;
	}
}
