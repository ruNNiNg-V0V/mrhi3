package com.ext.model.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ext.model.member.MemberVO;
import com.ext.model.reservation.reservationVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 아이디 중복검사
	public int checkID(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkID", vo);
	}
	// 회원가입
		public void insertMember(MemberVO vo) {
			mybatis.insert("MemberDAO.insertMember", vo);
		}
		// 회원 존재 유무 검사
		public int checkMember(MemberVO vo) {
			return mybatis.selectOne("MemberDAO.checkMember", vo);
		}
		// 로그인
		public MemberVO login(MemberVO vo) {
			return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
		}
		//임시비밀번호
		public int forgotPWChkMember(MemberVO vo) {
			return mybatis.selectOne("MemberDAO.forgotPWChkMember", vo);
		}
		public String forgotPW(Map<String,Object>paramMap) {
			return mybatis.selectOne("MemberDAO.forgotPW",paramMap);
		}
		// 회원 주문내역 갯수
		public int getCountOrder(MemberVO vo) {
			return mybatis.selectOne("MemberDAO.orderCount", vo);
		}
		// 회원 주문내역
		public List<reservationVO> getOrderList(MemberVO vo) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user_id", vo.getUser_id());
			return mybatis.selectList("MemberDAO.orderMember", map);
		}
		// 회원 수
		public int getCountMember(MemberVO vo,String searchOption, String keyword) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			return mybatis.selectOne("MemberDAO.memberCount", vo);
		}
		// 회원현황
		public List<MemberVO> getMemberList(MemberVO vo,String searchOption, String keyword, int start, int end) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			map.put("start", start);
			map.put("end", end);
			return mybatis.selectList("MemberDAO.allMember", map);
		}
		// 회원정보 수정
		public void updateMember(MemberVO vo) {
			mybatis.update("MemberDAO.updateMember", vo);
		}
		//회원정보 탈퇴
		public void deleteMember(MemberVO vo){
			mybatis.delete("MemberDAO.deleteMember", vo);
		}
		//예약취소
		public void deleteReservation(MemberVO vo){
			mybatis.delete("MemberDAO.deleteReservation",vo);
		}
		public int Countbg(MemberVO vo){
			return mybatis.selectOne("MemberDAO.Countbg",vo);
		}
		public int Countite(MemberVO vo){
			return mybatis.selectOne("MemberDAO.Countite",vo);
		}
		public int Countpt(MemberVO vo){
			return mybatis.selectOne("MemberDAO.Countpt",vo);
		}
		public int payCount1(MemberVO vo){
			return mybatis.selectOne("MemberDAO.payCount1",vo);
		}
		public int payCount2(MemberVO vo){
			return mybatis.selectOne("MemberDAO.payCount2",vo);
		}
		public int payCount3(MemberVO vo){
			return mybatis.selectOne("MemberDAO.payCount3",vo);
		}
}
