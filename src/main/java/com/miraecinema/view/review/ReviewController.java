package com.miraecinema.view.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.member.impl.MemberDAO;
import com.miraecinema.biz.review.ReviewService;
import com.miraecinema.biz.review.ReviewVO;
import com.miraecinema.biz.review.impl.ReviewDAO;

// 메인에서 포스터를 누르면 이동하는 페이지
// 현재 기능 및 파라메터 미리보기 페이지로 사용 중 
@Controller
public class ReviewController {
	
    @Autowired
    private ReviewService reviewService;
	
	//마이페이지 리뷰내역 리스트 o
	@RequestMapping("/review.do")
	public ModelAndView review(MemberVO vo, MemberDAO dao_member, ReviewDAO dao_review, ModelAndView mav, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setId(member.getId());
		mav.addObject("review", reviewService.getReviewsByMember(vo));
		mav.setViewName("review.jsp");
		System.out.println("review.do");
		return mav;
	}
		
	//마이페이지 리뷰내역 상세 o
	@RequestMapping(value="/reviewDetail.do", method=RequestMethod.POST)
	public ModelAndView reviewDetail(ReviewVO vo, ReviewDAO dao_review, ModelAndView mav, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setRid(member.getId());
		mav.addObject("inReview", dao_review.getReview(vo));
		mav.setViewName("reviewDetail.jsp");
		System.out.println("reviewDetail.do");
		return mav;
	}
	
	//마이패이지 리뷰내용 수정 o
	@RequestMapping(value="/reviewUpdate.do", method=RequestMethod.POST)
	public String reviewUpdate(ReviewVO vo, ReviewDAO dao_review, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setRid(member.getId());
		String rmvname = vo.getRmvname();
		String coment =  vo.getComent();
		String rtime = vo.getRtime();
		dao_review.updateReview(vo);
		System.out.println("reviewUpdate.do");
		return "review.do";
	}
	
	//마이페이지 리뷰내용 삭제 o
	@RequestMapping(value="/reviewDelete.do", method=RequestMethod.GET)
	public String reviewDelete(ReviewVO vo, ReviewDAO dao_review, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setRid(member.getId());
		dao_review.deleteReview(vo);
		System.out.println("reviewDelete.do");
		return "review.do";
	}
	
	
}
