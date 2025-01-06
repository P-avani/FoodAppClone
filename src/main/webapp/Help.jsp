<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        header {
            background-color: #F96E2A;
            color: #fff;
            padding: 1rem;
            text-align: center;
        }
        main {
            padding: 2rem;
            max-width: 800px;
            margin: auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #343a40;
        }
        .contact-info, .faq {
            margin-bottom: 1.5rem;
        }
        .contact-info p, .faq p {
            margin: 0.5rem 0;
        }
        form {
            margin-top: 1.5rem;
        }
        label, input, textarea, button {
            display: block;
            width: 100%;
            margin-bottom: 1rem;
            padding: 0.8rem;
        }
        button {
            background-color: #343a40;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #495057;
        }
    </style>
</head>
<body>
    <header>
        <h1>Help & Support</h1>
    </header>
    <main>
        <section class="contact-info">
            <h2>Contact Information</h2>
            <p>Email: support@bitesphere.com</p>
            <p>Phone: +1-800-123-4567</p>
            <p>Address: 123 Food Street, Flavor Town, Bangalore</p>
        </section>

     
        <form action="submitQuery.jsp" method="POST">
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Your Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="orderId">Order ID:</label>
            <input type="text" id="orderId" name="orderId" placeholder="Enter your order ID" required>

            <label for="message">Your Message:</label>
            <textarea id="message" name="message" rows="4" placeholder="Describe your issue..." required></textarea>

            <button type="submit">Submit</button>
        </form>
    </main>
</body>
</html>
