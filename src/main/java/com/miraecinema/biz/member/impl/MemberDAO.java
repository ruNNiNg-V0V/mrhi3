package com.miraecinema.biz.member.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.miraecinema.biz.member.MemberVO;
import com.springbook.biz.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("memberDAO")

public class MemberDAO {
	// JDBC
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL
	private final String MEMBER_GET = "select * from member where id=? and pw=?";

	// 회원 정보 조회
	public MemberVO getMember(MemberVO vo) {
		// 회원 정보 조회 결과를 담는 vo
		MemberVO member = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPw());
			rs = stmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("ID"));
				member.setPw(rs.getString("PW"));
				member.setEmail(rs.getString("EMAIL"));
				member.setTel(rs.getString("TEL"));
				member.setName(rs.getString("NAME"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}
	//아이디 중복 확인 메소드
	private final String CHECK_ID = "SELECT COUNT(*) FROM member WHERE id=?";

	public boolean checkIdDuplicate(String id) {
	    try {
	        conn = JDBCUtil.getConnection();
	        stmt = conn.prepareStatement(CHECK_ID);
	        stmt.setString(1, id);
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1) > 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(rs, stmt, conn);
	    }
	    return false;
	}
	//회원가입 메소드
	private final String INSERT_MEMBER = "INSERT INTO member (id, pw, email, tel, name) VALUES (?, ?, ?, ?, ?)";

	public void insertMember(MemberVO vo) {
	    try {
	        conn = JDBCUtil.getConnection();
	        stmt = conn.prepareStatement(INSERT_MEMBER);
	        stmt.setString(1, vo.getId());
	        stmt.setString(2, vo.getPw());
	        stmt.setString(3, vo.getEmail());
	        stmt.setString(4, vo.getTel());
	        stmt.setString(5, vo.getName());
	        stmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(stmt, conn);
	    }
	}


}