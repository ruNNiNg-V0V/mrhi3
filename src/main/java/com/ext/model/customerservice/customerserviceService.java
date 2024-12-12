package com.ext.model.customerservice;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface customerserviceService {

	void doregisterNotice(customerserviceVO vo) throws Exception;// 공지사항 작성
	void updateBoard(customerserviceVO vo) throws Exception;					// 공지사항 수정
	void deleteNotice(int bno) throws Exception;						// 공지사항 삭제
	List<customerserviceVO> listAllNotice(String searchOption,String keyword,int start, int end) throws Exception;	// 공지사항 목록
	int getCountNotice(String searchOption,String keyword) throws Exception;	// 공지사항 갯수
   customerserviceVO readNotice(int bno) throws Exception;					// 공지사항 읽기
	void viewCnt(int bno, HttpSession session) throws Exception;	// 조회수
	customerserviceVO previousB(int bno) throws Exception;					// 이전글
	customerserviceVO nextB(int bno) throws Exception;						// 다음글
	int checkNotice(int bno) throws Exception;						// 공지사항 삭제 체크, 숨김
}
