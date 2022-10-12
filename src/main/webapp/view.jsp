<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="view.css">

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
        <a href="/">Logout</a>
    </div>
</div>
<h3><a href="bookmark.jsp">ADD BOOKMARK</h3>
<br>
<br>

<table><b>
    <tr>
        <th>Title</th>
        <th>Link</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </b>
    <c:forEach var="Bookmark" items="${lb}">
        <tr>
            <td>${Bookmark.title}</td>
            <td><a href="${Bookmark.link}" target="_blank">${Bookmark.link}</a></td>
            <td>
                <form action="edit" method="post">
                    <input type="hidden" name="edit_id" value="${Bookmark.id}">
                    <input type="hidden" name="title" value="${Bookmark.title}">
                    <input type="hidden" name="link" value="${Bookmark.link}">
                    <button class="edit_button" type="submit"><b>Edit</b></button>
                </form>
            </td>
            <td>
                <form action="delete">
                    <input type="hidden" name="delete_id" value="${Bookmark.id}">
                    <button class="delete_button" type="submit"><b>Delete</b></button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>