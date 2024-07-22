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
				<h2 class="form-title">Gym Item Entry</h2>
				<form:form action="/gymitem" method="post"
					modelAttribute="itemRecord">
					<div class="form-group">
						<label for="itemName">Item Name:</label> <br />
						<form:input class="form-input" type="text" id="itemName"
							name="itemName" path="itemName" placeholder="Enter gym item name" />
					</div>
					<div class="form-group">
						<label for="totalSeat">Total Seat:</label> <br />
						<form:input class="form-input" type="number" id="totalSeat"
							name="totalSeat" path="totalSeat" placeholder="Enter total seats" />
					</div>
					<div class="form-group">
						<button class="form-button" type="submit">Add gym item</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>