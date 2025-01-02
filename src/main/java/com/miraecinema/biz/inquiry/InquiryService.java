package com.miraecinema.biz.inquiry;

import java.util.List;

import com.miraecinema.biz.member.MemberVO;

public interface InquiryService {
   void insertInquiry(InquiryVO vo, MemberVO member);

   void deleteInquiry(InquiryVO inquiry);

   void updateInquiry(InquiryVO inquiry);

   List<InquiryVO> getInquiryList(InquiryVO inquiry);

   InquiryVO getInquiry(InquiryVO inquiry);
}
