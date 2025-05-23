package com.miraecinema.biz.review;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ReviewVO {
	String rmvname;
	String coment;
	String rtime;
	String rname;
	String rid;

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRmvname() {
		return rmvname;
	}

	public void setRmvname(String rmvname) {
		this.rmvname = rmvname;
	}

	public String getComent() {
		return coment;
	}

	public void setComent(String coment) {
		this.coment = coment;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}
	
	public LocalDateTime getCreatedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return LocalDateTime.parse(rtime, formatter);
	}
}
