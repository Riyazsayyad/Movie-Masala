package com.moviemasala.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.apache.commons.io.IOUtils;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;

import com.moviemasala.models.*;
import com.moviemasala.operations.Operations;

@Controller

public class GlobalController {

@RequestMapping("/")
public String home()
{
 return "index";
}


	
@RequestMapping("/Register")
public String regitser()
{
	return "register";
}


@RequestMapping("/Sign-In")
public String signinpg()
{
	return "Signin";
}



@RequestMapping("/Home")
public ModelAndView dashboardd(Reviews R, Operations O,HttpServletRequest request,String search)
{
	ModelAndView mv = new ModelAndView();
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	poster = O.loadDashposter();
	mv.addObject("poster", poster);
	ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
	films=O.getFilms();
	mv.addObject("films",films);
	mv.setViewName("Dashboard") ;
	return mv;
}

@RequestMapping("/Admin")
public String adninboard()
{
	return "AdminDash";
}

@RequestMapping("/ForgotPass")
public String forgotPass()
{
	return "ForgotPass";
}

@RequestMapping("/Failure")
public String failedreq()
{
	return "Failure";
}

@RequestMapping("/MainDashboard")
public String memberdash()
{
	return "Dashboard";
}

@RequestMapping("/AddAcc")
public ModelAndView addnewaccount(Register u)
{
	String stat=u.addNewAccount();
	ModelAndView mv=new ModelAndView();
	if(stat.equals("done"))
		mv.setViewName("Signin");
	else
		mv.setViewName("Failure");
		
	return(mv);
}

@RequestMapping("/Signin")

public ModelAndView signingateway(Register u,String userid, String pswd, HttpServletRequest request,Operations O) 
{
	
	
	String stat=u.Signin();
	ModelAndView mv=new ModelAndView();
	
	HttpSession session = request.getSession(true);
	
	if((userid.equals("Admin")) && (pswd.equals("Admin@123")))
	{
		session.setAttribute("userid", userid);
		mv.setViewName("redirect:/Admin");
	}
	else {
		if(stat.equals("pass")) {
			
			session.setAttribute("userid", userid);
			ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
			poster = O.loadDashposter();
			mv.addObject("poster", poster);
			ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
			films=O.getFilms();
			mv.addObject("films",films);
			mv.setViewName("Dashboard");
		}
		else
			mv.setViewName("Failure");
		
	}
	return(mv);
}

@RequestMapping("/ForgotpassCheck")
public ModelAndView forgotpass(Register u,@RequestParam("userid") String userid)
{

String stat=u.ForgotpassCheck();
ModelAndView mv=new ModelAndView();

String user = u.getUserid();
if(stat.equals("pass")) {
	
	mv.addObject("userid", userid ); 
	mv.setViewName("ForgotPass_2");
}
else
	mv.setViewName("Failure");
return mv;

}


@RequestMapping("/ForgotpassCheck2")
public ModelAndView forgotpass2(Register u,HttpServletRequest request)
{

String stat=u.ForgotpassCheck2();
ModelAndView mv=new ModelAndView();
HttpSession session = request.getSession(true);
session.invalidate();

if(stat.equals("pass")) {
	
	mv.setViewName("Signin");
}
else
	mv.setViewName("Failure");
return mv;

}

@RequestMapping(value="/Logout",method = RequestMethod.GET)
public String logout(HttpSession session) {
	String userid=null;
	session.setAttribute("userid", userid);
	session.invalidate();
	
	
	
	return "logout" ;
}

//ADMIN JOBS


@RequestMapping("/AddFilm")
public ModelAndView addnewfilm(AdminOperations ao, @RequestParam CommonsMultipartFile file, HttpSession session) throws Exception
{
	String stat=ao.addNewFilm();
	String added = "done";
	ModelAndView mv=new ModelAndView();
	if(stat.equals("done")) {
		String filename = ao.getFilmid() + ".jpg";
		String path = "C:\\Users\\Asus\\eclipse-workspace\\Moviemasala\\WebContent\\posters";

		
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream
				(new FileOutputStream(new File(path + File.separator + filename)));
				
		stream.write(bytes);
		stream.flush();
		stream.close();
		
		
	}
	mv.addObject("added", added);
	mv.setViewName("redirect:/Admin");
	return(mv);
}

@RequestMapping("/ModifyFilm")
public ModelAndView modifyfilm(AdminOperations ao, @RequestParam CommonsMultipartFile file, HttpSession session) throws Exception
{
	String stat=ao.modifyFilm();
	String added = "done";
	ModelAndView mv=new ModelAndView();
	if(stat.equals("done")) {
		String filename = ao.getFilmid() + ".jpg";
		String path = "C:\\Users\\Asus\\eclipse-workspace\\Moviemasala\\WebContent\\posters";

		
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream
				(new FileOutputStream(new File(path + File.separator + filename)));
				
		stream.write(bytes);
		stream.flush();
		stream.close();
		
		
	}
	mv.addObject("added", added);
	mv.setViewName("redirect:/Admin");
	return(mv);
}


@RequestMapping("/DltFilm")
public ModelAndView dltfilm(AdminOperations ao, @RequestParam("filmid") String filmid ) throws IOException 
{
	String stat=ao.dltFilm();
	String dlted = "dlt";
	ModelAndView mv=new ModelAndView();
	if(stat.equals("done")) {
		String film = filmid;
		File fileToDelete = new File(
				"C:\\Users\\Asus\\eclipse-workspace\\Moviemasala\\WebContent\\posters"
						+ filmid + ".jpg");
		boolean success = fileToDelete.delete();
		mv.addObject("dlted", dlted);
		mv.setViewName("redirect:/Admin");
		}
	else {
		mv.setViewName("Failure");
	}
	
	return(mv);
}

@RequestMapping(value = "/SearchFilm")
public ModelAndView adminFindFilm(String filmname, Operations O) {
	ModelAndView mv = new ModelAndView();
	ArrayList<AdminOperations> list = new ArrayList<AdminOperations>();
	list = O.searchbyid(filmname);
	
	
	mv.addObject("list", list);
	mv.setViewName("AdminDash");
	return mv;
}

// All member operations below

@RequestMapping("/MemberSearch")
public ModelAndView searchbar(@RequestParam("search") String search, Operations O,HttpServletRequest request,Reviews R, String filmid) {
	ModelAndView mv = new ModelAndView();
	HttpSession session = request.getSession(true);
	String userid = (String) session.getAttribute( "userid");
	
	ArrayList<AdminOperations> searchresult = new ArrayList<AdminOperations>();
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	ArrayList<Reviews> allreviews = new ArrayList<Reviews>();
	
	
	searchresult = O.searchmemberpage(search);
	poster = O.loadDashposter();
	allreviews =O.seereviews(filmid);	
	
	session.setAttribute("userid", userid);
	ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
	films=O.getFilms();
	mv.addObject("poster", poster);
	mv.addObject("searchresult", searchresult);
	mv.addObject("allreviews", allreviews);
	mv.addObject("films",films);
	mv.setViewName("Dashboard");
	return mv;
}

@RequestMapping("/CreateReview")
public ModelAndView creatingreview(Reviews R, Operations O,HttpServletRequest request,String search) {
	ModelAndView mv = new ModelAndView();
	HttpSession session = request.getSession(true);
	String userid = (String) session.getAttribute( "userid");
	String stat=O.addReview(R);
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	poster = O.loadDashposter();
	
	if(stat.equals("done")) {
		ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
		films=O.getFilms();
		mv.addObject("poster", poster);
		session.setAttribute("userid", userid);
		mv.addObject("films",films);
		mv.setViewName("redirect:/MemberSearch?search="+search);
	}
	else
		
		mv.setViewName("Failure");
		
	return(mv);
	
}

@RequestMapping("/MyReviews")
public ModelAndView ohhitsmyreviews(String search, Operations O,HttpServletRequest request,Reviews R, String filmid) {
	ModelAndView mv = new ModelAndView();
	HttpSession session = request.getSession(true);
	String userid = (String) session.getAttribute( "userid");
	
	ArrayList<AdminOperations> searchresult = new ArrayList<AdminOperations>();
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	ArrayList<Reviews> allreviews = new ArrayList<Reviews>();
	ArrayList<Reviews> myreviews = new ArrayList<Reviews>();
	ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
	films=O.getFilms();
	searchresult = O.searchmemberpage(search);
	poster = O.loadDashposter();
	allreviews =O.seereviews(filmid);	
	myreviews =O.seemyreviews(userid);
	
	session.setAttribute("userid", userid);
	mv.addObject("myreviews", myreviews);
	mv.addObject("poster", poster);
	mv.addObject("searchresult", searchresult);
	mv.addObject("allreviews", allreviews);
	mv.addObject("films",films);
	mv.setViewName("Dashboard");
	return mv;
}


@RequestMapping("/dltReview")
public ModelAndView dltReview(Operations O, @RequestParam("reviewid") String reviewid,HttpServletRequest request ) throws IOException 
{
	HttpSession session = request.getSession(true);
	String userid = (String) session.getAttribute( "userid");
	String stat=O.dltReview(reviewid);
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	poster = O.loadDashposter();
	ModelAndView mv=new ModelAndView();
	if(stat.equals("done")) {
		
		session.setAttribute("userid", userid);
		mv.addObject("poster", poster);
		ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
		films=O.getFilms();
		mv.addObject("films",films);
		mv.setViewName("redirect:/MyReviews");
		}
	else {
		mv.setViewName("Failure");
	}
	
	return(mv);
}


@RequestMapping("/ShowReviews")
public ModelAndView seereview(Operations O, @RequestParam("filmname") String filmname,HttpServletRequest request ) {
	ModelAndView mv = new ModelAndView();
	ArrayList<Reviews> seereviews = new ArrayList<Reviews>();
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	seereviews =O.seereviews(filmname);	
	poster = O.loadDashposter();
	mv.addObject("poster", poster);
	mv.addObject("seereviews", seereviews);
	ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
	films=O.getFilms();
	mv.addObject("films",films);
	mv.setViewName("forward:/MemberSearch?search="+filmname);
	return mv;
}

@RequestMapping("/ResetPass")
public ModelAndView resetpass(Operations O, @RequestParam("userid") String userid, @RequestParam("userid") String userid1,@RequestParam("oldpass") String oldpass,@RequestParam("newpass") String newpass,HttpServletRequest request ) {
	ModelAndView mv = new ModelAndView();
	String stat=O.resetpass(userid,userid1, oldpass, newpass);
	String problem="...";
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	poster = O.loadDashposter();
	
	if(stat.equals("done")) {
	
	mv.addObject("poster", poster);
	ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
	films=O.getFilms();
	mv.addObject("films",films);
	mv.setViewName("Dashboard");
	}
	else {
		mv.addObject("problem", problem);
		ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
		films=O.getFilms();
		mv.addObject("films",films);
		mv.setViewName("Dashboard");
	}
	
	return mv;
}

@RequestMapping("/Likedislike")
public ModelAndView likedislike(Operations O, @RequestParam("filmid") String filmid, @RequestParam("userid") String userid,@RequestParam("stat") int stat,HttpServletRequest request, @RequestParam("filmname") String filmname ) {
	ModelAndView mv = new ModelAndView();
	String process=O.likedislike(filmid,userid, stat);
	String problem="...";
	HttpSession session = request.getSession(true);
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	
	O.likedislike(filmid, userid, stat);
	
	poster = O.loadDashposter();
	
	if(process.equals("done")) {
	session.setAttribute("stat", stat);
	mv.addObject("poster", poster);
	ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
	films=O.getFilms();
	mv.addObject("films",films);
	mv.setViewName("redirect:/MemberSearch?search="+filmname);
	}
	else {
	
		mv.addObject("problem", problem);
		mv.setViewName("Dashboard");
	}
	
	return mv;
}

@RequestMapping(value = "/userrecommendfilmlist")
public ModelAndView userRecommendFilmList(String category,HttpServletRequest request,Operations O)
{
	HttpSession session = request.getSession(true);
	String userid=String.valueOf(session.getAttribute("userid"));
	ModelAndView mv=new ModelAndView();
	ArrayList<AdminOperations> poster = new ArrayList<AdminOperations>();
	ArrayList<AdminOperations> films = new ArrayList<AdminOperations>();
	
	poster = O.loadDashposter();
	films=O.userRecommendFilms(category, userid);
	mv.addObject("films1",films);
	mv.addObject("poster", poster);
	session.setAttribute("userid", userid);
	mv.setViewName("Recommended");
	return mv;
}





}
