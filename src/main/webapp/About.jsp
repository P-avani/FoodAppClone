<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
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
        .about-container {
            background-color: #fff;
            padding: 40px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
        }
        h1 {
            color: #4CAF50;
        }
        p {
            font-size: 18px;
            color: #333;
            line-height: 1.6;
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

<div class="about-container">
    <h1>About Us</h1>
    <p>
        Welcome to our platform! We are dedicated to providing the best solutions to our users with utmost
        professionalism and care. Our team comprises experts from various fields working together to deliver
        reliable and efficient services. Our goal is to ensure a seamless experience for you.
    </p>
    <p>
        Feel free to contact us if you need any assistance or more information. We value your feedback and
        strive to improve continuously.
    </p>
    <form action="javascript:history.back()">
        <button class="go-back-button">Go Back</button>
    </form>
</div>

</body>
</html>
