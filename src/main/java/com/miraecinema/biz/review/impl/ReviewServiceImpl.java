package com.miraecinema.biz.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.review.ReviewService;
import com.miraecinema.biz.review.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAOMybatis reviewDAO;

	@Override
	public List<ReviewVO> getReviewsByMember(MemberVO vo) {
		return reviewDAO.getReviewsByMember(vo);
	}

	@Override
	public void insertReivew(ReviewVO review, MemberVO member) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ReviewVO> getReviewsByMovie(ReviewVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReview(ReviewVO review) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReview(ReviewVO review) {
		// TODO Auto-generated method stub

	}

	@Override
	public ReviewVO getReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return null;
	}
}
