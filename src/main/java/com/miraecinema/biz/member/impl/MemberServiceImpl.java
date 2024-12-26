package com.miraecinema.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miraecinema.biz.member.MemberService;
import com.miraecinema.biz.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDAOMybatis memberDAO;

    @Override
    public MemberVO getMember(MemberVO vo) {
        return memberDAO.getMember(vo);
    }
}
