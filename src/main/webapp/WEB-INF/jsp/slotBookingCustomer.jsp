<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Your Slot</title>

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
	color: white;
}

button {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 5px;
	background-color: #28a745;
	color: white;
	font-size: 16px;
	cursor: pointer;
	width: fit-content;
	margin-top: 15px;
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

a {
	color: white;
}
</style>
</head>
<body>
	<%-- <jsp:include page="controlPanel.jsp" /> --%>

	<div class="container">
		<h2 class="form-title">Book Your Gym Slot</h2>
		<h3 style="text-decoration: underline">Slot Details:</h3>
		<h4 style="font-weight: light">Slot Timing: ${slot.slotTime}</h4>
		<h4 style="font-weight: light">Slot Price: ${slot.pricing}
			&#8377;</h4>

		<h3 style="color: #28a745">Select Gym Service:</h3>
		<form:form action="/book-slot" method="post"
			modelAttribute="slotItemEmbedRecord">
			
			<form:hidden value="${slot.slotId}" path="slotId" />
			<div
				style="display: flex; align-items: center; justify-content: center;">
				<table>
					<thead>
						<tr>
							<th>Select</th>
							<th>Gym Service</th>
							<th>Total Seats</th>
							<th>Available Seats</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${itemList}" var="item">
							<tr>
								<td>
								<form:radiobutton path="itemId" value="${item.itemId}" label="${item.itemId}"/>
								<%-- <label for="selectItem">id: ${item.itemId}</label> <form:input
										type="radio" name="selectItem" value="id: ${item.itemId}"
										path="${embeddedId.itemId}" /> --%></td>
								<td>${item.itemName}</td>
								<td>${item.totalSeat}</td>
								<td>
									<%-- <c:forEach items="${slotItemList}" var="slotItem">
										<c:if test="${gymItem.itemId == slotItem.embeddedId.itemId}">
										${gymItem.totalSeat - slotItem.seatBooked}
									</c:if>
									</c:forEach> --%> ${item.seatVacant}
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<button type="submit">Book</button>
		</form:form>
	</div>

</body>
</html>