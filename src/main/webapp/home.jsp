<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*,com.food.model.Restaurant" %>
<%@ page import="java.util.stream.Collectors" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food App</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #F96E2A;
            --secondary-color: #2ecc71;
            --hover-color: #ff6b81;
        }
        
        body {
            background-color: #f8f9fa;
        }
        
        .navbar {
            background-color: var(--primary-color);
            padding: 15px 0;
        }
        
        .navbar-brand {
            color: white !important;
            font-size: 24px;
            font-weight: bold;
        }
         .nav-center {
            display: flex;
            gap: 2rem;
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
        

        .nav-center a {
            text-decoration: none;
            color: white;
            font-weight: 500;
            padding: 8px 15px;
            border-radius: 20px;
            transition: all 0.3s;
        }

        .nav-center a:hover {
           
            color: white;
        }
        .search-container {
            background-color: white;
            padding: 20px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            position: sticky;
            top: 70px;
            z-index: 100;
        }

        .search-wrapper {
            position: relative;
            max-width: 600px;
            margin: 0 auto;
        }

        .search-input {
            width: 100%;
            padding: 12px 20px 12px 45px;
            border: 2px solid #e0e0e0;
            border-radius: 25px;
            font-size: 16px;
            transition: all 0.3s;
            background-color: #f8f9fa;
        }

        .search-input:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            font-size: 18px;
        }
        
        .profile-section {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .profile-icon {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            cursor: pointer;
            border: 2px solid white;
            padding: 2px;
            background-color: white;
        }
        
        .cuisine-filters {
            padding: 50px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            margin-bottom: 25px;
           
            display: flex;
            gap: 15px;
        }

        .cuisine-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            cursor: pointer;
            transition: transform 0.3s;
            min-width: 80px;
        }

        .cuisine-item:hover {
            transform: translateY(-3px);
        }

        .cuisine-image {
            width: 70px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 8px;
            border: 2px solid transparent;
            transition: border-color 0.3s;
        }

        .cuisine-item.active .cuisine-image {
            border-color: var(--primary-color);
        }

        .cuisine-name {
            font-size: 12px;
            color: #333;
            text-align: center;
            font-weight: 500;
        }

        .restaurant-card {
            transition: transform 0.3s;
            margin-bottom: 20px;
            border-radius: 15px;
            overflow: hidden;
            height: 100%;
            border: none;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        }
        
        .restaurant-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
        
        .restaurant-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .badge-rating {
            background-color: var(--secondary-color);
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
            font-weight: 500;
        }
        
        .cuisine-type-highlight {
            background-color: #ffeaa7;
            padding: 5px 12px;
            border-radius: 20px;
            color: #d35400;
            font-weight: 500;
            display: inline-block;
            font-size: 0.9rem;
        }
        
        .dropdown-menu {
            border: none;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            padding: 10px;
        }
        
        .dropdown-item {
            padding: 8px 15px;
            border-radius: 5px;
        }
        
        .dropdown-item:hover {
            background-color: #f8f9fa;
        }
        
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .status-open {
            background-color: #e3fcef;
            color: #2ecc71;
        }
        
        .status-closed {
            background-color: #ffe5e5;
            color: #ff4757;
        }
         .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 3rem;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                  <img src="Images/Yellow and Black Minimalist Catering Logo (6).png" alt="TapFoods Logo">
                  <span>Bite Sphere</span>
            </a>
             <div class="nav-center">
            <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="home.jsp"><i class="fas fa-utensils"></i> Restaurants</a>
            <a href="#"><i class="fas fa-shopping-bag"></i> Orders</a>
            <a href="About.jsp"><i class="fas fa-info-circle"></i> About</a>
            <a href="Login.jsp"><i class="fas fa-sign-out-alt me-2"></i> Logout</a>
        </div>
            <div class="profile-section">
               
                <div class="dropdown">
                    <div class="d-flex align-items-center" data-bs-toggle="dropdown">
                     <span style="color: white;">Welcome! <% out.println(session.getAttribute("username"));  %></span>
                        <i class="fas fa-user-circle text-white" style="font-size: 2.2rem; cursor: pointer;"></i>
                         <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>My Profile</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-history me-2"></i>Orders</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-heart me-2"></i>Favorites</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-address-book me-2"></i>Addresses</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                    </ul>
                    </div>
                   
                </div>
            </div>
        </div>
    </nav>
     <div class="search-container">
        <div class="container">
            <div class="search-wrapper">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Search for restaurants, cuisines, or dishes...">
            </div>
        </div>
    </div>
    

   <div class="container mt-4">
        <!-- Cuisine Type Filters -->
        <div class="cuisine-filters">
            <div class="cuisine-item ">
                <img src="Images/C1.jpg" alt="All" class="cuisine-image">
                <span class="cuisine-name">Thai</span>
            </div>
            <div class="cuisine-item">
                <img src="Images/C2.jpg" alt="Desserts" class="cuisine-image">
                <span class="cuisine-name">Gulab jamun
                </span>
            </div>
            <div class="cuisine-item">
                <img src="Images/C3.jpg" alt="Chinese" class="cuisine-image">
                <span class="cuisine-name">Chinese</span>
            </div>
            <div class="cuisine-item">
                <img src="Images/C4.jpg" alt="Sea Food" class="cuisine-image">
                <span class="cuisine-name">Sweets</span>
            </div>
            <div class="cuisine-item">
                <img src="Images/C5.jpg" alt="Mughlai" class="cuisine-image">
                <span class="cuisine-name">Japanese</span>
            </div>
            <div class="cuisine-item">
                <img src="Images/C6.jpg" alt="Japanese" class="cuisine-image">
                <span class="cuisine-name">Desserts</span>
            </div>
             <div class="cuisine-item">
        <img src="Images/C7.jpg" alt="Desserts" class="cuisine-image">
        <span class="cuisine-name">Pizza</span>
    </div>
    <div class="cuisine-item">
        <img src="Images/C8.jpg" alt="Pizza" class="cuisine-image">
        <span class="cuisine-name">Burgers</span>
    </div>
    <div class="cuisine-item">
        <img src="Images/C9.jpg" alt="Burgers" class="cuisine-image">
        <span class="cuisine-name">Momos</span>
    </div>
     <div class="cuisine-item">
        <img src="Images/C10.jpg" alt="samosa" class="cuisine-image">
        <span class="cuisine-name">Kebab</span>
    </div>
     <div class="cuisine-item">
        <img src="Images/C11.jpg" class="cuisine-image">
        <span class="cuisine-name">North Indian</span>
    </div>
    <div class="cuisine-item">
        <img src="Images/C12.jpg" alt="North Indian" class="cuisine-image">
        <span class="cuisine-name">Bevverages</span>
    </div> <div class="cuisine-item">
        <img src="Images/C13.jpg" alt="Beverages" class="cuisine-image">
        <span class="cuisine-name">Sea food</span>
    </div>
        </div>
        
       

        <div class="row">
        <% 
        List<Restaurant> rList = (List<Restaurant>)session.getAttribute("restaurantList");
        for(Restaurant p : rList) { 
        %>
                <div class="col-md-4 mb-4">
                    <div class="card restaurant-card">
                    <a href="menu?restaurantId=<%= p.getRestaurantId() %>" class="card-image-link">
           
                        <img src="<%= p.getImagePath() %>" 
                             class="restaurant-image" 
                             alt="<%= p.getName() %>"
                             onerror="this.src='https://via.placeholder.com/300x200?text=Restaurant+Image'">
                             </a>
                       <div class="card-body">
    <div class="d-flex justify-content-between align-items-start mb-2">
        <h5 class="card-title mb-0" style="font-size: 1.1rem; font-weight: 600;"><%= p.getName() %></h5>
        <span class="badge-rating">
            <i class="fas fa-star"></i> <%= p.getRatings() %>
        </span>
    </div>
    
    <div class="d-flex justify-content-between align-items-center mb-2">
        <span class="cuisine-type-highlight">
            <i class="fas fa-utensils me-1"></i><%= p.getCuisineType() %>
        </span>
        <span class="delivery-time" style="font-size: 0.9rem;">
            <i class="fas fa-clock me-1"></i><%= p.getDeliveryTime() %> mins
        </span>
    </div>

    <p class="card-text small text-muted mb-2">
        <i class="fas fa-map-marker-alt me-2"></i><%= p.getAddress() %>
    </p>
    
    <div class="d-flex justify-content-between align-items-center">
        <% if(p.getIsActive()) { %>
            <span class="status-badge status-open">
                <i class="fas fa-circle me-1"></i>Open Now
            </span>
        <% } else { %>
            <span class="status-badge status-closed">
                <i class="fas fa-circle me-1"></i>Closed
            </span>
        <% } %>
       
    </div>
</div>

                    </div>
                </div>
            <% } %>
        </div>
    </div>
    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add click handlers for cuisine filters
        document.querySelectorAll('.cuisine-badge').forEach(badge => {
            badge.addEventListener('click', function() {
                document.querySelectorAll('.cuisine-badge').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                
                const selectedCuisine = this.textContent;
                const cards = document.querySelectorAll('.restaurant-card');
                
                cards.forEach(card => {
                    const cardCuisine = card.querySelector('.cuisine-type-highlight').textContent.trim();
                    const cardContainer = card.closest('.col-md-3');
                    
                    if(selectedCuisine === 'All' || cardCuisine.includes(selectedCuisine)) {
                        cardContainer.style.display = '';
                    } else {
                        cardContainer.style.display = 'none';
                    }
                });
            });
        });
    </script>
    
     <footer class="footer">
        <p>&copy; 2025 BiteSphere. All rights reserved.</p>
    </footer>
  
</body>
</html>