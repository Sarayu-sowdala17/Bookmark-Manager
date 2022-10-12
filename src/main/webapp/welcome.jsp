<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="welcome.css">

</head>
<body>
<div class="navbar">
    <input type="checkbox" id="navbar-checkbox">
    <div class="navbar-header">
        <div class="navbar-title">
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
        <a href="welcome.jsp">Home</a>
        <a href="/list-bookmarks">Bookmarks</a>
        <a href="/logout">Logout</a>
    </div>
</div>
<%--<div style="padding-left:16px">--%>
<%--    <br>--%>
<%--	<br>--%>
<%--	<h5>Welcome ${user}!! <a href="/list-bookmarks">Click here</a> to manage your--%>
<%--		Bookmarks.</h5>--%>
<%--</div>--%>
<section class="b1">
    <div class="in1">
        <div class="content">
            <h3>
                Welcome ${user}</h3>
            <a class="btn" href="/list-bookmarks">Manage Bookmarks</a>
        </div>
    </div>
</section>
</body>
</html>