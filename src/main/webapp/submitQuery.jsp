<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .thank-you-container {
            background-color: #fff;
            padding: 40px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #F96E2A;
        }
        p {
            font-size: 18px;
            color: #333;
        }
        .go-back-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .go-back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="thank-you-container">
    <h1>Thank You for Your Submission!</h1>
    <p>Your query has been submitted successfully. Our team will get back to you shortly.</p>
    <form action="Restaurant.jsp">
        <button class="go-back-button">Go Back</button>
    </form>
</div>

</body>
</html>
