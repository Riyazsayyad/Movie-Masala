package com.moviemasala.models;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


@Component
@Scope("session")


public class Register {
	private String userid;
	private String pswd;
	private String name;
	private String email;
	private String mobileno;
	private String secquestion;
	private String secans;
	private String joindt;
	private String dob;
	private String gender;

	

	public Register()
	{
		userid="";
		pswd="";
		name="";
		email="";
		mobileno="";
		secquestion="";
		secans="";
		joindt="";
		dob="";
		gender="";
		
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPswd() {
		return pswd;
	}


	public void setPswd(String pswd) {
		this.pswd = pswd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMobileno() {
		return mobileno;
	}


	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}


	public String getSecquestion() {
		return secquestion;
	}


	public void setSecquestion(String secquestion) {
		this.secquestion = secquestion;
	}


	public String getSecans() {
		return secans;
	}


	public void setSecans(String secans) {
		this.secans = secans;
	}


	


	public String getJoindt() {
		return joindt;
	}


	public void setJoindt(String joindt) {
		this.joindt = joindt;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	
// adding new account
	
	public String addNewAccount()
	{
		Connection con;
		PreparedStatement pst;
		String accstatus="";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("insert into userdata values(?,?,?,?,?,?,?,?,?,?);");
			pst.setNString(1, getUserid());
			pst.setNString(2, getPswd());
			pst.setNString(3, getName());
			pst.setNString(4,getEmail());
			pst.setNString(5, getMobileno());
			pst.setNString(6, getSecquestion());
			pst.setNString(7, getSecans());
			pst.setNString(8, getJoindt());
			pst.setNString(9,  getDob());
			pst.setNString(10, getGender());
			
			
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
	
//	forgot pass check
	
	public String ForgotpassCheck()
	{
		Connection con;
		PreparedStatement pst;
		String accstatus="";
		ResultSet rs;
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement(" select * from userdata where secquestion=? and secans=? and userid=?;");
			pst.setNString(1, getSecquestion());
			pst.setNString(2, getSecans());
			pst.setNString(3, getUserid());
			
			rs=pst.executeQuery();
			
			
			
				if(rs.next())
				{
					accstatus="pass";
				}
				else 
				{
					accstatus="fail";
				}
		
						con.close();
			
			

		}
		catch(Exception e)
		{
						System.out.println(e);
		}
		return accstatus;
}

	
	//signin check
	
	public String Signin()
	{
		Connection con;
		PreparedStatement pst;
		String accstatus="";
		ResultSet rs;
		String id = getUserid();
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement(" select * from userdata where userid=? and pswd=?;");
			pst.setNString(1, getUserid());
			pst.setNString(2, getPswd());
			
			
			rs=pst.executeQuery();
			
			
			if (id.equals("admin")) {
				
				
				accstatus="admin";
				
			} else {
				if(rs.next())
				{
					accstatus="pass";
				}
				else 
				{
					accstatus="fail";
				}
			}
						con.close();
			
			

		}
		catch(Exception e)
		{
						System.out.println(e);
		}
		return accstatus;
}
	
//final pass reset	
	
	
	public String ForgotpassCheck2()
	{
		Connection con;
		PreparedStatement pst;
		String accstatus="";
//		ResultSet rs;
		int rs;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("UPDATE userdata SET pswd=? WHERE userid=? ");
			pst.setNString(1, getPswd());
			pst.setNString(2, getUserid());
			
			
			rs=pst.executeUpdate();
			
			
			
				if(rs==1)
				{
					accstatus="pass";
				}
				else 
				{
					accstatus="fail";
				}
		
						con.close();
			
			

		}
		catch(Exception e)
		{
						System.out.println(e);
		}
		return accstatus;
}
	
}
