<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel Booking</title>

<link rel="stylesheet" href="/CSS/adminPanelStyle.css">
<link rel="stylesheet" href="/CSS/tableStyle.css">

</head>
<body>
	<div class="container">
		<jsp:include page="adminPanel.jsp" />
		<div class="content">
			<jsp:include page="cancellationTable.jsp" />
		</div>
	</div>
</body>
</html>