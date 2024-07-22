<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Cancellation</title>

<link rel="stylesheet" href="/CSS/adminPanelStyle.css">
<link rel="stylesheet" href="/CSS/tableStyle.css">

</head>
<body>
	<c:if test="${empty bookList}">
		<div class="content">
			<span>No Data Available</span>
		</div>
	</c:if>
	<c:if test="${bookList.size() > 0}">
		<div class="form-container">
			<h2 class="form-title">Cancel Booking</h2>
			<form:form action="/cancel" method="post">
				<div class="table-container">
					<div>
						<table>
							<thead>
								<tr>
									<th>Booking ID</th>
									<th>Slot ID</th>
									<th>Item ID</th>
									<th>User ID</th>
									<th>Cancel</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bookList}" var="booking">
									<tr>
										<td name="bookingId">${booking.bookingId}</td>
										<td>${booking.slotId}</td>
										<td>${booking.itemId}</td>
										<td>${booking.username}</td>
										<td><input type="radio" name="bookingId"
											value="${booking.bookingId}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<br />
					</div>
				</div>
				<button class="form-button" type="submit">Cancel</button>
			</form:form>
		</div>
	</c:if>
</body>
</html>