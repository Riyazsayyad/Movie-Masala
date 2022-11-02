package com.moviemasala.models;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("session")


public class Reviews {
	private String reviewid;
	private String filmid;
	private String userid;
	private String detailreview;
	private String date;
	private String filmname;

	

	public Reviews()
	{
		reviewid="";
		filmid="";
		userid="";
		detailreview="";
		date="";
		filmname="";
		
	}




	public String getReviewid() {
		return reviewid;
	}




	public void setReviewid(String reviewid) {
		this.reviewid = reviewid;
	}




	public String getFilmid() {
		return filmid;
	}




	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}




	public String getUserid() {
		return userid;
	}




	public void setUserid(String userid) {
		this.userid = userid;
	}




	public String getDetailreview() {
		return detailreview;
	}




	public void setDetailreview(String detailreview) {
		this.detailreview = detailreview;
	}




	public String getDate() {
		return date;
	}




	public void setDate(String date) {
		this.date = date;
	}




	public String getFilmname() {
		return filmname;
	}




	public void setFilmname(String filmname) {
		this.filmname = filmname;
	}

	
	
	
}