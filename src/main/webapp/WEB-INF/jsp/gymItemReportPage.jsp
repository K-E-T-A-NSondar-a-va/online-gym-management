<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym Item Record</title>
</head>

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

 .form-title {
        	color: white;
        	font-size: 28px;
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
</style>

<body>

	<jsp:include page="controlPanel.jsp" />

	<!-- Gym Items Record -->
	<div class="container">
		<h2 class="form-title">Gym Item Report</h2>
		<div
			style="display: flex; align-items: center; justify-content: center;">
			<table>
				<thead>
					<tr>
						<th>Item Number</th>
						<th>Item Name</th>
						<th>Total Seat</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList}" var="item">
						<tr>
							<td>${item.itemId}</td>
							<td>${item.itemName}</td>
							<td>${item.totalSeat}</td>
							<td><a href="/slot-item-add/${item.itemId}">Add To Slots</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>