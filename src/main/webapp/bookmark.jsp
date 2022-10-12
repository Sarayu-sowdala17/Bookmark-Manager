<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="edit.css">
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
        <a href="/">Logout</a>
    </div>
</div>

<div style="padding-left:16px">
    <br>
    <br>
    <div class="container">
        <form action="bookmarksuccess" method="post" >
            <label for="title">Title</label>
            <input type="text" id="title" name="title" placeholder="Enter Title Here" required>
            <label for="link">Link</label>
            <input type="text" id="link" name="link" placeholder="Enter Link Here" required>
            <input type="submit" value="Submit">
        </form>
    </div>
</div>

</body>

</body>
</html>
