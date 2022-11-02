package com.moviemasala.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.sun.mail.iap.Response;


@Component
@Scope("session")




public class AdminOperations {
	private String filmid;
	private String filmname;
	private String language;
	private String country;
	private String category;
	private String certificate;
	private String director;
	private String actor;
	private String actress;
	private String music;
	private String platform;
	private String budget;
	private String collection;
	private String youtubetraillink;
	private String relyear;
	private String description;
	
	public AdminOperations() {
		
		filmid="";
		filmname="";
		language="";
		country="";
		category="";
		certificate="";
		director="";
		actor="";
		actress="";
		music="";
		platform="";
		budget="";
		collection="";
		youtubetraillink="";
		relyear="";
		description="";
	}
	
	
	
	
	
	
	






	public String getFilmid() {
		return filmid;
	}
	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}
	public String getFilmname() {
		return filmname;
	}
	public void setFilmname(String filmname) {
		this.filmname = filmname;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getActress() {
		return actress;
	}
	public void setActress(String actress) {
		this.actress = actress;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public String getCollection() {
		return collection;
	}
	public void setCollection(String collection) {
		this.collection = collection;
	}
	public String getYoutubetraillink() {
		return youtubetraillink;
	}
	public void setYoutubetraillink(String youtubetraillink) {
		this.youtubetraillink = youtubetraillink;
	}
	public String getRelyear() {
		return relyear;
	}
	public void setRelyear(String relyear) {
		this.relyear = relyear;
	}
	
	
	
	
	public String getDescription() {
		return description;
	}













	public void setDescription(String description) {
		this.description = description;
	}




	public class FilmData {
		  private List<AdminOperations> films;

		  public List<AdminOperations> getUsers() {
		    return films;
		  }

		  public void setUsers(List<AdminOperations> users) {
		    this.films = users;
		  }
		}
	
	
	// adding new Film
	
		public String addNewFilm()
		{
			Connection con;
			PreparedStatement pst;
			String accstatus="";
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
				pst=con.prepareStatement("insert into films values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
				pst.setNString(1, getFilmid());
				pst.setNString(2, getFilmname());
				pst.setNString(3, getLanguage());
				pst.setNString(4,getCountry());
				pst.setNString(5, getCategory());
				pst.setNString(6, getCertificate());
				pst.setNString(7, getDirector());
				pst.setNString(8, getActor());
				pst.setNString(9,  getActress());
				pst.setNString(10, getMusic());
				pst.setNString(11, getPlatform());
				pst.setNString(12, getBudget());
				pst.setNString(13, getCollection());
				pst.setNString(14, getYoutubetraillink());
				pst.setNString(15, getRelyear());
				pst.setNString(16, getDescription());
				
				
				pst.executeUpdate();
				con.close();
				accstatus="done";
				

			}
			catch(Exception e)
			{
				accstatus="fail";
				System.out.println(e);
			}
			return accstatus;

		}
		
	//deleting film
		public String dltFilm()
		{
			Connection con;
			PreparedStatement pst;
			int rs;
			String accstatus="";
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
				pst=con.prepareStatement("DELETE FROM films WHERE filmid=?;");
				pst.setNString(1, getFilmid());
				rs=pst.executeUpdate();
				con.close();
				if(rs==1) {
				accstatus="done";
				}

			}
			catch(Exception e)
			{
				accstatus="fail";
				System.out.println(e);
			}
			return accstatus;

		}
	//modify film
		public String modifyFilm()
		{
			Connection con;
			PreparedStatement pst;
			String accstatus="";
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
				pst=con.prepareStatement("UPDATE films SET filmname=?,language=?,country=?,category=?,certificate=?,director=?,actor=?,actress=?,music=?,platform=?,budget=?,collection=?,youtubetraillink=?,relyear=? where filmid=?; ");
				
				pst.setNString(1, getFilmname());
				pst.setNString(2, getLanguage());
				pst.setNString(3,getCountry());
				pst.setNString(4, getCategory());
				pst.setNString(5, getCertificate());
				pst.setNString(6, getDirector());
				pst.setNString(7, getActor());
				pst.setNString(8,  getActress());
				pst.setNString(9, getMusic());
				pst.setNString(10, getPlatform());
				pst.setNString(11, getBudget());
				pst.setNString(12, getCollection());
				pst.setNString(13, getYoutubetraillink());
				pst.setNString(14, getRelyear());
				pst.setNString(15, getFilmid());
				
				pst.executeUpdate();
				con.close();
				accstatus="done";
				

			}
			catch(Exception e)
			{
				accstatus="fail";
				System.out.println(e);
			}
			return accstatus;

		}
		
		
	
}
