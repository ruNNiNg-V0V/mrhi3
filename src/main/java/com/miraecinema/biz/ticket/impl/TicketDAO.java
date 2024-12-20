package com.miraecinema.biz.ticket.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.ticket.TicketVO;
import com.springbook.biz.common.JDBCUtil;

public class TicketDAO {
	// JDBC
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL
	private final String TICKET_MEMBER_GET = "select * from ticket where tid=?";

	// 리뷰 결과 조회
	public List<TicketVO> getTicketsByMember(MemberVO member) {
		// 어느 회원이 작성한 리뷰 결과 모음
		List<TicketVO> ticketList = new ArrayList<TicketVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TICKET_MEMBER_GET);
			stmt.setString(1, member.getId());
			rs = stmt.executeQuery();
			if (rs.next()) {
				TicketVO ticket = new TicketVO();
				ticket.setTcode(rs.getString("TCODE"));
				ticket.setRnum(rs.getString("RNUM"));
				ticket.setMvstart(rs.getString("MVSTART"));
				ticket.setSeet(rs.getString("SEET"));
				ticket.setTmvname(rs.getString("TMVNAME"));
				ticket.setTtime(rs.getString("TTIME"));
				ticket.setTid(rs.getString("TID"));
				ticketList.add(ticket);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return ticketList;
	}
}
