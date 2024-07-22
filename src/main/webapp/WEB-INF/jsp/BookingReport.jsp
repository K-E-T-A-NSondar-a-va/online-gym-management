<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Report</title>

<link rel="stylesheet" href="/CSS/adminPanelStyle.css">
<link rel="stylesheet" href="/CSS/tableStyle.css">

</head>
<body>
	<div class="container">
		<jsp:include page="adminPanel.jsp" />
		
		<c:if test="${empty bookList}">
			<div class="content">
				<span>No Data Available</span>
			</div>
		</c:if>
		
		<c:if test="${bookList.size() > 0}">
			<div class="content">
				<div class="form-container">
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
			</div>
		</c:if>
	</div>
</body>
</html>