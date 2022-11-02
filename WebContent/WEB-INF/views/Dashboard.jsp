<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.moviemasala.models.AdminOperations"%>

        <!DOCTYPE html>
        <html>
<% if(session.getAttribute("userid") != null) {
	
	%>
        <head>
            <meta charset="ISO-8859-1" />
            <title>Hi ${userid}</title>
            <link rel="preconnect" href="https://fonts.gstatic.com" />
            <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,wght@0,300;0,400;0,600;0,900;1,200;1,900&family=Staatliches&display=swap" rel="stylesheet" />
            <script type="text/javascript">
                function makeid(length) {
                    var result = [];
                    var characters =
                        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    var charactersLength = characters.length;
                    for (var i = 0; i < length; i++) {
                        result.push(
                            characters.charAt(Math.floor(Math.random() * charactersLength))
                        );
                    }
                    return result.join("");
                }

                var curday = function(sp) {
                    today = new Date();
                    var dd = today.getDate();
                    var mm = today.getMonth() + 1; //As January is 0.
                    var yyyy = today.getFullYear();

                    if (dd < 10) dd = "0" + dd;
                    if (mm < 10) mm = "0" + mm;
                    return mm + sp + dd + sp + yyyy;
                }

                window.onload = function() {
                    document.getElementById("reviewid").value = makeid(5);
                    document.getElementById("date").value = curday("-");
                };

                function openResetform() {
                    document.getElementById("myForm1").style.display = "block";
                }

                function closeResetform() {
                    document.getElementById("myForm1").style.display = "none";
                }
                
                function openRecommend() {
                    document.getElementById("myForm2").style.display = "block";
                }

                function closeRecommend() {
                    document.getElementById("myForm2").style.display = "none";
                }

                function verifypassword() {
                    pw = document.frm.pswd.value;
                    cpw = document.frm.cnfpswd.value;
                    if (pw != cpw) {
                        alert("Password doesn't match..");
                        return false;
                    } else {
                        return true;
                    }

                }
            </script>
<script language="Javascript" type="text/javascript">


function verify() {
	 if (document.frm.category.value != "Category") {
		
		 return true;
	}
	 else{
		
		 alert("Please Select Anything...");
			return false;
	}
}

</script>
            <style>
        * {
                    margin: 0;
                    padding: 0;
                    font-family: "Nunito Sans", sans-serif;
                }
                
                #recc{
                z-index: 8;
                
                }
                
                body {
                    background-color: black;
                }
                
                #myForm1 {
                    display: none;
                }
                
                #myForm2 {
                    display: none;
                }
                
                header {
                    background-color: rgba(128, 128, 128, 0.603);
                }
                
                .Header-buttons {
                    all: unset;
                    background-color: black;
                    display: inline-block;
                    margin: 12px;
                    background-blend-mode: color-burn;
                    padding: 5px;
                    color: white;
                    border-bottom-style: revert;
                    cursor: pointer;
                }
                
                p#error.Header-buttons {
                    background-color: unset;
                    color: unset;
                }
                
                .Header-buttons:hover {
                    opacity: 70%;
                    border-bottom-style: none;
                }
                
                .Search-bar {
                    color: white;
                }
                
                #searchbar {
                    position: absolute;
                    top: 32vh;
                    left: 30vw;
                }
                
                #searchbar1 {
                    padding: 9px;
                    margin: 5px;
                    width: 32vw;
                }
                
                #search-button {
                    all: unset;
                    padding: 6px;
                    margin: -11px;
                    cursor: pointer;
                    border-block-width: 50px;
                    border-left-width: thick;
                    border: solid;
                    border-width: 1px;
                    position: relative;
                    bottom: -1px;
                }
                
                .mocie-grid {
                    display: grid;
                }
                
                #error:hover {
                    text-shadow: 0 0 200px #ffffff, 0 0 80px #ffffffd4, 0 0 6px #ffffffce;
                    cursor: default;
                }
                
                #error {
                    font-size: 30px;
                    color: #fff;
                    text-shadow: 0 0 80px #fff, 0 0 30px #fff, 0 0 6px #fff;
                }
                
                #error span {
                    animation: upper 11s linear infinite;
                }
                
                @keyframes upper {
                    0%,
                    19.999%,
                    22%,
                    62.999%,
                    64%,
                    64.999%,
                    70%,
                    100% {
                        opacity: 0.99;
                        opacity: 0.99;
                        text-shadow: 0 0 80px #fff, 0 0 30px #fff, 0 0 6px #fff;
                    }
                    20%,
                    21.999%,
                    63%,
                    63.999%,
                    65%,
                    69.999% {
                        opacity: 0.4;
                        text-shadow: none;
                    }
                }
                
                #error {
                    font-size: 30px;
                }
                
                .animated-grid,
                #animatedgrid {
                    height: 153vh;
                    margin-bottom: 200px;
                    display: grid;
                    gap: 1rem;
                    grid-template-areas: "a b c d" "e f g h" "i i i i" "i i i i";
                    grid-template-rows: repeat(4, 35%);
                    grid-template-columns: auto auto auto auto;
                    --stagger-delay: 100ms;
                    position: relative;
                    top: 40vh;
                    filter: none;
                    z-index: 1;
                }
                
                @keyframes cardEntrance {
                    from {
                        opacity: 0;
                        transform: scale(0.3);
                        filter: hue-rotate(180deg);
                    }
                    to {
                        opacity: 1;
                        transform: scale(1);
                        filter: hue-rotate(0deg);
                    }
                }
                
                .card {
                    background-color: rgb(36, 243, 147);
                    animation: cardEntrance 700ms ease-out;
                    animation-delay: 0s;
                    animation-fill-mode: none;
                    animation-fill-mode: backwards;
                    background-size: 331px 220px;
                    background-repeat: no-repeat;
                    background-position: center;
                    display: flex;
                    flex-direction: column;
                    justify-content: flex-end;
                    align-items: center;
                    background: #353535;
                    background-position-x: 0%;
                    background-position-y: 0%;
                    background-repeat: repeat;
                    background-image: none;
                    background-size: auto;
                    font-size: -8px;
                    color: #fff;
                    box-shadow: rgba(3, 8, 20, 0.1) 0px 0.15rem 0.5rem, rgba(2, 8, 20, 0.1) 0px 0.075rem 0.175rem;
                    height: 100%;
                    width: 100%;
                    border-radius: 4px;
                    transition: all 500ms;
                    overflow: hidden;
                    background-size: cover;
                    background-position: center;
                    background-repeat: no-repeat;
                }
                
                .card1 {
                    background-color: rgb(36, 243, 147);
                    animation: cardEntrance 700ms ease-out;
                    animation-delay: 0s;
                    animation-fill-mode: none;
                    animation-fill-mode: backwards;
                    background-size: 331px 220px;
                    background-repeat: no-repeat;
                    background-position: center;
                    display: flex;
                    flex-direction: column;
                    justify-content: flex-end;
                    align-items: center;
                    background: #353535;
                    background-position-x: 0%;
                    background-position-y: 0%;
                    background-repeat: repeat;
                    background-image: none;
                    background-size: auto;
                    font-size: -8px;
                    color: #fff;
                    box-shadow: rgba(3, 8, 20, 0.1) 0px 0.15rem 0.5rem, rgba(2, 8, 20, 0.1) 0px 0.075rem 0.175rem;
                    height: 100%;
                    width: 100%;
                    border-radius: 4px;
                    transition: all 500ms;
                    overflow: hidden;
                    background-size: cover;
                    background-position: center;
                    background-repeat: no-repeat;
                }
                
                .card:hover {
                    box-shadow: rgba(2, 8, 20, 0.1) 0px 0.35em 1.175em, rgba(2, 8, 20, 0.08) 0px 0.175em 0.5em;
                    transform: translateY(-3px) scale(1.1);
                }
                
                .card:nth-child(1) {
                    grid-area: a;
                    animation-delay: calc(1 * var(--stagger-delay));
                }
                
                .card:nth-child(2) {
                    grid-area: b;
                    animation-delay: calc(2 * var(--stagger-delay));
                }
                
                .card:nth-child(3) {
                    grid-area: c;
                    animation-delay: calc(3 * var(--stagger-delay));
                }
                
                .card:nth-child(4) {
                    grid-area: d;
                    animation-delay: calc(4 * var(--stagger-delay));
                }
                
                .card:nth-child(5) {
                    grid-area: e;
                    animation-delay: calc(5 * var(--stagger-delay));
                }
                
                .card:nth-child(6) {
                    grid-area: f;
                    animation-delay: calc(6 * var(--stagger-delay));
                }
                
                .card:nth-child(7) {
                    grid-area: g;
                    animation-delay: calc(7 * var(--stagger-delay));
                }
                
                .card:nth-child(8) {
                    grid-area: h;
                    animation-delay: calc(8 * var(--stagger-delay));
                }
                
                .card:nth-child(9) {
                    grid-area: i;
                    animation-delay: calc(8 * var(--stagger-delay));
                }
                
                div#videoyt.card {
                    box-shadow: 0;
                    transform: none;
                }
                
                div.card {
                    font-size: 0;
                }
                
                div.card:hover {
                    font-size: 50px;
                    text-shadow: black highlighttext;
                    background-position: bottom;
                }
                
                a {
                    text-decoration: none;
                    color: white;
                }
                
                #dummy {
                    color: white;
                    position: absolute;
                    top: 192vh;
                }
                
                .searchres {
                    height: auto;
                    margin-bottom: 182px;
                    display: grid;
                    gap: 1rem;
                    grid-template-areas: "s s" " s s";
                    grid-template-rows: repeat(1, 31%);
                    grid-template-columns: auto auto;
                    --stagger-delay: 100ms;
                    position: relative;
                    top: 3vh;
                    z-index: 3;
                    width: 68vw;
                    right: 8vw;
                    text-shadow: 2px 3px 3px black;
                    font-size: larger;
                }
            }
            .card1:nth-child(1) {
                grid-area: s;
                animation-delay: calc(8 * var(--stagger-delay));
            }
            #cross {
                all: unset;
                padding: 5px;
                padding-left: 7px;
                padding-right: 7px;
                background-color: black;
                text-align: center;
                font-size: large;
                /* left: 45px; */
                /* right: 23px; */
                
                cursor: default;
                margin-left: 62vh;
                margin-bottom: 70vh;
            }
            #cross2 {
                padding-left: 7px;
                padding-right: 7px;
                background-color: black;
                text-align: center;
                font-size: large;
                color: white;
                cursor: default;
                margin-left: 0vh;
                margin-bottom: 11vh;
                border: 1px white solid;
            }
            #cross3 {
                padding-left: 7px;
                padding-right: 7px;
                background-color: black;
                text-align: center;
                font-size: large;
                color: white;
                cursor: default;
                margin-left: 0vh;
                margin-bottom: 0vh;
                border: 1px white solid;
                display: inline-table;
                position: absolute;
                width: 4vh;
                height: 9vh;
                left: 35vw;
                bottom: 57vh;
            }
            #createview input {
                border: 0;
                border-radius: 13px;
                background: black;
                color: white;
                width: 32vw;
                height: 6vh;
                padding: 5px;
                margin-bottom: 4px;
            }
            #showReviews {
                position: absolute;
                left: 0vh;
                color: white;
                top: 13vh;
                height: 15vh;
                display: flex;
                flex-direction: row;
            }
            .reviewtab {
                margin-right: 20px;
                margin-left: 14px;
            }
            #dltbutt {
                all: unset;
                border: solid white 1px;
                padding-left: 4px;
                padding-right: 4px;
                cursor: default;
            }
            #RR {
                display: flex;
                flex-direction: column;
                background-color: #000000b8;
                padding: 10px;
                margin: auto;
            }
            .form-popup {
                display: none;
                position: absolute;
                padding-bottom: 84px;
                bottom: -152vh;
                right: 68vh;
                border: 0px solid #f1f1f1;
                z-index: 9;
            }
            /* Add styles to the form container */
            .form-container {
                max-width: 300px;
                font-family: "Nunito Sans", sans-serif;
                padding: 44px;
                padding-top: 44px;
                padding-right: 44px;
                padding-right: 80px;
                padding-top: 10px;
                background-color: #808080d6;
                backdrop-filter: blur(1px);
                color: white;
                font-size: smaller;
                font-style: normal;
                font-weight: 100;
                left: 17vw;
                position: absolute;
                bottom: -23vh;
            }
            .form-container1 {
            max-width: 300px;
font-family: "Nunito Sans", sans-serif;
padding: 287px;
    padding-top: 287px;
    padding-right: 287px;
padding-top: 44px;
padding-right: 44px;
padding-right: 80px;
padding-top: 10px;
background-color: #808080d6;
backdrop-filter: blur(1px);
color: white;
font-size: smaller;
font-style: normal;
font-weight: 100;
left: 17vw;
position: absolute;
bottom: -23vh;
           } 
            
            /* Full-width input fields */
            .form-container input[type=text],
            input.resetplace,select {
                width: 46vh;
                padding: 7px;
                margin: 14px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }
            /* When the inputs get focus, do something */
            .form-container input[type=text]:focus {
                background-color: #ddd;
                outline: none;
            }
            /* Set a style for the submit/login button */
            .form-container .btn {
                background-color: #000000;
                /* font-family: "Nunito Sans", sans-serif; */
                
                color: white;
                padding: 17px 20px;
                border: none;
                cursor: pointer;
                width: 111%;
                font-family: 'Fjalla One', sans-serif;
                text-transform: uppercase;
                margin-bottom: 10px;
                text-align: center;
                opacity: 0.8;
            }
        }
        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: rgb(0, 0, 0);
        }
        /* Add some hover effects to buttons */
        .form-container .btn:hover {
            opacity: 1;
        }
        .btn {
            cursor: pointer;
            outline: 0;
            color: #AAA;
        }
        .btn:focus {
            outline: none;
        }
        .green {
            color: green;
        }
        .red {
            color: red;
        }
        #likeform {
            position: absolute;
        }
        .fa-lg {
            font-size: 1.33333333em;
            line-height: .75em;
            vertical-align: -15%;
            scale: 2;
        }
        .fa {
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            font-size: 14px;
            line-height: 1;
            font-size: inherit;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            padding: 12px;
            padding-top: 12px;
            padding-top: 12px;
        }
        
        #green,#red{
        
        color: white;
        }
            </style>
        </head>

        <body>
            <header>
                <p id="error" class="Header-buttons">
                    M<span>o</span><span>vi</span><span>e</span> Mas<span>al</span>a
                </p>
                <button class="Header-buttons"><a href="Logout">Logout</a></button>
                <button class="Header-buttons"><a href="MyReviews">My Reviews</a></button>
                <button class="Header-buttons" onclick="openResetform()">Reset Password</button>
                <button class="Header-buttons" onclick="openRecommend()">Recommendations</button>
                <button class="Header-buttons"><a href="Home">Home</a></button> 

            </header>




            <div id="showReviews">
                <c:if test="${not empty myreviews}">
                    <button type="button" onclick="closemyreview()" id="cross2">
            X
          </button>
                    <c:forEach var="MR" items="${myreviews}">
                        <div class="reviewtab">
                            <b>${MR.filmname}</b><br> Review :${MR.detailreview}
                            <form action="dltReview"><input name="reviewid" value="${MR.reviewid }" hidden><button type="submit" id="dltbutt">Delete</button></form>
                        </div>
                        <script type="text/javascript">
                            function closemyreview() {
                                document.getElementById("showReviews").style.display = "none";

                            }
                        </script>


                    </c:forEach>
                </c:if>
            </div>
            <section class="Search-bar">
                <div id="searchbar">
                    <form action="MemberSearch" id="searchform">
                        <label for="search">You Can Enter Language, Movie Name, Actor Name, Actress<br />
            Name,etc. </label
          ><br />
          <input
            type="search"
            name="search"
            id="searchbar1"
            placeholder="Enter Anything Mentioned Above"
          />
          <button type="submit" id="search-button" >Search </button>
        </form>
        <section class="searchres" id="searchres" onload="pushdown()">
        <script src="https://use.fontawesome.com/fe459689b4.js"></script>
        
        <c:if test="${not empty searchresult}">
      <c:forEach var="S" items="${searchresult}" >
      
       <form action="Likedislike" id="likeform">
         <input value="${S.filmid}" name="filmid" hidden>
         <input value="${S.filmname}" name="filmname" hidden>
       	 <input value="${userid}" name="userid"  hidden>
       	  
        <button class="btn" id="green"  type="submit" value="1" name="stat"><i class="fa fa-thumbs-up fa-lg" aria-hidden="true" ></i></button>
  		<button class="btn" id="red"  type="submit" value="0" name="stat"><i class="fa fa-thumbs-down fa-lg" aria-hidden="true"></i></button>
      
        </form>
      <c:set var="idd" value="${S.filmid }"/>
        <%
        
String id = (String)pageContext.getAttribute("idd");;
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "imdbdb";
String userId = "root";
String password = "Riyaz@786";

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try{ 
	
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT SUM(conclusion) FROM likedislike WHERE filmid='"+id+"';";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<p id="likes" style="position: absolute;left: 15vh; position: absolute;
left: 15vh;
background: black;
padding: 5px;">Likes:<%=resultSet.getString("SUM(CONCLUSION)") %></p>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
       <div class="card1" style="background-image:url('posters/${S.filmid}.jpg');" onmouseenter="pushdown()"><button type="button"  onclick="closesearch()" id="cross">
            X
            
          </button>
         
          
          <b>${S.filmname}</b>
          Genre :${S.category}<br>
          
         <p> Directed By: ${S.director}</p>
         <p> Music By: ${S.music}</p>
         <p> Released On: ${S.relyear}</p>
         <p> Description: ${S.description}</p>  
         <p> Country: ${S.country}</p>
         <p> Languages Available in: ${S.language}</p>
         <p> Certificate: ${S.certificate}</p> 
         <p> Actor: ${S.actor}</p> 
         <p> Actress: ${S.actress}</p>
         <p> Released on: ${S.platform}</p>  
         <p> Description: ${S.description}</p>
         <p> Estimated Budget: ${S.budget}</p>
         <p> Global Collection: ${S.collection}</p>
          <div class="card" id="videoyt"><iframe width="100%" height="100%" src="${S.youtubetraillink}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
          
          <form action="CreateReview" method="post" id="createview" style="text-align: center;">
          <input type="textarea" placeholder="Enter Your Review About Movie." name="detailreview"><br>
          <input  value="${userid}"  name="userid" hidden>
          
          <input  value="${S.filmid}"  name="filmid" hidden>
          <input  value="${S.filmname}"  name="filmname" hidden>
          <input name="date" id="date" hidden>
          <input  name="reviewid" id="reviewid" hidden >
          <input type="submit" value="Submit">
          </form>
          
         <div>
         <form action="ShowReviews" >
         <input value="${S.filmname}" name="filmname" hidden>
         <button type="submit" id="dltbutt" style="background: black;"> Show all reviews</button>
         </form>
       <div id="RR">
          <c:if test="${not empty seereviews}">
         <c:forEach var="R" items="${seereviews}">
         <b>${R.userid}</b><br>
          <p>${R.detailreview}</p>
         </c:forEach>
         <c:otherwise>
         No Reviews Yet.
         </c:otherwise>
         </c:if>
         
          
         </div>
         </div>
         </div>
     
     
     
        </c:forEach>
        
        <input id="green&red" name="stat" value="${stat}" style="position:absolute;  left:100px" hidden>
        
        <script type="text/javascript">
      
        	function pushdown(){
            	
            	
            	document.getElementById("animatedgrid").style.filter="blur(2px)";
            	
        	}
        	
        function closesearch(){
        	document.getElementById("searchres").style.display="none";
        	document.getElementById("animatedgrid").style.filter="none";
        }
        
        var btn1 = document.querySelector('#green');
        var btn2 = document.querySelector('#red');

        btn1.addEventListener('click', function() {
          
            if (btn2.classList.contains('red')) {
              btn2.classList.remove('red');
            } 
          this.classList.toggle('green');
          
        });

        btn2.addEventListener('click', function() {
          
            if (btn1.classList.contains('green')) {
              btn1.classList.remove('green');
            } 
          this.classList.toggle('red');
          
        });
        
        var a = document.getElementById("green&red").value;
        console.log(a)
                if(a==1)
                	  {
                        
                        document.getElementById("green").style.color="green";
                	}
                	 if(a==0)
                	{
                		 document.getElementById("red").style.color="red";
                	}
        
        
        
        </script>
       </c:if>
        <div>
        
        <div class="form-popup1" id="myForm1">
                        <form name="frm" action="ResetPass" class="form-container" enctype="multipart/form-data" method="post" onsubmit="return verifypassword()">
                            <button type="button" class="btn cancel" onclick="closeResetform()" id="cross3">
            X
          </button>
                            <h1>Enter Required Details</h1>

                            <label for="oldpass">Old Password</label>
                        <input type="text" placeholder="Enter Old Password" name="oldpass" class="resetplace" />
                        <label for="oldpass">New Password</label>
                        <input type="text" placeholder="Creat New Password" name="newpass" id="pswd" class="resetplace" />
                        <label for="oldpass">Confirm Password</label>
                        <input type="text" placeholder="Confirm Password" id="cnfpswd" class="resetplace" />
                        <input value="${userid}" name="userid" hidden />
                        <input value="${userid}" name="userid1" hidden />
                        <button type="submit" class="btn">Reset</button>
                    </form>
                </div>
                </div>
                
                 <div>
        
        <div class="form-popup2" id="myForm2" style="position: absolute;left: -9vw;">
                      
                      
						<%
                   ArrayList<AdminOperations> films = (ArrayList) request.getAttribute("films");
                   %>
                  
                   <h2 style="z-index: 1;position: relative;text-shadow: none;left: 18vw;top: -32vh;/*! font-size: inherit; */">Recommended Movies for ${userid}</h2>
                        <form name="frm" autocomplete="off" method="post" action="userrecommendfilmlist" onsubmit="return verify()" class="form-container1" >
                            
                            <button type="button" class="btn cancel" onclick="closeRecommend()" id="cross3">
            X
          </button>
                  <p style="position: relative;left: -16vw;top: 23vh;display: block ruby;font-size: larger;"> Select Category: </p><select name="category" style="position: absolute;top: 32vh;left: 5vw;">
 							<option value="Category">Category</option>
                          	<%
                          	ArrayList<String> lst = new ArrayList<String>();
                          	for(int i=0;films.size()>i;i++)
                          	{
                          		if(lst.contains(films.get(i).getCategory()))
                          		{
                          			
                          		}
                          		else
                          		{
                          			lst.add(films.get(i).getCategory());
                          		%><option value="<%=films.get(i).getCategory()%>"><%=films.get(i).getCategory()%></option><%
                          		}
                          	}
                          	%>
</select>
<br><br>
<br>
<br>


<input style="margintop:20px" type="submit" value="Search" id="rr"  >
</form>
<style>
#rr{
all:unset;  position: relative; top: 27vh; left: -8vw; background: black; padding-left: 30px; padding-right: 30px; padding-top: 10px; padding-bottom: 10px;
}
</style>
<script language="Javascript" type="text/javascript">


					function verify() {
	 						if (document.frm.category.value != "Category") {
		
		 						return true;
										}
										 else{
		
										 alert("Please Select Anything...");
									return false;
										}
												}

						</script>


          

                    
                </div>
                </div>
            </section>
            </div><br>
            </section>
            <section class="animated-grid" id="animatedgrid">
                <c:if test="${not empty poster}">
                    <c:forEach var="F" items="${poster}">
                        <div class="card" style="background-image:url('posters/${F.filmid}.jpg');">${F.filmname}</div>


                    </c:forEach>
                </c:if>
                <div class="card" id="videoyt"><iframe width="100%" height="100%" src="https://www.youtube.com/embed/zSWdZVtXT7E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
            </section>
<%} else { response.sendRedirect("Failure"); } %>
        </body>

        </html>