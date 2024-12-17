package com.miraecinema.biz.movie;

// VO로 쓰면 됨
public class MovieInfo {
	String rnum;
	String movieCd;
	String movieNm;
	
	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
}
