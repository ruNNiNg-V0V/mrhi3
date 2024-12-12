package com.ext.model.customerservice.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ext.model.customerservice.customerserviceVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 공지사항 쓰기
	public void doregisterNotice(customerserviceVO vo) {
		mybatis.insert("NoticeDAO.doregisterNotice", vo);
	}

	// 공지사항 목록
	public List<customerserviceVO> listAllNotice(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("NoticeDAO.listAllNotice", map);
	}

	// 공지사항 갯수
	public int getCountNotice(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("NoticeDAO.getCountNotice", map);
	}
	// 공지사항 삭제 체크
		public int checkNotice(int bno) throws Exception {
			return mybatis.selectOne("NoticeDAO.checkNotice", bno);
		}
		// 공지사항 읽기
		public customerserviceVO readNotice(int bno) {
			return (customerserviceVO) mybatis.selectOne("NoticeDAO.readNotice", bno);
		}
		// 이전글
		public customerserviceVO previousB(int bno) {
			return (customerserviceVO) mybatis.selectOne("NoticeDAO.previousB", bno);
		}

		// 다음글
		public customerserviceVO nextB(int bno) {
			return (customerserviceVO) mybatis.selectOne("NoticeDAO.nextB", bno);
		}
		// 조회수
		public void viewCnt(int bno) {
			mybatis.update("NoticeDAO.viewCnt", bno);
		}
		// 공지사항 수정
		public void updateBoard(customerserviceVO vo) {
			mybatis.update("NoticeDAO.updateBoard", vo);
		}
		// 공지사항 삭제
		public void deleteNotice(int bno) {
			mybatis.update("NoticeDAO.deleteNotice", bno);
		}

}
