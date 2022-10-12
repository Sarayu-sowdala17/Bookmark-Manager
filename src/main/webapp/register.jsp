<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Style all input fields */
        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
        }

        /* Style the submit button */
        input[type=submit] {
            background-image: -webkit-linear-gradient(right, #1a1d65, 0%, #382564, 100%);
            background-image: -moz-linear-gradient(right, #1a1d65 0%, #382564 100%);
            background-image: linear-gradient(to right, #1a1d65 0%, #382564 100%);
            color: white;
        }

        /* Style the container for inputs */
        .container {
            background-color: #f1f1f1;
            padding: 20px;
        }

        /* The message box is shown when the user clicks on the password field */
        #message {
            display:none;
            background: #f1f1f1;
            color: #000;
            position: relative;
            padding: 20px;
            margin-top: 10px;
        }

        #message p {
            padding: 10px 35px;
            font-size: 18px;
        }

        /* Add a green text color and a checkmark when the requirements are right */
        .valid {
            background-image: -webkit-linear-gradient(right, #1a1d65, 0%, #382564, 100%);
            background-image: -moz-linear-gradient(right, #1a1d65 0%, #382564 100%);
            background-image: linear-gradient(to right, #1a1d65 0%, #382564 100%);
        }

        .valid:before {
            position: relative;
            left: -35px;
            content: "Pass: ";
        }

        /* Add a red text color and an "x" when the requirements are wrong */
        .invalid {
            color: red;
        }

        .invalid:before {
            position: relative;
            left: -35px;
            content: "X";
        }
    </style>
</head>
<body>
<div class="navbar">
    <input type="checkbox" id="navbar-checkbox">
    <div class="navbar-header">
        <div class="navbar-title" >
            Bookmark Manager(POC)
        </div>
    </div>
    <div class="navbar-responsive-button">
        <label for="navbar-checkbox">
            <span class="hamburger-icon"></span>
            <span class="hamburger-icon"> </span>
            <span class="hamburger-icon"></span>
        </label>
    </div>
    <div class="navbar-links">
        <%--        <a href="/list-bookmarks">Bookmarks</a>--%>
        <%--        <a href="/">Logout</a>--%>
    </div>
</div>

<h3>User Registration</h3>

<div class="container">
    <form action="registersuccess" method="post" >
        <label for="usrname">Username</label>
        <input type="text" id="usrname" name="username" placeholder="Enter Email address" required>
        <label for="usrname">First Name</label>
        <input type="text" id="firstName" name="firstName" placeholder="Enter your First Name" required>
        <label for="usrname">Last Name</label>
        <input type="text" id="lastName" name="lastName" placeholder="Enter your Last Name" required>
        <label for="psw">Password</label>
        <input type="password" id="psw" name="password" placeholder="Enter your Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>

        <input type="submit" value="Submit">
    </form>
</div>

<div id="message">
    <h3>Password must contain the following:</h3>
    <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
    <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
    <p id="number" class="invalid">A <b>number</b></p>
    <p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>

<script>
    var myInput = document.getElementById("psw");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");


    myInput.onfocus = function() {
        document.getElementById("message").style.display = "block";
    }

    myInput.onblur = function() {
        document.getElementById("message").style.display = "none";
    }

    myInput.onkeyup = function() {

        var lowerCaseLetters = /[a-z]/g;
        if(myInput.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
        } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        var upperCaseLetters = /[A-Z]/g;
        if(myInput.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
        } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
        }

        var numbers = /[0-9]/g;
        if(myInput.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
        } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        if(myInput.value.length >= 8) {
            length.classList.remove("invalid");
            length.classList.add("valid");
        } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
        }
    }
</script>

</body>
</html>
