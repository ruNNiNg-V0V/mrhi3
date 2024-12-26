package com.miraecinema.biz.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miraecinema.biz.member.MemberVO;

@Repository
public class MemberDAOMybatis {
    @Autowired
    private SqlSessionTemplate mybatis;

    public MemberVO getMember(MemberVO vo) {
        System.out.println("===> Mybatis로 getMember() 기능 처리");
        return mybatis.selectOne("MemberDAO.getMember", vo);
    }
}
