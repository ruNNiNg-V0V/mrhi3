package com.miraecinema.biz.review;

import java.util.List;

import com.miraecinema.biz.member.MemberVO;

/**
 * Mybatis 진행 작업 절차
 * 1. src/main/resources/mappings -> (테이블)-mapping.xml (테이블이 없다면 추가할 것)
 * 2. src/main/resources -> sql-map-config.xml에 추가한  (테이블)-mapping.xml 매핑 설정
 * 3. ../biz/(테이블) -> 인터페이스(추상 메서드 작성), MemberService 참고 
 * 4. ../biz/(테이블)/impl -> 서비스임플(작성한 인터페이스 임플), MemberServiceImpl 참고
 * 5. ../biz/(테이블)/impl -> (테이블)DAOMybatis 작성, MemberDAOMybatis 참고
 * 6. ../view/(테이블) -> 기존에 접근하던 컨트롤러에서 Mybatis로 수정, LoginController 참고
 * */
public interface ReviewService {
	void insertReivew(ReviewVO review, MemberVO member);

	List<ReviewVO> getReviewsByMovie(ReviewVO vo);

	void deleteReview(ReviewVO review);

	void updateReview(ReviewVO review);

	List<ReviewVO> getReviewsByMember(MemberVO member);

	ReviewVO getReview(ReviewVO review);
}
