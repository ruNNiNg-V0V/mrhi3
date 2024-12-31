package com.miraecinema.biz.ticket;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.miraecinema.biz.member.MemberVO;

public interface TicketService {
//    티켓 예매
    void insertTicket(TicketVO ticket);
//    
//    // 상영별 티켓 조회
//    List<TicketVO> getTicketsByMovie(TicketVO vo);
    
    // 티켓 취소
    void ticketCancel(TicketVO ticket);
    
    // 회원별 티켓 조회
    List<TicketVO> getTicketsByMember(MemberVO member);
    
//    // 특정 티켓 조회
//    TicketVO getTicket(TicketVO ticket);
}