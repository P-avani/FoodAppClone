<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BiteSphere Restaurant</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Basic Reset and Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4; 
        }

        /* Navbar Styles */
        .navbar {
            background-color: #F96E2A;
            padding: 1rem 2rem;
            position: fixed;
            width: 100%;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

       
      
           .navbar-brand img {
    height: 50px; 
    width: auto;
    object-fit: contain; 
    display: block; 
    margin: 0 auto;
}

.navbar-brand {
    display: flex;
    align-items: center; 
    justify-content: center; 
    text-decoration: none;
    margin-left: 20px; 
}
.navbar-brand span {
    font-size: 20px;
    font-weight: bold;
    color: white; 
    letter-spacing: 1px; 
    white-space: nowrap; 
}

        .nav-links {
            display: flex;
            gap: 1.5rem;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }

        .nav-links a:hover {
            color: #FFC107;
        }

        /* Hero Section Styles */
        .hero {
            min-height: 60vh; 
            display: flex;
            align-items: center;
            padding: 2rem;
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
                        url('Images/piza.jpg') center/cover no-repeat;
        }

        .hero-text {
            color: white;
            max-width: 600px;
        }

        .hero-heading {
            font-size: 3rem;
            margin: 1rem 0;
        }

        .hero-heading span {
            color: #FFC107;
        }

        .hero-description {
            font-size: 1.2rem;
            line-height: 1.6;
        }
     .section-heading {
            text-align: center;
            font-size: 2rem;
            margin: 2rem 0;
            color: #333;
        }

        /* Restaurant Cards Styles */
        .restaurant-cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 2rem;
        }

        .restaurant-card {
            background-color: white;
            border-radius: 10px;
            padding: 1rem;
            width: calc(25% - 20px);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .restaurant-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
        }

        .restaurant-card h2 {
            font-size: 1.5rem;
            margin: 1rem 0;
        }

        .restaurant-card p {
            font-size: 1rem;
            margin: 0.5rem 0;
        }

        .restaurant-card .stars {
            color: #FFC107;
        }
        /* Footer Styles */
.footer {
    background-color: #333;
    color: white;
    padding: 40px 20px;
    font-family: Arial, sans-serif;
}

.footer-container {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 20px;
    max-width: 1200px;
    margin: 0 auto;
}

.footer-contact, .footer-links, .footer-social {
    flex: 1;
    min-width: 250px;
    padding: 10px;
}

.footer-contact h3, .footer-links h3, .footer-social h3 {
    font-size: 1.5rem;
    margin-bottom: 1rem;
}

.footer-contact p, .footer-links ul li, .footer-links ul li a {
    font-size: 1rem;
    margin: 0.5rem 0;
}

.footer-links ul {
    list-style: none;
    padding: 0;
}

.footer-links a {
    text-decoration: none;
    color: white;
    font-weight: 500;
}

.footer-links a:hover {
    color: #FFC107;
}

.footer-social a {
    font-size: 1.5rem;
    margin-right: 15px;
    color: white;
    transition: color 0.3s;
}

.footer-social a:hover {
    color: #FFC107;
}

.footer-bottom {
    text-align: center;
    margin-top: 30px;
}

.footer-bottom p {
    font-size: 1rem;
}

/* Responsive Design */
@media (max-width: 768px) {
    .footer-container {
        flex-direction: column;
        text-align: center;
    }
}
        

        /* Responsive Design */
        @media (max-width: 768px) {
            .restaurant-card {
                width: calc(50% - 20px);
            }
        }

        @media (max-width: 480px) {
            .restaurant-card {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <a class="navbar-brand" href="#">
                  <img src="Images/Yellow and Black Minimalist Catering Logo (6).png" alt="TapFoods Logo">
                  <span>Bite Sphere</span>
            </a>
        
        <div class="nav-links">
            <a href="Restaurant.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="Help.jsp"><i class="fa-solid fa-circle-info"></i> Help</a>
            <a href="Register.jsp"><i class="fas fa-user-plus"></i> Sign Up</a>
            <a href="Login.jsp"><i class="fas fa-sign-in-alt"></i> Sign In</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-text">
            <h1 class="hero-heading">
                DELICIOUS
                <span>FOOD</span>
            </h1>
            <p class="hero-description">
                Our restaurant provides a variety of delicious food, prioritizing the 
                quality of ingredients used.
            </p>
        </div>
    </section>

    <!-- Restaurant Cards Section -->
    <h1 class="section-heading">Popular Restaurants</h1>
    <section class="restaurant-cards">
        <div class="restaurant-card">
            <img src="Images/indian.jpg" alt="Karavalli">
            <h2>Karavalli</h2>
            <p>Indian Cuisine</p>
            <p class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </p>
            <p>Ground Floor, Gateway Hotel, Residency Road, Bangalore 560025</p>
        </div>
        <div class="restaurant-card">
            <img src="Images/India.jpg" alt="Loya">
            <h2>Loya</h2>
            <p>Indian Cuisine</p>
            <p class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </p>
            <p>Bangalore 560001, Karnataka</p>
        </div>
        <div class="restaurant-card">
            <img src="Images/Europe.jpg" alt="Koshy's">
            <h2>Koshy's</h2>
            <p>Indian & European Cuisine</p>
            <p class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </p>
            <p>39, St. Marks Road, Bangalore 560001</p>
        </div>
        <div class="restaurant-card">
            <img src="Images/south.jpg" alt="Vidyarthi Bhavan">
            <h2>Vidyarthi Bhavan</h2>
            <p>South Indian Cuisine</p>
            <p class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </p>
            <p>32, Gandhi Bazaar Rd, Bangalore 560004</p>
        </div>
        <div class="restaurant-card">
            <img src="Images/cafe.jpg" alt="Smally's Resto Cafe">
            <h2>Smally's Resto Cafe</h2>
            <p>Café</p>
            <p class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </p>
            <p>24, 4th B Cross Road, Bangalore 560034</p>
        </div>
        <!-- New Restaurants -->
        <div class="restaurant-card">
            <img src="Images/italian.jpg" alt="The Pizza Bakery">
            <h2>The Pizza Bakery</h2>
            <p>Italian Cuisine</p>
            <p class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <i class="fas fa-star-half-alt"></i>
            </p>
            <p>4th Block, Jayanagar, Bangalore 560011</p>
        </div>
        <div class="restaurant-card">
            <img src="Images/fastfood.jpg" alt="Burger King">
            <h2>Burger King</h2>
            <p>Fast Food</p>
            <p class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </p>
            <p>Koramangala, Bangalore 560034</p>
        </div>
        <div class="restaurant-card">
            <img src="Images/Japanese.jpg" alt="Sushi House">
            <h2>Sushi House</h2>
            <p>Japanese Cuisine</p>
            <p class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <i class="fas fa-star-half-alt"></i>
            </p>
            <p>Indiranagar, Bangalore 560038</p>
        </div>
    </section>
    <footer class="footer">
    <div class="footer-container">
        <!-- Contact Us Section -->
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p>Email: support@bitesphere.com</p>
            <p>Phone: +91 123 456 7890</p>
            <p>Address: 123 Food Street, Bangalore, 560001</p>
        </div>

        <!-- Useful Links Section -->
        <div class="footer-links">
            <h3>Useful Links</h3>
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Terms & Conditions</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </div>

        <!-- Social Media Section -->
        <div class="footer-social">
            <h3>Follow Us</h3>
            <a href="#" class="social-icon"><i class="fab fa-facebook"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-linkedin"></i></a>
        </div>
    </div>
    
    <!-- Footer Bottom -->
    <div class="footer-bottom">
        <p>&copy; 2025 BiteSphere. All rights reserved.</p>
    </div>
</footer>
    
</body>
</html>