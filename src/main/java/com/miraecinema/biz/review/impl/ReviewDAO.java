package com.miraecinema.biz.review.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.review.ReviewVO;
import com.springbook.biz.common.JDBCUtil;

public class ReviewDAO {
	// JDBC
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL
	private final String REVIEW_MEMBER_GET = "select * from review where rid=?";

	// 리뷰 결과 조회
	public List<ReviewVO> getReviewsByMember(MemberVO member) {
		// 어느 회원이 작성한 리뷰 결과 모음
		List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_MEMBER_GET);
			stmt.setString(1, member.getId());
			rs = stmt.executeQuery();
			if (rs.next()) {
				ReviewVO review = new ReviewVO();
				review.setRmvname(rs.getString("RMVNAME"));
				review.setComent(rs.getString("COMENT"));
				review.setRtime(rs.getString("RTIME"));
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
}
