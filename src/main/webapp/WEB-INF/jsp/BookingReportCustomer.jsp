<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Details</title>

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
</head>
<body>
	<jsp:include page="NavbarCustomer.jsp" />
	<br>
	<br>
	<c:if test="${empty bookList}">
		<div class="content">
			<span>No Data Available</span>
		</div>
	</c:if>

	<c:if test="${bookList.size() > 0}">
		<div class="container">
			<h2 class="form-title">Slot Booking Report</h2>
			<div>
				<table>
					<thead>
						<tr>
							<th>Booking ID</th>
							<th>Slot ID</th>
							<th>Item ID</th>
							<th>User ID</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookList}" var="booking">
							<tr>
								<td>${booking.bookingId}</td>
								<td>${booking.slotId}</td>
								<td>${booking.itemId}</td>
								<td>${booking.username}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br />
			</div>
		</div>
	</c:if>
</body>
</html>