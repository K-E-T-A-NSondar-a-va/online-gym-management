<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new slot</title>

<style>

		.form-group {
            margin: 20px 0;
        }
        .form-group input, .form-group select, .form-group button {
            width: 40%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            margin-top: 10px;
        }
        .form-group button {
            background-color: #28a745;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
            width: fit-content;
        }
        .form-group button:hover {
            background-color: #218838;
        }
         .form-title {
        	color: white;
        	font-size: 28px;
        }
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

</style>

</head>
<body>
	<jsp:include page="controlPanel.jsp" />
	<div class="container">
            <h2 class="form-title">Slot Item Entry</h2>
            <form:form action="/slot" method="post" modelAttribute="slotRecord">
                <div class="form-group">
                    <label for="slotTime">Enter Slot Time:</label>
                    <form:input type="text" id="slotTime" name="slotTime" path="slotTime" placeholder="i.e. 6.30 AM " />
                </div>
                <div class="form-group">
                    <label for="pricing">Enter Slot Price:</label>
                    <form:input type="number" id="pricing" name="pricing" path="pricing" placeholder="Enter price (only number in rupees)" />
                </div>
                <div class="form-group">
                    <button type="submit">Add Slot</button>
                </div>
            </form:form>
       </div>
</body>
</html>