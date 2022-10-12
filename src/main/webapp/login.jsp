<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="login.css">
    </head>
<div class="logo"></div>
<div class="login-block">
    <h1>Login</h1>
    <form method="post" action="loginvalidation">
        <input type="text" value="" placeholder="Username" name="username" />
        <input type="password" value="" placeholder="Password" name="password" />
        <button action="/loginvalidation">Log In</button>
        <h5>New User <a href="/register">Register Here</a></h5>
        <br>
        <h5>Forgot Password ? <a href="/forgot">Click Here</a></h5>
    </form>
</div>
</html>