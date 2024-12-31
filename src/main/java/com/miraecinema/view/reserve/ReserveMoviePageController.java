
package com.miraecinema.view.reserve;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.movie.MovieInfo;
import com.miraecinema.biz.ticket.TicketService;
import com.miraecinema.biz.ticket.TicketVO;

@Controller
public class ReserveMoviePageController {
    
	@Autowired
    private TicketService ticketService;
	
    @RequestMapping(value="/reserveMovie.do", method = RequestMethod.GET)
    public String reservePage(@ModelAttribute("movie") MovieInfo vo, Model model, HttpSession session) {
    	MemberVO member = (MemberVO) session.getAttribute("member");
    	if(member!=null) {
            System.out.println("영화 예매하기 페이지 파라메터 세팅");
            System.out.println("상영관 : " + vo.getRnum());
            System.out.println("영화 제목 : " + vo.getMovieNm());

            // MovieInfo 객체를 모델에 추가
            model.addAttribute("movie", vo);
            
            // 상영 시간표 설정
            // ReserveTime 객체 생성 및 시간표 설정 부분
    /*        ReserveTime reserveTime = new ReserveTime();
            String[] screenTimes = reserveTime.schedule.get(Integer.parseInt(vo.getRnum()) - 1);
            model.addAttribute("screenTimes", screenTimes);   */   

            return "reserveMovie.jsp";    		
    	}else {
    		return "login.jsp";
    	}
    	
    	

    }
    
    @RequestMapping(value="insertTicket.do",method = RequestMethod.POST)
    public String ticketInsert(TicketVO ticket, HttpSession session) {
    	MemberVO member = (MemberVO) session.getAttribute("member");
    	System.out.println("티켓 코드 : "+ticket.getTcode());
    	System.out.println("티켓 좌석 : "+ticket.getSeet());
    	System.out.println("티켓 영화이름 : "+ticket.getTmvname());
    	System.out.println("티켓 상영시간 : "+ticket.getMvstart());
    	System.out.println("티켓 상영관 : "+ticket.getRnum());
    	ticket.setTname(member.getName());
    	ticket.setTid(member.getId());
    	ticketService.insertTicket(ticket);
    	return "index.do";
    }
    
    
    
}
