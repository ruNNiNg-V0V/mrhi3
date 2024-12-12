package com.ext.model.reservation;

public class reservationVO {
	private int rno; // 예약번호
	private String id; // 유저아이디
	private String course; // 강습종류
	private String rental; //렌탈
	private String other; //기타
	private int person; // 인원 수
	private String totalpay; //총 금액
	private String payment; // 결제여부
	private String resday; // 예약일
	

	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getRental() {
		return rental;
	}
	public void setRental(String rental) {
		this.rental = rental;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public String getTotalpay() {
		return totalpay;
	}
	public void setTotalpay(String totalpay) {
		this.totalpay = totalpay;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getResday() {
		return resday;
	}
	public void setResday(String resday) {
		this.resday = resday;
	}
	
	
	
}
