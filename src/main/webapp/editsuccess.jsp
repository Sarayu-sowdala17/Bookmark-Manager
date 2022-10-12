<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles.css">


</head>
<body>
<div class="navbar">
    <input type="checkbox" id="navbar-checkbox">
    <div class="navbar-header">
        <div class="navbar-title">
            <a href="welcome.jsp">Bookmark Manager(POC)</a>
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
        <a href="/list-bookmarks">Bookmarks</a>
        <a href="/">Logout</a>
    </div>
</div>

<div style="padding-left:16px">
    <br>
    <br>
    <script type="text/javascript">
        alert("Bookmark Updated Successfully");
        window.location.href = "/list-bookmarks";
    </script>
</div>

</body>
</html>