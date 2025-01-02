package com.miraecinema.view.inquiry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;
import com.miraecinema.biz.member.MemberVO;
import com.miraecinema.biz.inquiry.InquiryService;
import com.miraecinema.biz.inquiry.InquiryVO;
import com.miraecinema.biz.inquiry.impl.InquiryDAO;

@Controller
public class InquiryController {
    
    @Autowired
    private InquiryService inquiryService;

    // 마이페이지 문의 내역 리스트
    @RequestMapping(value ="/getInquiryList.do", method = RequestMethod.GET)
    public ModelAndView getInquiryList(MemberVO vo, ModelAndView mav, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        vo.setId(member.getId());
        mav.addObject("inquiries", inquiryService.getInquiryList(vo));
        mav.setViewName("getInquiryList.jsp");
        System.out.println("getInquiryList.do");
        return mav;
    }

    // 문의 상세 조회
    @RequestMapping(value = "/getInquiry.do", method = RequestMethod.GET)
    public ModelAndView getInquiry(InquiryVO vo, ModelAndView mav, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        vo.setQid(member.getId());
        mav.addObject("inquiry", inquiryService.getInquiry(vo));
        mav.setViewName("getInquiry.jsp");
        System.out.println("getInquiry.do");
        return mav;
    }

    // 문의 등록
    @RequestMapping(value = "/insertInquiry.do", method = RequestMethod.GET)
    public String insertInquiry() {
    	return "InsertInquiry.jsp";
    }
    
    // 문의 등록
    @RequestMapping(value = "/insertInquiry.do", method = RequestMethod.POST)
    public String insertInquiry(InquiryVO vo, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        
        vo.setQid(member.getId());
        inquiryService.insertInquiry(vo, member);
        System.out.println("insertInquiry.do");
        return "redirect:/getInquiryList.do";
    }


    // 문의 수정
    @RequestMapping(value = "/updateInquiry.do", method = RequestMethod.GET)
    public String updateInquiry(InquiryVO vo, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        vo.setQid(member.getId());

        // 디버깅 코드 추가
        System.out.println("QID: " + vo.getQid());
        System.out.println("Title: " + vo.getTitle());
        System.out.println("Category: " + vo.getCategory());
        System.out.println("Content: " + vo.getContent());
        System.out.println("Seq: " + vo.getSeq());
        inquiryService.updateInquiry(vo);
        System.out.println("updateInquiry.do");
        return "redirect:/getInquiryList.do";
    }

    // 문의 삭제
    @RequestMapping(value = "/deleteInquiry.do", method = RequestMethod.GET)
    public String deleteInquiry(InquiryVO vo, HttpSession session) {
        MemberVO member = (MemberVO) session.getAttribute("member");
        vo.setQid(member.getId());
        inquiryService.deleteInquiry(vo);
        System.out.println("deleteInquiry.do");
        return "redirect:/getInquiryList.do";
    }
}
