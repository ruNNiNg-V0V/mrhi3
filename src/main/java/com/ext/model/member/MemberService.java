package com.ext.model.member;

import java.util.List;
import java.util.Map;

import com.ext.model.reservation.reservationVO;

public interface MemberService {
	
	// ID 중복검사
	int checkID(MemberVO vo);
	
	// 회원가입
	void insertMember(MemberVO vo);
	
	// 로그인시 회원 체크
	int checkMember(MemberVO vo);
	
	// 로그인
	MemberVO login(MemberVO vo);
	
	// 비밀번호 찾기
	int forgotPWChkMember(MemberVO vo);
	
	String forgotPW(Map<String,Object> paramMap);
	
	int getCountOrder(MemberVO vo);
	
	List<reservationVO> getOrderList(MemberVO vo);
	
	int Countbg(MemberVO vo);
	int Countite(MemberVO vo);
	int Countpt(MemberVO vo);
	
	int payCount1(MemberVO vo);
	int payCount2(MemberVO vo);
	int payCount3(MemberVO vo);

	
	int getCountMember(MemberVO vo,String searchOption,String keyword);
	
	List<MemberVO>getMemberList(MemberVO vo,String searchOption,String keyword,int start, int end);
	
	//회원정보 수정
	void updateMember(MemberVO vo);
	
	void deleteMember(MemberVO vo);
	
	void deleteReservation(MemberVO vo);
}
	