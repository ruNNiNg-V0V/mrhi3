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
	private final String TICKET_CANCEL ="delete from ticket where tid=? and rnum=? and seet=? and ttime=?";

	// 결과 조회
	public List<TicketVO> getTicketsByMember(MemberVO member) {
		List<TicketVO> ticketList = new ArrayList<TicketVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TICKET_MEMBER_GET);
			stmt.setString(1, member.getId());
			rs = stmt.executeQuery();
			// 리스트를 받아오기 때문에 반복문을 사용해야 함
			while (rs.next()) {
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
		public void ticketCancel(TicketVO ticket) {		
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(TICKET_CANCEL);
				stmt.setString(1, ticket.getTid());
				stmt.setString(2, ticket.getRnum());
				stmt.setString(3, ticket.getSeet());
				stmt.setString(4, ticket.getTtime());
				stmt.executeUpdate();
				System.out.println("DAO "+ticket.getRnum()+" ticketCancel");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(stmt, conn);
			}
		}
}
