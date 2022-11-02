<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,wght@0,300;0,400;0,600;0,900;1,200;1,900&family=Staatliches&display=swap" rel="stylesheet" />

<head>
    <meta charset="ISO-8859-1" />
    <title>Sign-In</title>
    <style>
        
        * {
            box-sizing: border-box;
            font-family: "Nunito Sans", sans-serif;
        }
        
        html,
        body {
            margin: 0;
            background-image: url("assets/bg1.jpg");
            height: 100vh;
            width: 100vw;
            background-size: cover;
            background-position: center;
        }
        
        .full-screen-container {
            
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-container {
            background-color: hsl(0deg 0% 0% / 44%);
            padding: 50px 30px;
            min-width: 400px;
            width: 50%;
            max-width: 600px;
        }
        
        .login-title {
            color: #fff;
            text-align: center;
            margin: 0;
            margin-bottom: 40px;
            font-size: 2.5em;
            font-weight: normal;
        }
        
        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }
        
        .input-group label {
            color: #fff;
            font-weight: lighter;
            font-size: 1.5em;
            margin-bottom: 7px;
        }
        
        .input-group input {
            font-size: 1.5em;
            padding: 0.1em 0.25em;
            background-color: hsla(201, 100%, 91%, 0.3);
            border: 1px solid hsl(201, 100%, 6%);
            outline: none;
            border-radius: 5px;
            color: #fff;
            font-weight: lighter;
        }
        
        .input-group input:focus {
            border: 1px solid hsl(201, 100%, 50%);
        }
        
        .login-button {
            padding: 10px 30px;
            width: 100%;
            border-radius: 5px;
            background: hsla(201, 100%, 50%, 0.1);
            border: 1px solid hsl(201, 100%, 50%);
            outline: none;
            font-size: 1.5em;
            color: #fff;
            font-weight: lighter;
            margin-top: 20px;
            cursor: pointer;
        }
        
        .login-button:hover {
            background-color: hsla(201, 100%, 50%, 0.3);
        }
        
        .login-button:focus {
            background-color: hsla(201, 100%, 50%, 0.5);
        }
        
      input.placeholder{
        color: black;
    background-color: #ffffffc7;
        
        }
        
        #home, #link{
        text-decoration: none;
        color: white;
        padding:2px;
        margin-top: 3vh;
        }
        button {
            background-color: #244651;
            color: #244651;
            border: none;
            padding: 10px 20px;
            font-size: 17px;
            font-family: Raleway;
            cursor: pointer;
        }
        
        button:hover {
            opacity: 0.8;
        }
        
    </style>
</head>

<body>
<header>
    <button><a href="/Moviemasala" id="home">Home</a></button>
    </header>
    <div class="full-screen-container">
    
        <div class="login-container">
            <h3 class="login-title">Welcome</h3>
            <form action="Signin" method="post">
                <div class="input-group">
                    <label>UserID</label>
                    <input type="text" name="userid" placeholder="Enter User-ID" class="placeholder" />
                </div>
                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="pswd" placeholder="Enter Password" class="placeholder" />
                </div>
                <button type="submit" class="login-button" name="Success">Sign In</button>
            </form><br>
            <div><a href="ForgotPass" id="link">Forgot Password?</a></div>
        </div>
    </div>
</body>

</html>