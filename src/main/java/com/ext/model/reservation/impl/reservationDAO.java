package com.ext.model.reservation.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ext.model.reservation.reservationVO;

@Repository
public class reservationDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
				
	// 예약 중복 체크
			public int checkReservation(reservationVO vo) {
				return mybatis.selectOne("reservationDAO.checkReservation", vo);
			}
				// 초급강습 예약 등록
				public void beginnerclassReservation(reservationVO vo) {
				mybatis.insert("reservationDAO.beginnerclassReservation", vo);
		}
				// 중급강습 예약 등록
				public void intermediateclassReservation(reservationVO vo) {
					mybatis.insert("reservationDAO.intermediateclassReservation", vo);
				}
				// 포인트강습 예약 등록
				public void pointclassReservation(reservationVO vo) {
					mybatis.insert("reservationDAO.pointclassReservation", vo);
				}
}
