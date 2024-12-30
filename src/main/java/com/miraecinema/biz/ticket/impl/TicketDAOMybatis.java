package com.miraecinema.biz.ticket.impl;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.ticket.TicketVO;

@Repository
public class TicketDAOMybatis {
    @Autowired
    private SqlSessionTemplate mybatis;

    public List<TicketVO> getTicketsByMember(MemberVO vo) {
        System.out.println("===> Mybatis로 getTicketsByMember() 기능 처리");
        TicketVO ticket = new TicketVO();
        ticket.setTid(vo.getId());
        return mybatis.selectList("TicketDAO.getTicketsByMember", ticket);
    }
    
    public void ticketCancel(TicketVO ticket) {
        System.out.println("===> Mybatis로 ticketCancel() 기능 처리");
        mybatis.delete("TicketDAO.ticketCancel", ticket);
    }
}