<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmed</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #e9ecef;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 90%;
            max-width: 450px;
        }

        h2 {
            margin-bottom: 20px;
            color: #28a745;
            font-size: 24px;
        }

        .tick-mark {
            width: 60px;
            height: 60px;
            margin: 0 auto 20px; 
        }

        p {
            margin-bottom: 15px;
            color: #555;
            font-size: 16px;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 20px;
            }

            .btn {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Order Confirmed!</h2>
        <!-- SVG for Tick Mark -->
        <div class="tick-mark">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                <circle cx="26" cy="26" r="25" fill="none" stroke="#28a745" stroke-width="4"/>
                <path fill="none" stroke="#28a745" stroke-width="4" d="M14 27l7 7 17-17"/>
            </svg>
        </div>
        <p>Your order has been successfully placed.</p>
        <p>Thank you for your order!</p>
        <a href="home.jsp" class="btn">Back To Home</a>
    </div>

</body>
</html>
