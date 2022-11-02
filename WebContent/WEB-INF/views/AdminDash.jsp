<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="ISO-8859-1" />
            <link rel="preconnect" href="https://fonts.gstatic.com" />
            <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,wght@0,300;0,400;0,600;0,900;1,200;1,900&family=Staatliches&display=swap" rel="stylesheet" />

            <title>Admin Panel | ${userid}</title>

            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js?ver=1.4.2"></script>

            <script type="text/javascript">
                function logout() {
                    alert(
                        "You Will Be Logged Out And Redirected To Homepage, Press Okay To Confirm ."
                    );
                }

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

                window.onload = function() {
                    document.getElementById("filmid").value = makeid(5);
                };

                function logout() {
                    alert(
                        "You Will Be Logged Out And Redirected To Homepage, Press Okay To Confirm ."
                    );
                }
            </script>

            <style type="text/css">
            @import url('https://fonts.googleapis.com/css?family=Fjalla+One');
                body {
                    background-color: #000000;
                    font-family: 'Fjalla One', sans-serif;
                    text-transform: uppercase;
                    margin: 0;
                    padding: 0;
                }
                
                .slicee {
                    height: 80vh;
                    display: -webkit-box;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-pack: center;
                    -ms-flex-pack: center;
                    justify-content: center;
                    -webkit-box-align: center;
                    -ms-flex-align: center;
                    align-items: center;
                }
                /*--Button Styles--*/
                
                .btn-slice {
                    padding: 1.2rem 2.5rem;
                    border: 2px solid #ffffff;
                    border-radius: 0rem;
                    color: #ffffff;
                    font-size: 11px;
                    font-weight: 400;
                    letter-spacing: 0.3rem;
                    position: relative;
                    -webkit-transition: all 1000ms cubic-bezier(0.890, 0, 0.140, 1);
                    /* older webkit */
                    -webkit-transition: all 1000ms cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    -moz-transition: all 1000ms cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    -o-transition: all 1000ms cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    transition: all 1000ms cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    /* custom */
                    -webkit-transition-timing-function: cubic-bezier(0.890, 0, 0.140, 1);
                    /* older webkit */
                    -webkit-transition-timing-function: cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    -moz-transition-timing-function: cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    -o-transition-timing-function: cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    transition-timing-function: cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    /* custom */
                }
                
                .btn-slice .top {
                    position: relative;
                    height: 12px;
                    overflow: hidden;
                    top: 0;
                    -webkit-transition: all 300ms cubic-bezier(1.000, 0, 0.025, 1);
                    /* older webkit */
                    -webkit-transition: all 300ms cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    -moz-transition: all 300ms cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    -o-transition: all 300ms cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    transition: all 300ms cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    /* custom */
                    -webkit-transition-timing-function: cubic-bezier(1.000, 0, 0.025, 1);
                    /* older webkit */
                    -webkit-transition-timing-function: cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    -moz-transition-timing-function: cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    -o-transition-timing-function: cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    transition-timing-function: cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    /* custom */
                    -webkit-transition-delay: 0.35s;
                    -moz-transition-delay: : 0.35s;
                    -ms-transition-delay: : 0.35s;
                    -o-transition-delay: : 0.35s;
                    transition-delay: : 0.35s;
                }
                
                .btn-slice .bottom {
                    position: relative;
                    height: 12px;
                    overflow: hidden;
                    bottom: 0;
                    -webkit-transition: all 300ms cubic-bezier(1.000, 0, 0.025, 1);
                    /* older webkit */
                    -webkit-transition: all 300ms cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    -moz-transition: all 300ms cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    -o-transition: all 300ms cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    transition: all 300ms cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    /* custom */
                    -webkit-transition-timing-function: cubic-bezier(1.000, 0, 0.025, 1);
                    /* older webkit */
                    -webkit-transition-timing-function: cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    -moz-transition-timing-function: cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    -o-transition-timing-function: cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    transition-timing-function: cubic-bezier(1.000, -0.055, 0.025, 1.040);
                    /* custom */
                    -webkit-transition-delay: 0.35s;
                    -moz-transition-delay: : 0.35s;
                    -ms-transition-delay: : 0.35s;
                    -o-transition-delay: : 0.35s;
                    transition-delay: : 0.35s;
                }
                
                .btn-slice .bottom span {
                    top: 1px;
                    position: absolute;
                    left: 0;
                }
                
                .btn-slice:hover .top {
                    top: -5px;
                    -webkit-transition-delay: 0.35s;
                    -moz-transition-delay: : 0.35s;
                    -ms-transition-delay: : 0.35s;
                    -o-transition-delay: : 0.35s;
                    transition-delay: : 0.35s;
                }
                
                .btn-slice:hover .bottom {
                    bottom: -5px;
                    -webkit-transition-delay: 0.35s;
                    -moz-transition-delay: : 0.35s;
                    -ms-transition-delay: : 0.35s;
                    -o-transition-delay: : 0.35s;
                    transition-delay: : 0.35s;
                }
                
                .btn-slice:hover,
                .btn-slice:focus,
                .btn-slice:active {
                    margin-left: 10px;
                }
                
                .btn-slice:before {
                    content: '';
                    height: 1px;
                    width: 60px;
                    background-color: #ffffff;
                    position: absolute;
                    margin-top: 6px;
                    right: -35px;
                    -webkit-transition: all 1000ms cubic-bezier(0.890, 0, 0.140, 1);
                    /* older webkit */
                    -webkit-transition: all 1000ms cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    -moz-transition: all 1000ms cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    -o-transition: all 1000ms cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    transition: all 1000ms cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    /* custom */
                    -webkit-transition-timing-function: cubic-bezier(0.890, 0, 0.140, 1);
                    /* older webkit */
                    -webkit-transition-timing-function: cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    -moz-transition-timing-function: cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    -o-transition-timing-function: cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    transition-timing-function: cubic-bezier(0.890, -0.170, 0.140, 1.225);
                    /* custom */
                }
                
                .btn-slice:hover:before {
                    width: 130%;
                }
                
                #but {
                    all: unset;
                    background-color: grey;
                    border-block-width: 0;
                    padding: 19px;
                    color: white;
                    font-weight: 100;
                }
                
                a {
                    text-decoration: none;
                    color: white;
                }
                
                #but:hover {
                    background-color: #80808080;
                }
                
                .toptext {
                    margin: 4px;
                    padding: 4px;
                    margin-bottom: 3px;
                    /* margin-top: -73px; */
                    font-size: 12px;
                }
                /* The popup form - hidden by default */
                
                .form-popup,
                .form-popup1 {
                    display: none;
                    position: absolute;
                    padding-bottom: 84px;
                    bottom: -173vh;
                    right: 68vh;
                    border: 0px solid #f1f1f1;
                    z-index: 9;
                }
                /* Add styles to the form container */
                
                .form-container {
                    max-width: 300px;
                    font-family: "Nunito Sans", sans-serif;
                    padding: 44px;
                    padding-right: 77px;
                    padding-top: 10px;
                    background-color: #808080d6;
                    backdrop-filter: blur(1px);
                    color: white;
                    font-size: smaller;
                    /* font-style: normal; */
                    font-weight: 100;
                }
                /* Full-width input fields */
                
                .form-container input[type=text],
                .form-container input[type=date],
                .form-container input[type=file],
                select {
                    width: 100%;
                    padding: 15px;
                    margin: 5px 0 22px 0;
                    border: none;
                    background: #f1f1f1;
                }
                
                .form-container input[type=file] {
                    color: black;
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
            #cross {
                all: unset;
                padding: 5px;
                padding-left: 7px;
                padding-right: 7px;
                margin: -16px;
                background-color: black;
                text-align: center;
                font-size: large;
                /* left: 45px; */
                /* right: 23px; */
                
                margin-left: 352px;
                margin-bottom: -10px;
            }
            form {
                font-family: 'Fjalla One', sans-serif;
            }
            .form-popup1 {
                bottom: 15vh;
            }
            #searchresult {
                all: initial;
                color: white;
                text-align: center;
                /* bottom: 23vh; */
                /* margin-bottom: 38vh; */
                
                font-family: monospace;
            }
            #contain-data {
                max-width: 300px;
                font-family: 'Nunito Sans', sans-serif;
                background-color: #8080807d;
                backdrop-filter: blur(1px);
                /* left: 21vw; */
                
                padding-top: 0;
                padding-left: 38vw;
                padding-right: 39vw;
            }
            .search {
                padding: 10px;
    margin: 5px;
    font-size: large;
    border: black;
    border-radius: 9px;
    background-color: black;
    color: white;
            }
            
            #poster{
            height: 60vh;
            
            }
            
            #view{
           all: unset;
    background-color: black;
    padding: 12px;
    border-radius: 9px;
            
            }
            
            #view:hover {
	background-color: #00000085;
	}
}
            </style>
        </head>
        <% if(session.getAttribute("userid") != null) { %>

            <body>
                <header>
                    <button href="Logout" id="but" onclick="logout()">
        <a href="Logout">Logout</a>
      </button>
                </header>

                <section class="slicee" id="slice">
                    <div class="btn-slice open-button" onclick="openForm()">
                        <div class="top">
                            <span class="toptext">add film</span>
                        </div>
                        <div class="bottom"><span>add film</span></div>
                    </div>
                    <div class="form-popup" id="myForm">
                        <form action="AddFilm" class="form-container" enctype="multipart/form-data" method="post">
                            <button type="button" class="btn cancel" onclick="closeForm()" id="cross">
            X
          </button>
                            <h1>Add Film </h1>

                            <label for="filmid"><b>filmid</b></label>
                            <input type="text" placeholder="Enter filmid" name="filmid" id="filmid" readonly />

                            <label for="filmname"><b>filmname</b></label>
                            <input type="text" placeholder="Enter filmname" name="filmname" required  />

                            <label for="language"><b>Language</b></label>
                            <select name="language" required>
            <option selected>Select Language</option>
            <option value="English">English</option>
            <option value="English/Hindi">English/Hindi</option>
            <option value="Hindi/Marathi">Hindi/Marathi</option>
            <option value="Marathi">Marathi</option>
            <option value="Hindi">Hindi</option>
          </select>

                            <label for="country"><b>Country</b></label>
                            <input type="text" placeholder="Enter country" name="country" required />

                            <label for="category"><b>Category</b></label>
                            <select name="category" required>
            <option selected>Select Category</option>
            <option value="Action">Action</option>
            <option value="Romance">Romance</option>
            <option value="Horror">Horror</option>
            <option value="Sci-Fi">Sci-Fi</option>
            <option value="Comedy">Comedy</option>
            <option value="Family">Family</option>
            <option value="Drama">Drama</option>
            <option value="Suspense/Thriller">Suspense/Thriller</option>
          </select>

                            <label for="certificate"><b>Certificate</b></label>
                            <select name="certificate" required>
            <option>Select Grade</option>
            <option value="13+">13+</option>
            <option value="16+">16+</option>
            <option value="18+">18+</option>
            <option value="All">All</option>
          </select>

                            <label for="director"><b>Director</b></label>
                            <input type="text" placeholder="Enter director" name="director" required />

                            <label for="actor"><b>Actor</b></label>
                            <input type="text" placeholder="Enter actor" name="actor" required />

                            <label for="actress"><b>Actress</b></label>
                            <input type="text" placeholder="Enter actress" name="actress" required />

                            <label for="music"><b>Music By</b></label>
                            <input type="text" placeholder="Enter music" name="music" required />

                            <label for="platform"><b>Platform</b></label>
                            <select name="platform" required>
            <option selected>Select Platform</option>
            <option value="Netflix">Netflix</option>
            <option value="Amazon Prime">Amazon Prime</option>
            <option value="HotStar">HotStar</option>
            <option value="Youtube">Youtube</option>
            <option value="Cinema">Cinema</option>
          </select>

                            <label for="budget"><b>Budget</b></label>
                            <input type="text" placeholder="Enter budget" name="budget" required />

                            <label for="collection"><b>Box-Office Collection</b></label>
                            <input type="text" placeholder="Enter collection" name="collection" required />

                            <label for="youtubetraillink"><b>Trailer Link</b></label>
                            <input type="text" placeholder="Enter Link" name="youtubetraillink" required />

                            <label for="relyear"><b>Release Year</b></label>
                            <input type="date" placeholder="Enter relyear" name="relyear" required />
							
							<label for="relyear"><b>Description </b></label>
                            <input type="text" placeholder="Enter relyear" name="description" required />
								
                            <label for="relyear"><b>Poster</b></label>
                            <input type="file" name="file" required />

                            <button type="submit" class="btn">Add</button>
                        </form>
                    </div>

                    <br />

                    <a class="btn-slice open-button" onclick="openForm2()">
                        <div class="top"><span class="toptext">Modify film </span></div>
                        <div class="bottom"><span>Modify film </span></div>
                    </a><br />
                    <div class="form-popup" id="myForm2">
                        <form action="ModifyFilm" class="form-container" enctype="multipart/form-data" method="post">
                            <button type="button" class="btn cancel" onclick="closeForm2()" id="cross">
            X
          </button>
                            <h1>Modify Film | ${added}</h1>

                            <label for="filmid"><b>filmid</b></label>
                            <input type="text" placeholder="Enter filmid" name="filmid" id="filmid1" />

                            <label for="filmname"><b>filmname</b></label>
                            <input type="text" placeholder="Enter filmname" name="filmname" />

                            <label for="language"><b>Language</b></label>
                            <select name="language">
            <option selected>Select Language</option>
            <option value="English">English</option>
            <option value="English/Hindi">English/Hindi</option>
            <option value="Hindi/Marathi">Hindi/Marathi</option>
            <option value="Marathi">Marathi</option>
            <option value="Hindi">Hindi</option>
          </select>

                            <label for="country"><b>Country</b></label>
                            <input type="text" placeholder="Enter country" name="country" />

                            <label for="category"><b>Category</b></label>
                            <select name="category">
            <option selected>Select Category</option>
            <option value="Action">Action</option>
            <option value="Romance">Romance</option>
            <option value="Horror">Horror</option>
            <option value="Sci-Fi">Sci-Fi</option>
            <option value="Comedy">Comedy</option>
            <option value="Family">Family</option>
            <option value="Drama">Drama</option>
            <option value="Suspense/Thriller">Suspense/Thriller</option>
          </select>

                            <label for="certificate"><b>Certificate</b></label>
                            <select name="certificate">
            <option>Select Grade</option>
            <option value="13+">13+</option>
            <option value="16+">16+</option>
            <option value="18+">18+</option>
            <option value="All">All</option>
          </select>

                            <label for="director"><b>Director</b></label>
                            <input type="text" placeholder="Enter director" name="director" />

                            <label for="actor"><b>Actor</b></label>
                            <input type="text" placeholder="Enter actor" name="actor" />

                            <label for="actress"><b>Actress</b></label>
                            <input type="text" placeholder="Enter actress" name="actress" />

                            <label for="music"><b>Music By</b></label>
                            <input type="text" placeholder="Enter music" name="music" />

                            <label for="platform"><b>Platform</b></label>
                            <select name="platform">
            <option selected>Select Platform</option>
            <option value="Netflix">Netflix</option>
            <option value="Amazon Prime">Amazon Prime</option>
            <option value="HotStar">HotStar</option>
            <option value="Youtube">Youtube</option>
            <option value="Cinema">Cinema</option>
          </select>

                            <label for="budget"><b>Budget</b></label>
                            <input type="text" placeholder="Enter budget" name="budget" />

                            <label for="collection"><b>Box-Office Collection</b></label>
                            <input type="text" placeholder="Enter collection" name="collection" />

                            <label for="youtubetraillink"><b>Trailer Link</b></label>
                            <input type="text" placeholder="Enter Link" name="youtubetraillink" />

                            <label for="relyear"><b>Release Year</b></label>
                            <input type="date" placeholder="Enter relyear" name="relyear" />

                            <label for="relyear"><b>Poster</b></label>
                            <input type="file" name="file" />

                            <button type="submit" class="btn">Update</button>
                        </form>
                    </div>

                    <a class="btn-slice open-button" onclick="openForm3()">
                        <div class="top"><span class="toptext">Search</span></div>
                        <div class="bottom"><span>Search</span></div>
                    </a><br />
                    <div class="form-popup1" id="myForm3">
                        <form action="SearchFilm" class="form-container" enctype="multipart/form-data" method="post" onsubmit="dlt()">
                            <button type="button" class="btn cancel" onclick="closeForm3()" id="cross">
            X
          </button>
                            <h1>Show Film </h1>

                            <label for="filmid"><h3>Enter Name of Film</h3></label>
                            <input type="text" placeholder="Enter Filmname" name="filmname" id="filmid" />
                            <input value="dlted" id="dlt" name="dlt" hidden />
                            <button type="submit" class="btn" onclick="Odata()">SHOW</button>
                        </form>

                    </div>

                    <a class="btn-slice open-button" onclick="openForm1()">
                        <div class="top"><span class="toptext">Delete Film</span></div>
                        <div class="bottom"><span>Delete Film</span></div>
                    </a>

                    <div class="form-popup1" id="myForm1">
                        <form action="DltFilm" class="form-container" enctype="multipart/form-data" method="post" onsubmit="dlt()">
                            <button type="button" class="btn cancel" onclick="closeForm1()" id="cross">
            X
          </button>
                            <h1>Delete Film</h1>

                            <label for="filmid"><h3>Enter Filmid of Film to Delete.</h3></label>
                            <input type="text" placeholder="Enter filmid" name="filmid" id="filmid" />
                            <input value="dlted" id="dlt" name="dlt" hidden />
                            <button type="submit" class="btn">Delete</button>
                        </form>
                    </div>


                    </div>
                    <script>
                        function openForm() {
                            document.getElementById("myForm").style.display = "block";
                        }

                        function closeForm() {
                            document.getElementById("myForm").style.display = "none";
                        }

                        function openForm1() {
                            document.getElementById("myForm1").style.display = "block";
                        }

                        function closeForm1() {
                            document.getElementById("myForm1").style.display = "none";
                        }

                        function openForm2() {
                            document.getElementById("myForm2").style.display = "block";
                        }

                        function closeForm2() {
                            document.getElementById("myForm2").style.display = "none";
                        }

                        function openForm3() {
                            document.getElementById("myForm3").style.display = "block";
                        }

                        function closeForm3() {
                            document.getElementById("myForm3").style.display = "none";
                        }
                    </script>
                </section>
                <div id="searchresult">


                    <div id="data">
                        <div id="contain-data">
                            <button type="button" class="btn cancel" onclick="Cdata()" id="cross">
            X
          </button>
                            <c:if test="${not empty list}">

                                <h2>Information About Movie.</h2>

                                <c:forEach var="F" items="${list}">
									<p> <label for="id">Filmname :</label></p>
                                     <input type="text" class="search" value="${F.filmname}" name="id" readonly>                                   
									<p> <label for="id">Filmid :</label></p>
                                     <input type="text" class="search" value="${F.filmid}" name="id" readonly>
                                    <p> <label for="">Languages :</label></p>
                                    <input type="text" class="search" value="${F.language}" readonly>
                                    <p> <label for="">Country :</label></p>
                                    <input type="text" class="search" value="${F.country}" readonly>
                                    <p> <label for="">Category :</label></p>
                                    <input type="text" class="search" value="${F.category}" readonly>
                                    <p> <label for="">Certificate :</label></p>
                                    <input type="text" class="search" value="${F.certificate}" readonly>
                                    <p> <label for="">Directed By :</label></p>
                                    <input type="text" class="search" value="${F.director}" readonly>
                                    <p> <label for="">Actor Names :</label></p>
                                    <input type="text" class="search" value="${F.actor}" readonly>
                                    <p> <label for="">Actress Names :</label></p>
                                    <input type="text" class="search" value="${F.music}" readonly>

                                    <p> <label for="">Released On :</label></p>
                                    <input type="text" class="search" value="${F.platform}" readonly>
                                    <p> <label for="">Budget :</label></p>
                                    <input type="text" class="search" value="${F.budget}" readonly>
                                    <p> <label for=""> Box-Office Collection:</label></p>
                                    <input type="text" class="search" value="${F.collection}" readonly>
                                    <p> <label for="">Description  :</label></p>
                                     <input type="text" class="search" value="${F.description}" readonly>
                                    <p> <label for="">Trailer Link :</label></p>
                                    <input type="text" class="search" value="${F.youtubetraillink}" readonly><form action="${F.youtubetraillink}" target="blank" ><Button type="submit" id="view">View Trailer</Button></form>
                                    <p> <label for="">Release Year :</label></p>
                                    <input type="text" class="search" value="${F.relyear}" readonly>
                                    <p> <label for="">Poster :</label></p>
                                    
									<img alt="poster" src="posters/${F.filmid}.jpg" id="poster">
									<a href="posters/${F.filmid}.jpg" target="blank">Poster Link</a>




                                </c:forEach>


                            </c:if>
                            <c:if test="${empty list }">
                           You Can Also Search Movie By Name...
                            </c:if>
                        </div>
                    </div>


                </div>

                <script type="text/javascript">
                    function Odata() {
                        document.getElementById("data").style.display = "block";


                    }

                    function Cdata() {
                        document.getElementById("data").style.display = "none";

                    }
                </script>

            </body>
            <%} else { response.sendRedirect("Failure"); } %>

        </html>