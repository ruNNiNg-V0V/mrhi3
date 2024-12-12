package com.ext.view.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ext.model.reservation.reservationService;
import com.ext.model.reservation.reservationVO;

@Controller
public class ReservationController {
	@Autowired
	private reservationService reservationservice;

	@RequestMapping("/reservation") // 코스선택 페이지 view
	public String reservation(reservationVO vo) {
		return "reservation/reservation";
	}
	//예약중복체크
	@ResponseBody
	@RequestMapping(value = "/checkReservation")
	public int checkReservation(reservationVO vo) {
	int checkReservation = reservationservice.checkReservation(vo);
	return checkReservation;
	}
	//초급강습 예약 페이지 view
	@RequestMapping("/beginnerclass")
	public String beginnerclass(reservationVO vo) {
		return "reservation/beginnerclass";
	}
	//초급강습 예약 등록
	@RequestMapping(value = "/beginnerclassReservation")
	public String beginnerclassReservation(reservationVO vo) throws Exception {
		reservationservice.beginnerclassReservation(vo);
		return "reservation/beginnerclass";
	}
	//중급강습 예약 페이지 view
		@RequestMapping("/intermediateclass")
		public String intermediateclass(reservationVO vo) {
			return "reservation/intermediateclass";
		}
		//중급강습 예약 등록
		@RequestMapping(value = "/intermeidateclassReservation")
		public String intermediateclassReservation(reservationVO vo) throws Exception {
			reservationservice.intermediateclassReservation(vo);
			return "reservation/beginnerclass";
		}
		//포인트강습 예약 페이지 view
		@RequestMapping("/pointclass")
		public String pointclass(reservationVO vo) {
			return "reservation/pointclass";
		}
		//포인트강습 예약 등록
		@RequestMapping(value = "/pointclassReservation")
		public String pointclassReservation(reservationVO vo) throws Exception {
			reservationservice.pointclassReservation(vo);
			return "reservation/pointclass";
		}

}
