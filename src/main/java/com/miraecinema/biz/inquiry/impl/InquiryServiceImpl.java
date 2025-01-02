package com.miraecinema.biz.inquiry.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miraecinema.biz.inquiry.InquiryService;
import com.miraecinema.biz.inquiry.InquiryVO;
import com.miraecinema.biz.member.MemberVO;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService {

@Autowired
private InquiryDAOMybatis inquiryDAO;

@Override
public void insertInquiry(InquiryVO vo, MemberVO member) {
vo.setQid(member.getId());
inquiryDAO.insertInquiry(vo);
}

@Override
public void deleteInquiry(InquiryVO inquiry) {
inquiryDAO.deleteInquiry(inquiry);
}

@Override
public void updateInquiry(InquiryVO inquiry) {
inquiryDAO.updateInquiry(inquiry);
}

@Override
public List getInquiryList(InquiryVO vo) {
return inquiryDAO.getInquiryList(vo);
}

@Override
public InquiryVO getInquiry(InquiryVO inquiry) {
return inquiryDAO.getInquiry(inquiry);
}
}

