<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new slot</title>

<link rel="stylesheet" href="/CSS/adminPanelStyle.css">

</head>
<body>
	<div class="container">
		<jsp:include page="adminPanel.jsp" />
		<div class="content">
			<div class="form-container">
				<h2 class="form-title">Slot Item Entry</h2>
				<form:form action="/slot" method="post" modelAttribute="slotRecord">
					<div class="form-group">
						<label for="slotTime">Enter Slot Time:</label>
						<form:input class="form-input" type="text" id="slotTime"
							name="slotTime" path="slotTime" placeholder="i.e. 6.30 AM " />
					</div>
					<div class="form-group">
						<label for="pricing">Enter Slot Price:</label>
						<form:input class="form-input" type="number" id="pricing"
							name="pricing" path="pricing"
							placeholder="Enter price (only number in rupees)" />
					</div>
					<div class="form-group">
						<button type="submit" class="form-button">Add Slot</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>