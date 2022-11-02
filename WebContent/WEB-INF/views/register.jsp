<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <html>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />

    <script type="text/javascript">
    
    
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

    <style>
        * {
            box-sizing: border-box;
            font-family: Raleway;
        }
        
        body {
            background-image: url("assets/bg1.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            align-content: center center;
        }
        
        #regForm {
            background-color: #0000005e;
            color: white;
            margin: 100px auto;
            font-family: Raleway;
            padding: 40px;
            width: 70%;
            min-width: 300px;
        }
        
        h1 {
            text-align: center;
        }
        
        input {
            padding: 10px;
            width: 100%;
            font-size: 17px;
            font-family: Raleway;
            border: 1px solid #aaaaaa;
        }
        
        select {
            padding: 10px;
            width: 100%;
            font-size: 17px;
            font-family: Raleway;
            border: 1px solid #aaaaaa;
        }
        /* Mark input boxes that gets an error on validation: */
        
        input.invalid {
            background-color: #ffdddd;
        }
        /* Hide all steps by default: */
        
        .tab {
            display: none;
        }
        
        button {
            background-color: #04aa6d;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 17px;
            font-family: Raleway;
            cursor: pointer;
        }
        
        button:hover {
            opacity: 0.8;
        }
        
        #prevBtn {
            background-color: #bbbbbb;
        }
        /* Make circles that indicate the steps of the form: */
        
        .step {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbbbbb;
            border: none;
            border-radius: 50%;
            display: inline-block;
            opacity: 0.5;
        }
        
        .step.active {
            opacity: 1;
        }
        /* Mark the steps that are finished and valid: */
        
        .step.finish {
            background-color: #04aa6d;
        }
        
        #home {
            text-decoration: none;
            color: white;
            font-size: medium;
        }
    </style>

    <body>
        <header>
            <button><a href="/Moviemasala" id="home">Home</a></button>
        </header>
        <form id="regForm" action="AddAcc" onsubmit="">
            <h1>Register</h1>
            <!-- One "tab" for each step in the form: -->
             <input type="text"  id="D" name="joindt" hidden />
            <div class="tab">
                Name:
                <p>
                    <input placeholder="Enter name..." oninput="this.className = ''" name="name" required="required" />
                </p>
                Userid:
                <p>
                    <input placeholder="Create Userid..." oninput="this.className = ''" name="userid" required="required" />
                </p>
            </div>
            <div class="tab">
                Contact Info:
                <p>
                    <input placeholder="E-mail..." oninput="this.className = ''" name="email" required="required" />
                </p>
                <p>
                    <input placeholder="Phone..." oninput="this.className = ''" name="mobileno" required="required" />
                </p>
            </div>
            <div class="tab">
                Birthday:
                <p>
                    <input type="date" placeholder="dd" oninput="this.className = ''" name="dob" required="required" />
                </p>

                <p>
                    <select name="gender" oninput="this.className = ''" required="required">
            <option selected>Specify Gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
          </select>
                </p>
            </div>
            <div class="tab">
                Login Info:
                <p>
                    <select name="secquestion" oninput="this.className = ''" required="required">
            <option selected>Choose Question</option>
            <option value="Childhood Nickname?">Childhood Nickname?</option>
            <option value="First School Name?">First School Name?</option>
            <option value="Childhood Bestfriend Name?">
              Childhood Bestfriend Name?
            </option>
          </select>
                </p>

                <p>
                    <input placeholder="Answer..." oninput="this.className = ''" name="secans" required="required" />
                </p>
                <p>
                    <input placeholder="Create Password" oninput="this.className = ''" name="pswd" type="password" required="required" />
                </p>
                <p>
                    <input placeholder="Confirm Password" oninput="this.className = ''" name="cnfpswd" type="password" required="required" />
                </p>
                <input value="member" name="usertype" hidden />
               
            </div>
            <div style="overflow: auto">
                <div style="float: right">
                    <button type="button" id="prevBtn" onclick="nextPrev(-1)">
            Previous
          </button>
                    <button type="submit" id="nextBtn" onclick="nextPrev(1)">Next</button>
                </div>
            </div>
            <!-- Circles which indicates the steps of the form: -->
            <div style="text-align: center; margin-top: 40px">
                <span class="step"></span>
                <span class="step"></span>
                <span class="step"></span>
                <span class="step"></span>
            </div>
        </form>
<script type="text/javascript">






var curday = function(sp) {
    today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //As January is 0.
    var yyyy = today.getFullYear();

    if (dd < 10) dd = "0" + dd;
    if (mm < 10) mm = "0" + mm;
    return mm + sp + dd + sp + yyyy;
}

window.onload =( function() {
	document.getElementById("D").value = curday("-");
});








var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form ...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
    
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  // ... and run a function that displays the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form... :
  if (currentTab >= x.length) {
    //...the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false:
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class to the current step:
  x[n].className += " active";
}


    



</script>
        
    </body>

    </html>