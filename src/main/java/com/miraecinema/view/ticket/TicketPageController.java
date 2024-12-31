package com.miraecinema.view.ticket;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.member.impl.MemberDAO;
import com.miraecinema.biz.ticket.TicketVO;
import com.miraecinema.biz.ticket.impl.TicketDAO;

@Controller
public class TicketPageController {
    @RequestMapping("/tickets.do")
    public ModelAndView myTicketPage(MemberDAO dao_member, TicketDAO dao_ticket, ModelAndView mav,
            HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        mav.addObject("tickets", dao_ticket.getTicketsByMember(member));
        mav.setViewName("myTicket.jsp");
        return mav;
    }
    
    @RequestMapping(value="/ticketCancel.do", method=RequestMethod.GET)
    public String ticketCancel(TicketVO vo, TicketDAO dao_ticket, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        vo.setTid(member.getId());
        dao_ticket.ticketCancel(vo);
        System.out.println("ticketCancel.do");
        return "tickets.do";
    }
}
