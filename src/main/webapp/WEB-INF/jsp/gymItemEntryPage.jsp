<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Service</title>

<style>
.container {
	/* background-color: rgba(0, 0, 0, 0.8); */
	background: linear-gradient(to left, #434343, #000000);
	padding: 20px;
	border-radius: 10px;
	width: 70%;
	margin: auto;
	margin-top: 10px;
	position: relative;
	top: 60px;
	border: solid 1px #313131;
}

.form-group {
	margin: 20px 0;
}

.form-group input, .form-group select, .form-group button {
	width: 40%;
	padding: 10px;
	font-size: 16px;
	border-radius: 5px;
	border: none;
	margin-top: 10px;
}

.form-group button {
	background-color: #28a745;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s;
	width: fit-content;
}

.form-group button:hover {
	background-color: #218838;
}

.gym-item-container {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 10px;
}

.gym-item {
	background: #2f2f2f;
	color: white;
	padding: 4px 16px;
	border-radius: 5px;
	font-size: large;
	cursor: pointer;
	border: solid 1px #2f2f2f;
}

label {
	color: white;
}

.form-title {
	color: white;
	font-size: 28px;
}
</style>
</head>
<body>
	<jsp:include page="controlPanel.jsp" />

	<div class="container">
		<!-- Gym Item Form -->
		<div>
			<h2 class="form-title">Gym Item Entry</h2>
			<form:form action="/gymitem" method="post"
				modelAttribute="itemRecord">
				<div class="form-group">
					<label for="itemName">Item Name:</label>
					<form:input type="text" id="itemName" name="itemName"
						path="itemName" placeholder="Enter gym item name" />
				</div>
				<div class="form-group">
					<label for="totalSeat">Total Seat:</label>
					<form:input type="number" id="totalSeat" name="totalSeat"
						path="totalSeat" placeholder="Enter total seats" />
				</div>
				<div class="form-group">
					<button type="submit">Add Gym Item</button>
				</div>
			</form:form>
		</div>
</body>
</html>