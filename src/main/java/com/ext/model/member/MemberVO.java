package com.ext.model.member;

import java.util.Date;

public class MemberVO {
	
	private int user_num; //회원 번호
	private String user_id; //회원 아이디
	private String user_password; //회원 비밀번호
	private String user_name; //회원이름
	private String user_birth; //회원 생년월일
	private String user_tel; //회원 연락처
	private String user_email; //회원 이메일
	private String user_addr; //회원 주소
	private Date user_join; //회원 가입일
	private int bgCount; //초급강습 예약 수
	private int iteCount; //중급강습 예약 수
	private int ptCount;//포인트 강습 예약 수 
	private int payCount1;
	private int payCount2;
	private int payCount3;

	
	
	public int getPayCount1() {
		return payCount1;
	}
	public void setPayCount1(int payCount1) {
		this.payCount1 = payCount1;
	}
	public int getPayCount2() {
		return payCount2;
	}
	public void setPayCount2(int payCount2) {
		this.payCount2 = payCount2;
	}
	public int getPayCount3() {
		return payCount3;
	}
	public void setPayCount3(int payCount3) {
		this.payCount3 = payCount3;
	}
	public int getBgCount() {
		return bgCount;
	}
	public void setBgCount(int bgCount) {
		this.bgCount = bgCount;
	}
	public int getIteCount() {
		return iteCount;
	}
	public void setIteCount(int iteCount) {
		this.iteCount = iteCount;
	}
	public int getPtCount() {
		return ptCount;
	}
	public void setPtCount(int ptCount) {
		this.ptCount = ptCount;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public Date getUser_join() {
		return user_join;
	}
	public void setUser_join(Date user_join) {
		this.user_join = user_join;
	}
}