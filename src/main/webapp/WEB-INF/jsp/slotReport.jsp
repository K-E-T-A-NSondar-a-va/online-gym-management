<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot Record</title>


<link rel="stylesheet" href="/CSS/tableStyle.css">
<link rel="stylesheet" href="/CSS/adminPanelStyle.css">

</head>
<body>
	<div class="container">
		<jsp:include page="adminPanel.jsp" />
		<div class="content">
			<div class="form-container">
				<h2 class="form-title">Available Slots</h2>
				<div
					style="display: flex; align-items: center; justify-content: center;">
					<table border="0" cellspacing="0">
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
		</div>
	</div>
</body>
</html>