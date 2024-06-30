<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slot Record</title>

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

 .form-title {
        	color: white;
        	font-size: 28px;
   }
   
   a {
   	color: white;
   }
</style>

</head>
<body>
<jsp:include page="controlPanel.jsp" />
  <!-- Available Slots  -->
        <div class="container">
            <h2 class="form-title">Available Slots</h2>
            <div style="display: flex; align-items: center; justify-content: center;">
                <table>
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
</body>
</html>