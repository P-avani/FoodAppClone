<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Failed</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #ff7e7e, #ffbaba);
            color: #4a4a4a;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
            animation: fadeIn 0.8s ease-in-out;
        }
        h1 {
            font-size: 2rem;
            color: #e63946;
            margin-bottom: 15px;
        }
        p {
            font-size: 1.1rem;
            margin-bottom: 25px;
            color: #6c757d;
        }
        a {
            text-decoration: none;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            color: #fff;
            font-size: 1rem;
            background: #e63946;
            transition: background 0.3s ease, transform 0.2s ease;
        }
        a:hover {
            background: #d62839;
            transform: scale(1.05);
        }
        a.secondary {
            background: #495057;
        }
        a.secondary:hover {
            background: #343a40;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registration Failed</h1>
        <p>${errorMessage}</p>
        <a href="Register.jsp">Try Again</a>
        <a href="Restaurant.jsp" class="secondary">Go to Home</a>
    </div>
</body>
</html>
