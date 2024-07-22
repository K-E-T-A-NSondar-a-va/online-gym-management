<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Your Slot</title>

<link rel="stylesheet" href="/CSS/tableStyle.css">

<style>
* {
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

.container {
	/* background-color: rgba(0, 0, 0, 0.7); */
	padding: 20px;
	border-radius: 10px;
	width: 70%;
	margin: auto;
	margin-top: 10px;
	position: relative;
	top: 60px;
	border: solid 1px #313131;
	width: 55%;
}

button {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 5px;
	background-color: #4156f3;
	color: white;
	font-size: 16px;
	cursor: pointer;
	width: fit-content;
	margin-top: 15px;
}

</style>
</head>
<body>
	<jsp:include page="NavbarCustomer.jsp" />
	<br>
	<br>
	<div class="container">
		<h2 class="form-title">Book Your Gym Slot</h2> <br>
		<h4 style="font-weight: light">Slot Timing: ${slot.slotTime}</h4> <br>
		<h4 style="font-weight: light">Slot Price: ${slot.pricing}
			&#8377;</h4> <br>

		<h3 style="color: #4156f3">Select Gym Service:</h3> <br>
		<form:form action="/book-slot" method="post">
			
			<input type="hidden" value="${slot.slotId}" name="slotId" />
			<input type="hidden" value="0" name="username" />
			
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
								<input type="radio"  name="itemId" value="${item.itemId}" label="${item.itemId}"/>
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