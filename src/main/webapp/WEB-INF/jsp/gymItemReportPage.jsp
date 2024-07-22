<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym Item Record</title>

<link rel="stylesheet" href="/CSS/tableStyle.css">
<link rel="stylesheet" href="/CSS/adminPanelStyle.css">

</head>

<body>
	<div class="container">
		<jsp:include page="adminPanel.jsp" />
		<div class="content">
			<div class="form-container">
				<h2 class="form-title">Gym Item Report</h2>
				<div
					style="display: flex; align-items: center; justify-content: center;">
					<table>
						<thead>
							<tr>
								<th>Item Number</th>
								<th>Item Name</th>
								<th>Total Seat</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${itemList}" var="item">
								<tr>
									<td>${item.itemId}</td>
									<td>${item.itemName}</td>
									<td>${item.totalSeat}</td>
									<td><a href="/slot-item-add/${item.itemId}">Add To
											Slots</a></td>
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