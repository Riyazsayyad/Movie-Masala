package com.moviemasala.operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.omg.CORBA.PUBLIC_MEMBER;

import com.moviemasala.models.*;
import com.mysql.cj.xdevapi.Result;


public class Operations {

	private ArrayList<AdminOperations> film;
	public Operations()
	{
		film= new ArrayList<AdminOperations>();
	}
	// Find  films by name
	
	public ArrayList<AdminOperations> searchbyid(String filmname)
	{
		ArrayList<AdminOperations> list = new ArrayList<AdminOperations>();
		Connection con;
		PreparedStatement pst;
		
		ResultSet rs;
		AdminOperations ao;
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("SELECT * FROM films WHERE filmname=?; ");
			pst.setNString(1, filmname);
			rs=pst.executeQuery();
			
			
			while(rs.next())
			{
			
				
				
				
				ao=new AdminOperations();
				ao.setFilmid(rs.getString(1));
				ao.setFilmname(rs.getString(2));
				ao.setLanguage(rs.getString("language"));
				ao.setCountry(rs.getString("country"));
				ao.setCategory(rs.getString("category"));
				ao.setCertificate(rs.getString("certificate"));
				ao.setDirector(rs.getString("director"));
				ao.setActor(rs.getString("actor"));
				ao.setActress(rs.getString("actress"));
				ao.setMusic(rs.getString("music"));
				ao.setPlatform(rs.getString("platform"));
				ao.setBudget(rs.getString("budget"));
				ao.setCollection(rs.getString("collection"));
				ao.setYoutubetraillink(rs.getString("youtubetraillink"));
				ao.setRelyear(rs.getString("relyear"));
				ao.setDescription(rs.getString("description"));
				
				list.add(ao);
			
				
			}
			
			con.close();
			
			

		}
		catch(Exception e)
		{
			
			System.out.println(e);
	
		}
		list.forEach(System.out::println);
		
		
		return list;		
		

	}

//load photos in member dashboard 
	
	public ArrayList<AdminOperations> searchmemberpage(String searched )
	{
		ArrayList<AdminOperations> search = new ArrayList<AdminOperations>();
		Connection con;
		PreparedStatement pst;
		
		ResultSet rs;
		AdminOperations ao;
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("select * from films where language=? or certificate=?  or director=? or music=?  or filmname=?  or country=? or actor=? or actress=? or category=?; ");
			pst.setNString(1, searched);
			pst.setNString(2, searched);
			pst.setNString(3, searched);
			pst.setNString(4, searched);
			pst.setNString(5, searched);
			pst.setNString(6, searched);
			pst.setNString(7, searched);
			pst.setNString(8, searched);
			pst.setNString(9, searched);
			rs=pst.executeQuery();
			
			
			while(rs.next())
			{
			
				
				
				
				ao=new AdminOperations();
				ao.setFilmid(rs.getString(1));
				ao.setFilmname(rs.getString(2));
				ao.setLanguage(rs.getString("language"));
				ao.setCountry(rs.getString("country"));
				ao.setCategory(rs.getString("category"));
				ao.setCertificate(rs.getString("certificate"));
				ao.setDirector(rs.getString("director"));
				ao.setActor(rs.getString("actor"));
				ao.setActress(rs.getString("actress"));
				ao.setMusic(rs.getString("music"));
				ao.setPlatform(rs.getString("platform"));
				ao.setBudget(rs.getString("budget"));
				ao.setCollection(rs.getString("collection"));
				ao.setYoutubetraillink(rs.getString("youtubetraillink"));
				ao.setRelyear(rs.getString("relyear"));
				ao.setDescription(rs.getString("description"));
				search.add(ao);
			
				
			}
			
			con.close();
			
			

		}
		catch(Exception e)
		{
			
			System.out.println(e);
	
		}
		search.forEach(System.out::println);
		
		
		return search;		
		

	}
	
	//search bar member page
	
	public ArrayList<AdminOperations> loadDashposter()
	{
		ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
		Connection con;
		PreparedStatement pst;
		
		ResultSet rs;
		AdminOperations ao;
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("select filmid,filmname from films order by RAND() limit 8;; ");
			
			rs=pst.executeQuery();
			
			
			while(rs.next())
			{
			
				
				
				
				ao=new AdminOperations();
				ao.setFilmid(rs.getString(1));
				ao.setFilmname(rs.getString(2));
				
				
				poster.add(ao);
			
				
			}
			
			con.close();
			
			

		}
		catch(Exception e)
		{
			
			System.out.println(e);
	
		}
		poster.forEach(System.out::println);
		
		
		return poster;		
		

	}
	
//adding review	
	
	public String addReview(Reviews R)
	{
		Connection con;
		PreparedStatement pst;
		String accstatus="";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("insert into reviews values(?,?,?,?,?,?);");
			pst.setNString(1, R.getReviewid());
			pst.setNString(2, R.getFilmid());
			pst.setNString(3, R.getUserid());
			pst.setNString(4, R.getDetailreview());
			pst.setNString(5, R.getDate());
			pst.setNString(6, R.getFilmname());
			
			
			
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
	
	
	//viewing others reviews on respective films
	public ArrayList<Reviews> seereviews(String filmname)
	{
		ArrayList<Reviews> seereviews = new ArrayList<Reviews>();
		Connection con;
		PreparedStatement pst;
		
		ResultSet rs;
		Reviews ro;
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("select * from reviews where filmname=?;");
			pst.setNString(1, filmname);
			
			rs=pst.executeQuery();
			
			
			while(rs.next())
			{
			
				
				
				
				ro=new Reviews();
				ro.setDetailreview(rs.getString("detailreview"));
				ro.setUserid(rs.getString("userid"));
				
				
				seereviews.add(ro);
			
				System.out.println("Movie ka Review mil gya");
			}
			
			con.close();
			
			

		}
		catch(Exception e)
		{
			
			System.out.println(e);
	
		}
		seereviews.forEach(System.out::println);
		
		
		return seereviews;		
		

	}

	
	
//view own reviews		

	public ArrayList<Reviews> seemyreviews(String userid)
	{
		ArrayList<Reviews> myreviews = new ArrayList<Reviews>();
		Connection con;
		PreparedStatement pst;
		
		ResultSet rs;
		Reviews ro;
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("select * from reviews where userid=?;");
			pst.setNString(1, userid);
			rs=pst.executeQuery();
			
			
			while(rs.next())
			{
			
				
				
				
				ro=new Reviews();
				ro.setDetailreview(rs.getString("detailreview"));
				ro.setFilmname(rs.getString("filmname"));
				ro.setReviewid(rs.getString("reviewid"));
				
				myreviews.add(ro);
			
				System.out.println("khudka Review mil gya");
			}
			
			con.close();
			
			

		}
		catch(Exception e)
		{
			
			System.out.println(e);
	
		}
		myreviews.forEach(System.out::println);
		
		
		return myreviews;		
		

	}
	
	//delete review 
	public String dltReview(String reviewid)
	{
		Connection con;
		PreparedStatement pst;
		int rs;
		String accstatus="";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("DELETE FROM reviews WHERE reviewid=?;");
			pst.setNString(1, reviewid);
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
	
	//reset password
	
	public String resetpass(String userid,String userid1,String oldpass,String newpass)
	{
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		int rs1;
		String stat="";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("select * from userdata where userid=? and pswd=?;");
			pst.setNString(1, userid);
			pst.setNString(2, oldpass);
			rs=pst.executeQuery();
			System.out.println("phase 1 okay");
			System.out.println("phase 1 okay"+userid1);
			System.out.println("phase 1 okay"+userid);
			System.out.println("phase 1 okay"+oldpass);
			System.out.println("phase 1 okay"+newpass);
			if(rs.next())
			{
				try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
				pst=con.prepareStatement("update userdata set pswd=? where userid=?;");
				pst.setNString(1, newpass);
				pst.setNString(2, userid1);
				rs1=pst.executeUpdate();
				System.out.println("phase 2 okay");
				if(rs1==1)
				{
					stat="done";
				}
				
				}
				
				catch(Exception e)
				{
					System.out.println(e);
				}
			}
			
			
			
			con.close();
			
			
			

		}
		catch(Exception e)
		{
			stat="fail";
			System.out.println(e);
		}
		return stat;

	}

//like and  dislike & calculate number of likes 
	@SuppressWarnings("resource")
	public String likedislike(String filmid,String userid, int stat)
	{
		Connection con;
		PreparedStatement pst;
		String accstatus="";
		ResultSet rs;
		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("SELECT SUM(conclusion) FROM likedislike WHERE filmid=?;");
			pst.setNString(1, filmid);
			rs=pst.executeQuery();
			rs.next();
			 String A=rs.getString("SUM(CONCLUSION)");
			
			
			con.close();
			System.out.println("No. of likes"+A);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		if(stat==1) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("DELETE FROM likedislike WHERE filmid=? and userid=?;");
			pst.setNString(1, filmid);
			pst.setNString(2, userid);
			pst.executeUpdate();
			con.close();
			System.out.println("Previous Like deleted");
		} catch (Exception e) {
			System.out.println(e);
		}
			
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("insert into likedislike values(?,?,?);");
			pst.setNString(1, filmid);
			pst.setNString(2, userid);
			pst.setInt(3, stat);
			
			
			
			
			pst.executeUpdate();
			con.close();
			System.out.println("like added");
			accstatus="done";
			

		}
		catch(Exception e)
		{
			accstatus="fail";
			System.out.println(e);
		}
		
		}
		else  {
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
				pst=con.prepareStatement("UPDATE likedislike SET conclusion=0 WHERE userid=? AND filmid=?;");
				pst.setNString(1, userid);
				pst.setNString(2, filmid);
				pst.executeUpdate();
				con.close();
				System.out.println("like removed");
				accstatus="done";
				

			}
			catch(Exception e)
			{
				accstatus="fail";
				System.out.println(e);
				stat=0;
			}
			
		}
		
		
		return accstatus;

	}

	
	
	//category recommended films
	public ArrayList<AdminOperations> userRecommendFilms(String category,String userid)
	{
		Operations op = new Operations();
		String certificate="all";
		String query;
		film.clear();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		AdminOperations fm;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			
			pst=con.prepareStatement("select * from userdata where userid=?;");
			pst.setString(1, userid);
			rs=pst.executeQuery();
			rs.next();
			int age=op.userFindAge(rs.getString("dob"));
			if(age>=18)
			{
				certificate="'18+','16+','13+'";
			}
			else if(age<18 && age>=16)
			{
				certificate="'16+','13+'";
			}
			else if(age<16 && age>=13)
			{
				certificate="'13+'";
			}
			if(certificate.equals("all"))
			{
				query="select * from films where category='"+category+"' and certificate='all' ;";
			}
			else
			{
				query="select * from films where category='"+category+"' and certificate in ('all',"+certificate+") ;";
			}
			pst=con.prepareStatement(query);
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				fm=new AdminOperations();
				fm.setFilmid(rs.getString("filmid"));
				fm.setFilmname(rs.getString("filmname"));
				fm.setLanguage(rs.getString("language"));
				fm.setCountry(rs.getString("country"));
				fm.setCategory(rs.getString("category"));
				fm.setRelyear(rs.getString("relyear"));
				fm.setCertificate(rs.getString("certificate"));
				fm.setDirector(rs.getString("director"));
				fm.setActor(rs.getString("actor"));
				fm.setActress(rs.getString("actress"));
				fm.setMusic(rs.getString("music"));
				fm.setPlatform(rs.getString("platform"));
				fm.setBudget(rs.getString("budget"));
				fm.setCollection(rs.getString("collection"));
				fm.setDescription(rs.getString("description"));
				fm.setYoutubetraillink(rs.getString("youtubetraillink"));
				film.add(fm);
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return film;
	}
	
	
	public int userFindAge(String dob)
	{
		int age=0;
		LocalDate d3 = LocalDate.parse(dob, DateTimeFormatter.ISO_LOCAL_DATE);
	    LocalDate d4 = LocalDate.now();
	        
	    Period period = Period.between(d3,d4);
	    age = Math.abs(period.getYears());
	
		return age;
	}
	

	
	public ArrayList<AdminOperations> getFilms()
	{
		film.clear();
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		AdminOperations fm;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imdbdb?user=root&password=Riyaz@786");
			pst=con.prepareStatement("select * from films ;");
			rs=pst.executeQuery();
			
			while(rs.next())
			{
				fm=new AdminOperations();
				fm.setFilmid(rs.getString("filmid"));
				fm.setFilmname(rs.getString("filmname"));
				fm.setLanguage(rs.getString("language"));
				fm.setCountry(rs.getString("country"));
				fm.setCategory(rs.getString("category"));
				fm.setRelyear(rs.getString("relyear"));
				fm.setCertificate(rs.getString("certificate"));
				fm.setDirector(rs.getString("director"));
				fm.setActor(rs.getString("actor"));
				fm.setActress(rs.getString("actress"));
				fm.setMusic(rs.getString("music"));
				fm.setPlatform(rs.getString("platform"));
				fm.setBudget(rs.getString("budget"));
				fm.setCollection(rs.getString("collection"));
				fm.setDescription(rs.getString("description"));
				fm.setYoutubetraillink(rs.getString("youtubetraillink"));
				film.add(fm);
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		
		return film;
	}
	
}
