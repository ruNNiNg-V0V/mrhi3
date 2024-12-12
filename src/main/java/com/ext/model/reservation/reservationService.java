package com.ext.model.reservation;

public interface reservationService {
	
	int checkReservation(reservationVO vo);//예약중복체크
	void beginnerclassReservation(reservationVO vo) throws Exception;// 초급강습 예약
	void intermediateclassReservation(reservationVO vo) throws Exception;// 중급강습 예약
	void pointclassReservation(reservationVO vo) throws Exception;// 포인트강습 예약
}
