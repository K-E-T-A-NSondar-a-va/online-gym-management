<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation</title>

    <style>

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #e6e6e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
        }

        .msg-container {
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 10px;
            font-size: 18px;
            height: 140px;
            width: 420px;
            border-radius: 5px;
        }

        button {
            margin-top: 10px;
            padding: 8px 14px;
            border-radius: 5px;
            background-color: #4156f3;
            color: white;
            outline: none;
            border: none;
            cursor: pointer;
	        font-size: 18px;
            font-size: 15px;
        }

        a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="msg-container">
        <div class="msg-text">
            ${msg}
        </div>
        <button class="msg-button">
            <a href="/index">Return</a>
        </button>
    </div>
</body>
</html>