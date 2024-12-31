package com.miraecinema.biz.inquiry.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.miraecinema.biz.inquiry.InquiryVO;
import com.miraecinema.biz.member.MemberVO;
import com.springbook.biz.common.JDBCUtil;

public class InquiryDAO {
    // JDBC
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    // SQL
    private final String INQUIRY_LIST = "select * from inquiry where qid=? order by createdAt desc";
    private final String INQUIRY_GET = "select * from inquiry where seq=?";
    private final String INQUIRY_INSERT = "insert into inquiry(qid, title, category, content, createdAt, cnt) values(?,?,?,?,SYSDATE,0)";
    private final String INQUIRY_UPDATE = "update inquiry set title=?, category=?, content=? where seq=?";
    private final String INQUIRY_DELETE = "delete from inquiry where seq=?";
    
 // 문의 목록 조회 메소드 수정
    public List<InquiryVO> getInquiryList(MemberVO member) {
        List<InquiryVO> inquiryList = new ArrayList<InquiryVO>();
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(INQUIRY_LIST);
            stmt.setString(1, member.getId());  // qid와 매칭할 회원 ID 설정
            rs = stmt.executeQuery();
            while(rs.next()) {
                InquiryVO inquiry = new InquiryVO();
                inquiry.setSeq(rs.getInt("SEQ"));
                inquiry.setQid(rs.getString("QID"));
                inquiry.setTitle(rs.getString("TITLE"));
                inquiry.setCategory(rs.getString("CATEGORY"));
                inquiry.setContent(rs.getString("CONTENT"));
                inquiry.setCreatedAt(rs.getDate("CREATEDAT"));
                inquiry.setCnt(rs.getInt("CNT"));
                inquiryList.add(inquiry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return inquiryList;
    }
    
    // 문의 상세 조회
    public InquiryVO getInquiry(InquiryVO vo) {
        InquiryVO inquiry = null;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(INQUIRY_GET);
            stmt.setInt(1, vo.getSeq());
            rs = stmt.executeQuery();
            if(rs.next()) {
                inquiry = new InquiryVO();
                inquiry.setSeq(rs.getInt("SEQ"));
                inquiry.setQid(rs.getString("QID"));
                inquiry.setTitle(rs.getString("TITLE"));
                inquiry.setCategory(rs.getString("CATEGORY"));
                inquiry.setContent(rs.getString("CONTENT"));
                inquiry.setCreatedAt(rs.getDate("CREATEDAT"));
                inquiry.setCnt(rs.getInt("CNT"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return inquiry;
    }
    
    // 문의 등록
    public void insertInquiry(InquiryVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(INQUIRY_INSERT);
            stmt.setString(1, vo.getQid());
            stmt.setString(2, vo.getTitle());
            stmt.setString(3, vo.getCategory());
            stmt.setString(4, vo.getContent());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
    
    // 문의 수정
    public void updateInquiry(InquiryVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(INQUIRY_UPDATE);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getCategory());
            stmt.setString(3, vo.getContent());
            stmt.setInt(4, vo.getSeq());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
    
    // 문의 삭제
    public void deleteInquiry(InquiryVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(INQUIRY_DELETE);
            stmt.setInt(1, vo.getSeq());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
}