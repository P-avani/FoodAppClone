<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - FoodApp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1000&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            padding: 20px;
            position: relative;
              backdrop-filter: blur(2px);
        }
        


        .register-container {
            width: 100%;
            max-width: 450px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            padding: 40px;
        }

       
        .app-logo {
            width: 80px;
            height: 80px;
            padding: 10px;
            background: #fff;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        h1 {
            color: #333;
            font-size: 2em;
            margin-bottom: 10px;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 0.95em;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            transition: all 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #ff5e62;
            box-shadow: 0 0 0 3px rgba(255, 94, 98, 0.1);
        }

        button {
            width: 100%;
            background: #F96E2A;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 20px;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 94, 98, 0.3);
        }
         button a{
         color: white;
         
         }
         

        .divider {
            margin: 25px 0;
            text-align: center;
            position: relative;
        }

        .divider::before,
        .divider::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 45%;
            height: 1px;
            background: #ddd;
        }

        .divider::before { left: 0; }
        .divider::after { right: 0; }

        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 25px;
        }

        .social-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ddd;
            cursor: pointer;
            transition: all 0.3s;
        }

        .social-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .signin-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }

        .signin-link a {
            color: #F96E2A;
            text-decoration: none;
            font-weight: bold;
        }

        .signin-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .register-container {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="logo-container">
           
            <h1>Create Account</h1>
            <p class="subtitle">Sign up to get started with BiteSphere</p>
        </div>

        <form action="Register" method="post">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="username" placeholder="Username" required>
            </div>

            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required>
            </div>

            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="cpassword" placeholder="Confirm Password" required>
            </div>

            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" placeholder="Email Address" required>
            </div>

            <div class="input-group">
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" name="address" placeholder="Address" required>
            </div>

            <button type="submit">
                <i class="fas fa-user-plus"></i>
                Sign Up
            </button>
             <button type="submit">
               <a href="Restaurant.jsp">Go Back</a>
            </button>
        </form>

        <div class="divider">or</div>

        <div class="social-login">
            <div class="social-btn">
                <i class="fab fa-google" style="color: #DB4437;"></i>
            </div>
            <div class="social-btn">
                <i class="fab fa-facebook-f" style="color: #4267B2;"></i>
            </div>
            <div class="social-btn">
                <i class="fab fa-apple" style="color: #000;"></i>
            </div>
        </div>

        <p class="signin-link">
            Already have an account? <a href="Login.jsp">Sign In</a>
        </p>
    </div>
</body>
</html>