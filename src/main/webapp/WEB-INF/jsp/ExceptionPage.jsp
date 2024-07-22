<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seat not available</title>
<link rel="stylesheet" href="/CSS/errorPage.css">
</head>
<body>
	<div style="text-align: center;">
		<p style="color: red">${errorMessage}</p>
		<a href="/index"> click here to return</a>
	</div>
</body>
</html>