<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        /* Improved CSS styling */
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 30px; 
            border-radius: 8px; 
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 500px; 
        }
        h2 {
            color: #F96E2A;
            margin-bottom: 20px; 
            text-align: center;
            font-size: 24px; 
        }
        label {
            display: block;
            margin-bottom: 8px; 
            font-weight: bold; 
            color: #333; 
        }
        input[type="text"],
        textarea,
        select {
            width: 95%;
            padding: 12px; 
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 15px;
            font-size: 16px;
        }
        textarea {
            resize: vertical; 
            height: 80px;
        }
        .button-container {
            text-align: center
            margin-top: 20px; 
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px; 
            cursor: pointer;
            display: block; 
            margin: 20px auto 0; 
            font-size: 16px; 
            transition: background-color 0.3s; 
        }
        button:hover {
            background-color: #45a049; 
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Checkout</h2>

        <form action="checkout" method="post">
            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="4" required></textarea>

            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>

            <label for="zip">Zip Code:</label>
            <input type="text" id="zip" name="zip" required>

            <label for="payment">Payment Method:</label>
            <select id="payment" name="paymentMode" required>
                <option value="">Select Payment Method</option>
                <option value="credit_card">Credit Card</option>
                <option value="debit_card">Debit Card</option>
                <option value="paypal">PayPal</option>
                <option value="upi">UPI</option> <!-- Corrected duplicate option -->
                <option value="cash_on_delivery">Cash on Delivery</option>
            </select>

            <button type="submit">Place Order</button>
        </form>
    </div>

</body>
</html>