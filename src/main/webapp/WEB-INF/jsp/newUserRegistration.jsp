<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gym Registration</title>

<style>
	
body, html {
	height: 100%;
	margin: 0;
	font-family: Arial, sans-serif;
}

.bg {
	background-image:
		url('https://thumbs.dreamstime.com/b/abstract-gym-background-strong-arm-chest-bodybuilder-91838676.jpg');
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	display: flex;
	justify-content: center;
	align-items: center;
}

.form-container {
	background: rgba(0, 0, 0, 0.8);
	padding: 30px;
	border-radius: 10px;
	width: 400px;
	color: #fff;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
}

.form-container h2 {
	margin-bottom: 20px;
	text-align: center;
}

.form-container input[type="text"], .form-container input[type="email"],
	.form-container input[type="password"] {
	width: 100%;
	padding: 15px;
	margin: 10px 0;
	border: none;
	border-radius: 5px;
	box-sizing: border-box;
}

.form-container button {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 5px;
	background-color: #28a745;
	color: white;
	font-size: 16px;
	cursor: pointer;
}

.form-container input[type="reset"] {
	width: 100%;
	padding: 15px;
	border: #28a745;
	border-radius: 5px;
	background-color: white;
	color: black;
	font-size: 16px;
	cursor: pointer;
	margin-top: 10px;
}

.form-container datalist {
	width: 100%;
	padding: 15px;
	border: #28a745;
	border-radius: 5px;
	background-color: white;
	color: black;
	font-size: 16px;
	cursor: pointer;
	margin-top: 10px;
}

.form-container input[type="submit"]:hover {
	background-color: #218838;
}
</style>

<script type="text/javascript">
	const submitHandler = () => {
		var pass1 = document.getElementById("pass1");
		var pass2 = document.getElementById("pass2");
		
		checkForUserId();
		checkForEmail();
		
		if(pass1.value.toString() === pass2.value.toString()) {
			if(pass1.value.toString().length < 4) {
				alert("Password must be atleast 4 character long")
				return;
			}
			document.getElementById("registration-form").submit();
		}
		else {
			alert("Entered password and re-typed password doesn't match")
		}
		
	}
	
	const checkForUserId = async () => {
		  const username = document.getElementById("username").value.toString();
		  
		  if(username.trim() !== "") {
			  const url = "http://localhost:8345/register/check-username/" + username;
			  // console.log(url)
			  const response = await fetch(url);
			  
			  // console.log(response);
			  const isExists = await response.json();
			  
			  // console.log("data: ",isExists)
			  // console.log(typeof(isExists))
			  
			  if(isExists) {
				  alert("user with username '"+username+"' already exists !!");
				  return
			  }
		  }
	}
	
	const checkForEmail = async () => {
		  const email = document.getElementById("email").value.toString();
		  
		  if(email.trim() !== "") {
			  const url = "http://localhost:8345/register/check-email/" + email;
			  
			  const response = await fetch(url);
			  const isExists = await response.json();
			  
			  if(isExists) {
				  alert(email + " already registered !! ");
				  return
			  }
		  }
	}
	
	
</script>

</head>
<body>
	<div class="bg">
		<div class="form-container">
			<h2>Gym Registration</h2>
			<form:form id="registration-form" action="/register" method="post"
				modelAttribute="userRecord">
				Select User type:
				<form:select path="type" id="userType">
					<option value="CUSTOMER">Customer</option>
					<option value="ADMIN">Admin</option>
				</form:select>
				<form:input path="firstName" type="text" name="firstName"
					placeholder="First Name" required="true" />
				<form:input path="lastName" type="text" name="lastName"
					placeholder="Last Name" />
				<form:input path="username" type="text" name="username"
					placeholder="Username" id="username" onblur="checkForUserId()" />
				<form:input path="email" type="email" name="email" id="email" onblur="checkForEmail()"
					placeholder="Email Address" />
				<form:input id="pass1" path="password" type="password"
					name="password" placeholder="Password" />
				<input id="pass2" type="password" name="confirmPassword"
					placeholder="Re-type Password" />
				<button type="button" onclick="submitHandler()">Submit</button>
				<input type="reset" value="Reset" />
			</form:form>
			
			<h4 style="color: white;">Already registered? <a style="color: white;" href="/loginPage">Click here to Login</a></h4>
		</div>
	</div>
</body>
</html>

