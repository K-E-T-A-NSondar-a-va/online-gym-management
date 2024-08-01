<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Service</title>

<link rel="stylesheet" href="/CSS/adminPanelStyle.css">
<!-- <link rel="stylesheet" href="/CSS/formStyle.css"> -->
</head>
<body>
	<div class="container">
		<jsp:include page="adminPanel.jsp" />
		<div class="content">
			<div class="form-container">
				<h2 class="form-title">Update Gym Item</h2>
				<form action="/edit-gymItem" method="post">
					<input type="hidden" name="itemId" value="${gymItem.itemId}">
					<div class="form-group">
						<label for="itemName">Item Name:</label> <br />
						<input class="form-input" type="text" id="itemName"
							name="itemName" value="${gymItem.itemName}" />
					</div>
					<div class="form-group">
						<label for="totalSeat">Total Seat:</label> <br />
						<input class="form-input" type="number" id="totalSeat"
							name="totalSeat" value="${gymItem.totalSeat}" />
					</div>
					<div class="form-group">
						<button class="form-button" type="submit">Update gym item</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>