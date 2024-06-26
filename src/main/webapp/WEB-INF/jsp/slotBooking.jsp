<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Slot</title>

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
            color: white;
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
         .form-title {
        	color: white;
        	font-size: 28px;
        }
        .gym-item-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }
        .gym-item {
            background: #2f2f2f;
            color: white;
            padding: 4px 16px;
            border-radius: 5px;
            font-size: large;
            cursor: pointer;
            border: solid 1px #2f2f2f;
        }

        .gym-item:hover {
            border: solid 1px #28a745;
        }

</style>

</head>
<body>

	<jsp:include page="controlPanel.jsp" />
	  <!-- Slot Booking Interface -->
        <div class="container">
            <h2 class="form-title">Book Your Gym Slot</h2>
            <form action="/bookSlot" method="post">
                <div class="form-group">
                    <label for="gymItem">Select Gym Item:</label>
                    <div class="gym-item-container">
                        <div class="gym-item" data-value="cardio">
                            <!-- <img src="https://via.placeholder.com/50" alt="Cardio"> -->
                            <span>Cardio</span>
                        </div>
                        <div class="gym-item" data-value="body_building">
                            <!-- <img src="https://via.placeholder.com/50" alt="Body Building"> -->
                            <span>Body Building</span>
                        </div>
                        <div class="gym-item" data-value="yoga">
                            <!-- <img src="https://via.placeholder.com/50" alt="Yoga"> -->
                            <span>Yoga</span>
                        </div>
                        <div class="gym-item" data-value="boxing">
                            <!-- <img src="https://via.placeholder.com/50" alt="Boxing"> -->
                            <span>Boxing</span>
                        </div>
                    </div>
                    <input type="hidden" id="gymItem" name="gymItem" class="hidden-input" required>
                </div>
                <div class="form-group">
                    <label for="slot">Select Slot:</label>
                    <select id="slot" name="slot" required>
                        <optgroup label="Morning">
                            <option value="6_30_7_30">6:30 AM (1500 &#8377;)</option>
                            <option value="7_30_8_30">7:30 AM (2000 &#8377;)</option>
                            <option value="8_30_9_30">8:30 AM (2000 &#8377;)</option>
                        </optgroup>
                        <optgroup label="Afternoon">
                            <option value="12_00_1_00">12:00 PM (1500 &#8377;)</option>
                            <option value="1_00_2_00">1:00 PM (2000 &#8377;)</option>
                            <option value="2_00_3_00">2:00 PM (1500 &#8377;)</option>
                        </optgroup>
                        <optgroup label="Evening">
                            <option value="5_00_6_00">5:00 PM (1700 &#8377;)</option>
                            <option value="6_00_7_00">6:00 PM (1800 &#8377;)</option>
                            <option value="7_00_8_00">7:00 PM (2000 &#8377;)</option>
                        </optgroup>
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit">Book Slot</button>
                </div>
            </form>
        </div>
</body>
</html>