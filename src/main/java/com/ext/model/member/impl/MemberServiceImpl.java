package com.ext.model.member.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ext.model.member.MemberService;
import com.ext.model.member.MemberVO;
import com.ext.model.reservation.reservationVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	

	// ID 중복검사
	public int checkID(MemberVO vo) {
		return memberDAO.checkID(vo);
	}
	
	// 회원가입
		public void insertMember(MemberVO vo) {
			memberDAO.insertMember(vo);
		}
	// 회원 유무 검사
		public int checkMember(MemberVO vo) {
			return memberDAO.checkMember(vo);
		}
		// 로그인
		public MemberVO login(MemberVO vo) {
			return memberDAO.login(vo);
		}
		// 임시비밀번호
		public int forgotPWChkMember(MemberVO vo) {
			return memberDAO.forgotPWChkMember(vo);
		}
		public String forgotPW(Map<String,Object> paramMap) {
			return memberDAO.forgotPW(paramMap);
		}
		// 회원 예약내역
		public List<reservationVO> getOrderList(MemberVO vo) {
			return memberDAO.getOrderList(vo);
		}		
		// 회원 예약내역 갯수
		public int getCountOrder(MemberVO vo) {
			return memberDAO.getCountOrder(vo);
		}
		// 회원현황
		public List<MemberVO> getMemberList(MemberVO vo,String searchOption, String keyword, int start, int end) {
			return memberDAO.getMemberList(vo,searchOption, keyword, start, end);
		}		
		// 회원 수
		public int getCountMember(MemberVO vo,String searchOption, String keyword) {
			return memberDAO.getCountMember(vo,searchOption, keyword);
		}
		//초급강습 수
		public int Countbg(MemberVO vo){
			return memberDAO.Countbg(vo);
		}
		//중급강습 수
		public int Countite(MemberVO vo){
			return memberDAO.Countite(vo);
		}
		//포인트강습 수
		public int Countpt(MemberVO vo){
			return memberDAO.Countpt(vo);
		}
		public int payCount1(MemberVO vo){
			return memberDAO.payCount1(vo);
		}
		public int payCount2(MemberVO vo){
			return memberDAO.payCount2(vo);
		}
		public int payCount3(MemberVO vo){
			return memberDAO.payCount3(vo);
		}
		// 회원정보 수정
		public void updateMember(MemberVO vo) {
			memberDAO.updateMember(vo);
		}
		//회원정보 탈퇴
		public void deleteMember(MemberVO vo){
			memberDAO.deleteMember(vo);
		}
		//예약취소
		public void deleteReservation(MemberVO vo){
			memberDAO.deleteReservation(vo);
		}
	
}