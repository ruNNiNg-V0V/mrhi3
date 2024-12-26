package com.miraecinema.biz.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.review.ReviewVO;

@Repository
public class ReviewDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ReviewVO> getReviewsByMember(MemberVO vo) {
		System.out.println("===> Mybatis로 getReviewsByMember() 기능 처리");
		ReviewVO review = new ReviewVO();
		review.setRid(vo.getId());
		return mybatis.selectList("ReviewDAO.getReviewsByMember", review);
	}
}
