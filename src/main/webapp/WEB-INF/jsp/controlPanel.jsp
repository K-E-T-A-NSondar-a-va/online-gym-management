<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym Control Center</title>
    <style>
        body, html {
        	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            /* background-image: url('https://t3.ftcdn.net/jpg/00/95/66/36/360_F_95663690_w21ZAFRitPFHL28BYyk6v5JZB0Vu7jQu.jpg'); */ 
            background-image: url('https://img.freepik.com/free-photo/blurred-cardio-machines_1203-98.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: black;
            text-align: center;
            /* background: #212121; */
            /* background: #f2f2f3; */
            background: white;
        }
        .tab-bar {
            display: flex;
            justify-content: space-around;
            /* align-items: center; */
            gap: 10px;
            /* position: fixed;
            top: 0; */
            width: 97%;
            /* background-color: rgba(0, 0, 0, 0.8); */
            padding: 10px 0;
            z-index: 1000;
            margin-left: 20px;
        }
        .tab {
            color: black;
            border: solid 2px #28a745;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .tab:hover, .tab.active {
            background-color: #28a745;
            color: white;
        }
        .tab-content {
            display: none;
        }
        .tab-content.active {
            display: block;
        }
        h2 {
            /* color: #ffbf00; */
            color: #218838;
        }
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
        

        select {
            padding: 0 5px;
        }
        /* .center {
            display: flex;
            align-items: center;
        } */



        /* navbar code:  */
        .navbar {
            display: flex;
            justify-content: space-between;
            width: 100%;
            /* background-color: rgba(0, 0, 0, 0.7); */
            background: linear-gradient(to left, #434343, #000000);
            padding: 10px 0;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .navbar h1 {
            color: #fff;
            margin: 0;
            padding-left: 20px;
            font-size: 24px;
            text-align: left;
        }
        .navbar ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding-top: 7px;
        }
        .navbar li {
            padding: 0 20px;
            position: relative;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }
        .navbar .dropdown {
            display: flex;
            align-items: center;
        }
        .navbar .dropdown:after {
            content: '\25BC'; /* Unicode for down arrow */
            margin-left: 5px;
            font-size: 12px;
            color: white;
        }
        .navbar .dropdown-content {
            display: none;
            position: absolute;
            background-color: rgba(0, 0, 0, 0.8);
            min-width: 160px;
            z-index: 1;
            margin-top: 150px;
        }
        .navbar .dropdown-content a {
            padding: 12px 16px;
            display: block;
        }
        .navbar .dropdown:hover .dropdown-content {
            display: block;
        }
        .container {
            position: relative;
            top: 60px;
        }
        .welcome-message {
            font-size: 48px;
            margin-bottom: 60px;
            background: black;
            padding: 10px 15px;
        }
        .btn-container {
            margin-top: 20px;
        }
        .btn {
            background-color: #28a745;
            color: white;
            padding: 15px 30px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #218838;
        }

       	a {
       		text-decoration: none;
       	}
       	
       	.active-link {
       		background-color: #28a745;
            color: white;
       	}
       	
       	.title {
       		/* font-variant: small-caps; */
       		font-family: 'Courier New', Courier, monospace;
       		font-size: 30px;
       		text-transform: uppercase;
       		font-weight: bold;
       		word-spacing: 4px;
       	}
       	
       	span {
       		font-size: large;
       		font-weight: bold;
       		margin-bottom: 3px;
       	}
       	
       	.welcome-msg {
       		margin: 0 120px 30px 120px;
       	}
       	
       	#name {
       		fo
       	}
    </style>
    
     <script>
        function setActive(element) {
            var links = document.getElementsByClassName('nav-link');
            for (var i = 0; i < links.length; i++) {
                links[i].classList.remove('active-link');
            }
            element.classList.add('active-link');
        }

        // Retain active link on page reload
        window.onload = function() {
            var path = window.location.pathname;
            var links = document.getElementsByClassName('tab');
            for (var i = 0; i < links.length; i++) {
                if (links[i].getAttribute('href') === path) {
                    links[i].classList.add('active-link');
                    break;
                }
            }
        };
        
        const getFullName = async () => {
        	const response = await fetch("http://localhost:8345/get-name");
        	 
        	console.log(response.json)
        	const name = await response.text();
        	
        	console.log(name);
        	document.getElementById("name").innerText = name;
        }
        
        getFullName();
    </script>

</head>
<body>
    <div class="navbar">
        <h1>DecodersGym</h1>
        <ul>
            <li><a href="/">Home</a></li>
            <!-- <li class="dropdown">
                <a href="/pricing">Pricing</a>
                <div class="dropdown-content">
                    <a href="#">Basic Plan</a>
                    <a href="#">Premium Plan</a>
                    <a href="#">VIP Plan</a>
                </div>
            </li> -->
            <li><a href="/contact">Contact</a></li>
            <li><a href="/feedback">Feedback</a></li>
        </ul>
    </div>
    <div style="margin-top: 70px;"></div>
    <h2 class="title">Gym Control Panel</h2>
    <div class="welcome-msg">Welcome <span id="name"></span> to the DecodersGym. from here you can perform all <b>gym management action at one place </b>. you can add gym service and also see the provided service. there is option to add slots for the provided service and also option available to see the slot record. User can book slot from this same page.</div>
    <div class="tab-bar">
        <div style="display: flex; flex-direction: column; gap: 5px;">
            <span>Manage Gym Item:</span>
            <a href="/gymitem" onclick="setActive(this)" class="tab">Add New Gym Item</a>
            <a href="/gymitems" onclick="setActive(this)" class="tab">Gym Item Report</a>
        </div>
        <div style="display: flex; flex-direction: column; gap: 5px;">
            <span>Manage Slots:</span>
            <a href="/add-slot" onclick="setActive(this)" class="tab">Add New Slot</a>
            <a href="/slots" onclick="setActive(this)" class="tab">Slot Report</a>
        </div>
        <!-- <div style="display: flex; flex-direction: column; gap: 5px;">
            <span>Other actions:</span>
            <a href="/slot-booking" onclick="setActive(this)" class="tab">Slot Booking</a>
            <a href="/logout"><div class="tab">Logout</div></a>
        </div> -->
    </div>                        
    </div>
    
    <a href="/logout">Click Here to Logout</a>
</body>
</html>
