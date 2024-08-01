<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Details</title>

<link rel="stylesheet" href="/CSS/adminPanelStyle.css">
<link rel="stylesheet" href="/CSS/tableStyle.css">

</head>
<body>
	<div class="container">
		<jsp:include page="adminPanel.jsp" />
		<div class="content">
			<c:if test="${empty customerList}">
				<div class="content">
					<span>No Data Available</span>
				</div>
			</c:if>
			<c:if test="${customerList.size() > 0}">
				<div class="form-container">
					<h2 class="form-title">Customer Details</h2>
					<form action="/delete-customer" method="post">
						<div class="table-container">
							<div>
								<table>
									<thead>
										<tr>
											<th>Index</th>
											<th>Username</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Service Booked</th>
											<th>Select</th>
										</tr>
									</thead>
									<tbody>
										<%
										int i = 1;
										%>
										<c:forEach items="${customerList}" var="customer">
											<tr>
												<td>
													<%
													out.println(i++);
													%>
												</td>
												<td>${customer.username}</td>
												<td>${customer.firstName}</td>
												<td>${customer.lastName}</td>
												<td>${gymBookDao.findTotalSeatbookedByUsername(customer.username)}</td>
												<td><input type="radio" name="username"
													value="${customer.username}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<br />
							</div>
						</div>
						<button class="form-delete-button" type="submit">Delete</button>
					</form>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>