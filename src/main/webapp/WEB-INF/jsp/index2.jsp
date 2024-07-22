<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/CSS/tableStyle.css">

<style>
.container {
	/* background-color: rgba(0, 0, 0, 0.7); */
	padding: 20px;
	border-radius: 10px;
	width: 55%;
	margin: auto;
	margin-top: 10px;
	position: relative;
	top: 60px;
	border: solid 1px #313131;
}

.welcome-message {
	font-size: 18px;
	margin-top: 35px;
	margin-bottom: 15px;
	text-align: center;
	font-weight: light;
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

	<jsp:include page="NavbarCustomer.jsp" />
	
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
	
	<%-- <jsp:include page="Footer.jsp" /> --%>
</body>
</html>