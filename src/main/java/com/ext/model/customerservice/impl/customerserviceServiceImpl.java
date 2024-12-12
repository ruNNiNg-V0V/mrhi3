package com.ext.model.customerservice.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ext.model.customerservice.customerserviceService;
import com.ext.model.customerservice.customerserviceVO;

@Service("customerserviceService")
public  class customerserviceServiceImpl implements customerserviceService {

	@Autowired
	private NoticeDAO noticeDAO;	

	// 공지사항 등록
	public void doregisterNotice(customerserviceVO vo) throws Exception {
		noticeDAO.doregisterNotice(vo);
	}
	// 공지사항 목록
		public List<customerserviceVO> listAllNotice(String searchOption, String keyword, int start, int end)
				throws Exception {
			return noticeDAO.listAllNotice(searchOption, keyword, start, end);
		}
		// 공지사항 갯수
		public int getCountNotice(String searchOption, String keyword) throws Exception {
			return noticeDAO.getCountNotice(searchOption, keyword);
		}
		// 공지사항 수정
		public void updateBoard(customerserviceVO vo) throws Exception {
			noticeDAO.updateBoard(vo);
		}
		// 공지사항 삭제
		public void deleteNotice(int bno) throws Exception {
			noticeDAO.deleteNotice(bno);
		}
		// 공지사항 삭제 체크
		public int checkNotice(int bno) throws Exception {
			return noticeDAO.checkNotice(bno);
		}
		// 공지사항 읽기
		public customerserviceVO readNotice(int bno) throws Exception {
			return noticeDAO.readNotice(bno);
		}
		// 이전 공지사항
		public customerserviceVO previousB(int bno) throws Exception {
			return noticeDAO.previousB(bno);
		}
		
		// 다음 공지사항
		public customerserviceVO nextB(int bno) throws Exception {
			return noticeDAO.nextB(bno);
		}
		// 조회수
		public void viewCnt(int bno, HttpSession session) throws Exception {
			// 타이머 설정
			long update_time = 0;

			if (session.getAttribute("update_time_" + bno) != null) {
				// 최근에 조회수를 올린 시간
				update_time = (Long) session.getAttribute("update_time_" + bno);
			}
			long current_time = System.currentTimeMillis();
			// 일정 시간이 경과한 후 조회수 증가 처리
			if (current_time - update_time > 5 * 10000) {
				// 조회수 증가 처리
				noticeDAO.viewCnt(bno);
				// 조회수를 올린 시간 저장
				session.setAttribute("update_time_" + bno, current_time);
			}
		}


}
