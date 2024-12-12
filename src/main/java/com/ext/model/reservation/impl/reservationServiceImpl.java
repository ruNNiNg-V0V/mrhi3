package com.ext.model.reservation.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ext.model.reservation.reservationService;
import com.ext.model.reservation.reservationVO;

@Service("reservationService")
public class reservationServiceImpl implements reservationService {
	
	@Autowired
	private reservationDAO ReservationDAO;
	
		//예약 중복 체크
	public int checkReservation(reservationVO vo) {
		return ReservationDAO.checkReservation(vo);	
				}
	    // 초급강습 예약 등록
		public void beginnerclassReservation(reservationVO vo) throws Exception {
			ReservationDAO.beginnerclassReservation(vo);
		}
		//중급강습 예약 등록
		public void intermediateclassReservation(reservationVO vo) throws Exception {
			ReservationDAO.intermediateclassReservation(vo);
		}
		//포인트강습 예약 등록
		public void pointclassReservation(reservationVO vo) throws Exception {
			ReservationDAO.pointclassReservation(vo);
		}

		
}
