<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	/* background-color: rgba(0, 0, 0, 0.7); */
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

table {
	width: 70%;
	border-collapse: collapse;
	margin-top: 20px;
	color: white;
}

table, th, td {
	border: 1px solid white;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #333;
}

.form-title {
	color: white;
	font-size: 28px;
}

a {
	color: white;
}

.welcome-message {
	font-size: 30px;
	margin-bottom: 60px;
	text-align: center;
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

h2 {
	text-align: center;
}
</style>

<script>

	const getUserName = async () => {
		const response = await fetch("http://localhost:8345/get-name");
		const name = await response.text();
		document.getElementById("name").innerText = name;
	}
	
	getUserName();
</script>
<meta charset="ISO-8859-1">
<title>Gym Customer</title>
</head>
<body>
	<div class="welcome-message">
		Welcome <span id="name"></span> to the DecodersGym. Hurry up! book
		your gym slot
	</div>

	<div class="container">
		<h2 class="form-title">Available Slots</h2>
		<div
			style="display: flex; align-items: center; justify-content: center;">
			<table>
				<thead>
					<tr>
						<th>Slot Number</th>
						<th>Slot time</th>
						<th>Slot Price</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${slotList}" var="slot">
						<tr>
							<td>${slot.slotId}</td>
							<td>${slot.slotTime}</td>
							<td>${slot.pricing}</td>
							<td><a href="/slot-show/${slot.slotId}">Slot Enquire</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<a href="/logout">Click Here to Logout</a>
</body>
</html>