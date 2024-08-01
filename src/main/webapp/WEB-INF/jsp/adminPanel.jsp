<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="/CSS/adminPanelStyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
        function setActive(element) {
            var links = document.getElementsByClassName('element');
            var icons = document.getElementsByTagName('i');
            for (var i = 0; i < links.length; i++) {
                links[i].classList.remove('active-link');
                icons[i].classList.remove('active-icon');
            }
            element.classList.add('active-link');
        }

        // Retain active link on page reload
        window.onload = function() {
            var path = window.location.pathname;
            var links = document.getElementsByClassName('element');
            var icons = document.getElementsByTagName('i');
            for (var i = 0; i < links.length; i++) {
                if (links[i].getAttribute('href') === path) {
                    links[i].classList.add('active-link');
                    icons[i].classList.add('active-icon');
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
	<div class="sidebar">
		<div class="username">
			Welcome, <br> <span id="name"></span>
		</div>
		<div class="items">
			<a href="/gymitem" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-cube"></i></i><span>Add Item</span>
				</div>
			</a> <a href="/add-slot" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-plus-square-o"></i><span>Add Slot</span>
				</div>
			</a> <a href="/gymitems" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-cubes" style="font-size: 13px;"></i><span>Gym
						Items</span>
				</div>
			</a> <a href="/slots" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-book"></i><span>Slot Report</span>
				</div>
			</a> <a href="/slots" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-gift"></i><span>Book Slot</span>
				</div>
			</a> <a href="/bookings" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-edit"></i><span>Booking Details</span>
				</div>
			</a> <a href="/cancellation" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-close"></i><span>Cancellation</span>
				</div>
			</a> <a href="/feedbacks" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-id-card-o"></i><span>Feedbacks</span>
				</div>
			</a> <a href="/customers" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-user-circle-o"></i><span>Customers</span>
				</div>
			</a> <a href="/logout" class="element" onclick="setActive(this)">
				<div class="item">
					<i class="fa fa-sign-out"></i><span>Logout</span>
				</div>
			</a>
		</div>
	</div>
</body>

</html>