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

	}

	@Override
	public List<ReviewVO> getReviewsByMovie(ReviewVO vo) {
		return null;
	}

	@Override
	public void deleteReview(ReviewVO review) {
		reviewDAO.deleteReview(review);
	}

	@Override
	public void updateReview(ReviewVO review) {
		reviewDAO.updateReview(review);

	}

	@Override
	public ReviewVO getReview(ReviewVO review) {
		return reviewDAO.getReview(review);
	}
}
