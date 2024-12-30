package com.miraecinema.biz.member;

public interface MemberService {
    // 회원 정보 조회
    MemberVO getMember(MemberVO vo);
    
    // 회원가입
    void register(MemberVO member) throws Exception;
    
    // 아이디 중복 확인
    int checkId(String id) throws Exception;
    
    //아이디 찾기(이름과 이메일)
    String findIdByNameAndEmail(String name, String email) throws Exception;
}

