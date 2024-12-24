/*package com.miraecinema.view.reviewimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.miraecinema.view.review.ReviewVO;
import com.springbook.biz.common.JDBCUtil;

@Repository
public class ReviewDAO {
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String REVIEW_INSERT
	="insert into review(rmvname, coment, rtiem, rid) value(?,?,?,?)";
	private final String REVIEW_UPDATE
	="update review set coment=?, rtime=? where rid=? and rmvname=?";
	private final String REVIEW_DELETE
	="delete review where rid=? and rmvname=?";
	private final String REVIEW_GET
	="select * from review where rid=? and rmvname=?";
	private final String REVIEW_MVLIST
	="select * from review where rmvname=?";
	private final String REVIEW_MYLIST
	="select * from review where rid=?";
	
	public void insertReview(ReviewVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_INSERT);
			stmt.setString(1, vo.getRmvname());
			stmt.setString(2, vo.getComent());
			stmt.setString(3, vo.getRtime());
			stmt.setString(4, vo.getRid());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void updateReview(ReviewVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_UPDATE);
			stmt.setString(1, vo.getComent());
			stmt.setString(2, vo.getRtime());
			stmt.setString(3, vo.getRid());
			stmt.setString(4, vo.getRmvname());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public void deleteReview(ReviewVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_DELETE);
			stmt.setString(1, vo.getRid());
			stmt.setString(2, vo.getRmvname());
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public ReviewVO getReview(ReviewVO vo) {
		ReviewVO review = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_GET);
			stmt.setString(1, vo.getRid());
			stmt.setString(2, vo.getRmvname());
			rs = stmt.executeQuery();
			if(rs.next()) {
				review = new ReviewVO();
				review.setRmvname(rs.getString("rmvname"));
				review.setComent(rs.getString("coment"));
				review.setRtime(rs.getString("rtime"));
				review.setRid(rs.getString("rid"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return review;
	}
	
	public List<ReviewVO> getReviewMvList(ReviewVO vo) {
		List<ReviewVO> reviewMvList = new ArrayList<ReviewVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_MVLIST);
			stmt.setString(1, vo.getRmvname());
			rs = stmt.executeQuery();
			if(rs.next()) {
				ReviewVO review = new ReviewVO();
				review.setRmvname(rs.getString("rmvname"));
				review.setComent(rs.getString("coment"));
				review.setRtime(rs.getString("rtime"));
				review.setRid(rs.getString("rid"));
				reviewMvList.add(review);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return reviewMvList;
	}
	
	public List<ReviewVO> getReviewMyList(ReviewVO vo) {
		List<ReviewVO> reviewMyList = new ArrayList<ReviewVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(REVIEW_MYLIST);
			stmt.setString(1, vo.getRmvname());
			rs = stmt.executeQuery();
			if(rs.next()) {
				ReviewVO review = new ReviewVO();
				review.setRmvname(rs.getString("rmvname"));
				review.setComent(rs.getString("coment"));
				review.setRtime(rs.getString("rtime"));
				review.setRid(rs.getString("rid"));
				reviewMyList.add(review);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return reviewMyList;
	}
}
*/