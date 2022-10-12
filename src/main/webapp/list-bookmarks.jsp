<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
<%--		<a href="welcome.jsp">Home</a>--%>
		<a href="/list-bookmarks">Bookmarks</a>
		<a href="/">Logout</a>
	</div>
</div>

<div style="padding-left:16px">
	<br>
	<br>
	<div class="container">
		<div>
<%--			<button class="addbutton" type="submit" href="/add-bookmark"><b>Add Bookmark</b></button>--%>
			<a type="button" href="bookmark.jsp">Add Bookmark</a>
		</div>
		<br>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3>List of Bookmarks</h3>
			</div>
			<div class="panel-body">
				<table>
					<thead>
					<tr>
						<th width="40%">Title</th>
						<th width="40%">Link</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${lb}" var="Bookmark">
						<tr><td><input type="hidden" value="${Bookmark.title}"></td>
							<td>${Bookmark.title}</td>
							<td><input type="hidden" value="${Bookmark.link}"></td>
							<td>${Bookmark.link}</td>
							<td><form action="edit" method="post">
								<input type="hidden" value="${Bookmark.id}" name="id">
								<input type="hidden" value= "${Bookmark.title}" name="title">
								<input type="hidden" value= "${Bookmark.link}" name="link">
								<button class="button" type="submit">Edit</button>
							</form></td>
							<td><form action="delete" method="post">
								<input type="hidden" value="${Bookmark.id}" name="id">
								<button class="button" type="submit">Delete</button>
							</form></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</div>

</body>
</html>