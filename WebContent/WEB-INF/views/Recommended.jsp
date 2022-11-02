<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${userid}'s Movies</title>
<Style>

@import url('https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,wght@0,200;0,300;0,400;0,700;0,800;0,900;1,200&display=swap');

*{
font-family: 'Nunito Sans', sans-serif;
margin: 0;
padding: 0;


}

body{
background-color: black;
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
    margin: 10px;
}

.recc
{

height: 100%;
margin-bottom: 200px;
width: 99%;
--stagger-delay: 100ms;
position: absolute;
top: 12vh;
filter: none;
z-index: 1;
}

.info{
   display: block;
background-color: #000000b8;
padding: 37px;
margin-bottom: 11vh;



}

#butt{
background-color: #80808073;
color: white;
padding: 13px;
border: solid white 1px;
margin: 2px;
}

#butt:hover{
background-color: black;

}
a{
text-decoration: none;
color: white;
}

</style>

</head>

<body>
<header>
<button class="Header-buttons" id="butt"><a href="Home">Home</a></button>
</header>
<h1 style="text-align: center; color:white;">Movie Recomendations For ${userid }</h1>
<div class="recc">
          <c:if test="${not empty films1 }">
          <c:forEach var="S" items="${films1 }">
           <div class="card1" style="background-image:url('posters/${S.filmid}.jpg');" id="">
         <div class="info">
          <b>${S.filmname}</b><br>
          Genre :${S.category}
          
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
        
        </div> 
        </div>
          </c:forEach>
          </c:if>
          </div>                  
</body>
</html>