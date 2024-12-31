package com.miraecinema.biz.review.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.review.ReviewVO;
import com.springbook.biz.common.JDBCUtil;

public class ReviewDAO {
	// JDBC
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL
	/*="insert into review(rmvname, coment, rtiem, ,rname, rid) value(?,?,?,?,?)";*/
	
	// 업데이트 레코드를 조회하는 서브쿼리
	private final String REVIEW_MEMBER_GET = "select * from review where rid=?";
	private final String SUB_UPDATE = "select coment from review where rid=? and rmvname=? and rtime=?";
	private final String REVIEW_GET ="select * from review where coment =("+SUB_UPDATE+")";
	private final String REVIEW_UPDATE = "update review set coment=?, rtime=? where coment = (" + SUB_UPDATE + ")";
	private final String REVIEW_DELETE ="delete from review where rid=? and rmvname=? and rtime=?";

	private final String REVIEW_INSERT = "insert into review values(?,?,?,?,?)";
	
	private final String REVIEW_RMVNAME ="select * from review where rmvname=?";
	private final String REVIEW_MOVIE_GET = "select * from review where rmvname=?";

	// 리뷰
	@Autowired	
		
	// 리뷰 작성 x
	public void insertReivew(ReviewVO review) {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_INSERT);
			stmt.setString(1, review.getRmvname());
			stmt.setString(2, review.getComent());
			stmt.setString(3, now.format(dateTimeFormat));
			stmt.setString(4, review.getRname());
			stmt.setString(5, review.getRid());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	
	// 영화 리뷰 결과 조회 x
	public List<ReviewVO> getReviewsByMovie(String movieNm) {
		// 영화에 작성한 리뷰 결과 모음
		List<ReviewVO> MvReviewList = new ArrayList<ReviewVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_MOVIE_GET);
			stmt.setString(1, movieNm);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ReviewVO review = new ReviewVO();
				review.setRmvname(rs.getString("RMVNAME"));
				review.setComent(rs.getString("COMENT"));
				review.setRtime(rs.getString("RTIME"));
				review.setRname(rs.getString("RNAME"));
				review.setRid(rs.getString("RID"));
				MvReviewList.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return MvReviewList;	
	}

	// 리뷰 삭제 o
	public void deleteReview(ReviewVO review) {		
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_DELETE);
			stmt.setString(1, review.getRid());
			stmt.setString(2, review.getRmvname());
			stmt.setString(3, review.getRtime());
			stmt.executeUpdate();
			System.out.println("DAO "+review.getRmvname()+" deleteReview");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 리뷰 수정 o
	public void updateReview(ReviewVO review) {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_UPDATE);
			stmt.setString(1, review.getComent());
			stmt.setString(2, now.format(dateTimeFormat));
			
			stmt.setString(3, review.getRid());
			stmt.setString(4, review.getRmvname());
			stmt.setString(5, review.getRtime());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 회원 리뷰 결과 조회 o
	public List<ReviewVO> getReviewsByMember(MemberVO member) {
		// 어느 회원이 작성한 리뷰 결과 모음
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_MEMBER_GET);
			stmt.setString(1, member.getId());
			rs = stmt.executeQuery();
			while (rs.next()) {
				ReviewVO review = new ReviewVO();
				review.setRmvname(rs.getString("RMVNAME"));
				review.setComent(rs.getString("COMENT"));
				review.setRtime(rs.getString("RTIME"));
				review.setRname(rs.getString("RNAME"));
				review.setRid(rs.getString("RID"));
				reviewList.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return reviewList;
	}
	
	// 리뷰 상세 조회 o
	public ReviewVO getReview(ReviewVO review) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_GET);
			stmt.setString(1, review.getRid());
			stmt.setString(2, review.getRmvname());
			stmt.setString(3, review.getRtime());
			rs = stmt.executeQuery();
			if (rs.next()) {
				review.setRmvname(rs.getString("RMVNAME"));
				review.setComent(rs.getString("COMENT"));
				review.setRtime(rs.getString("RTIME"));
				review.setRname(rs.getString("RNAME"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return review;
	}

}

