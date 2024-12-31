package com.miraecinema.biz.ticket.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.ticket.TicketService;
import com.miraecinema.biz.ticket.TicketVO;

@Service("ticketService")
public class TicketServiceImpl implements TicketService {
    
    @Autowired
    private TicketDAOMybatis ticketDAO;
    
    @Override
    public List<TicketVO> getTicketsByMember(MemberVO vo) {
        return ticketDAO.getTicketsByMember(vo);
    }
    
    @Override
    public void ticketCancel(TicketVO ticket) {
        ticketDAO.ticketCancel(ticket);
    }

	@Override
	public void insertTicket(TicketVO ticket) {
		// TODO Auto-generated method stub
		ticketDAO.ticketInsert(ticket);
	}
}