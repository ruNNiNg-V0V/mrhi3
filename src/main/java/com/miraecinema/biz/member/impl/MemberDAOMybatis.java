package com.miraecinema.biz.member.impl;

import java.util.HashMap;

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

    public void register(MemberVO member) {
        System.out.println("===> Mybatis로 register() 기능 처리");
        mybatis.insert("MemberDAO.register", member);
    }

    public int checkId(String id) {
        System.out.println("===> Mybatis로 checkId() 기능 처리");
        return mybatis.selectOne("MemberDAO.checkId", id);
    }
    
    public String findIdByNameAndEmail(String name, String email) {
        return mybatis.selectOne("MemberDAO.findIdByNameAndEmail", new HashMap<String, Object>() {{
            put("name", name);
            put("email", email);
        }});
    }
}
