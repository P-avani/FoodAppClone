<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.food.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Menu</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin: 20px 0 30px;
            color: #333;
        }

        /* navbar styles */
      /* navbar styles */
.navbar {
    overflow: hidden;
    background-color: #F96E2A; /* Orange background */
    position: fixed;
    top: 0;
    width: 100%;
    padding: 10px 10px;
    display: flex;
    justify-content: flex-end; /* Align links to the right */
    gap: 10px; /* Space between links */
}

.navbar a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
}

.navbar a:hover {
    background-color: #F26B0F;
    color: black;
    border-radius: 30px;
}

.active {
    background-color: #4CAF50;
    color: white;
}


        .content {
            margin-top: 50px; /* Adjust for navbar height */
            height: auto;
        }

        /* menu-grid styles */
        .menu-grid {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }

        .menu-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            height: 160px;
            width: 100%;
            max-width: 800px;
            border: 1px solid #f0f0f0;
        }

        .menu-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .card-content {
            flex: 1;
            padding: 18px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
        }

        .item-name {
            font-size: 18px;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 6px;
        }

        .item-description {
            font-size: 13px;
            color: #636e72;
            line-height: 1.4;
            margin-bottom: 8px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .price {
            font-size: 18px;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 10px;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .add-button {
            background: #F96E2A; 
            color: white;
            border: none;
            padding: 8px 18px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 500;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .add-button:hover {
            background: #F96E2A; /* Match navbar color */
            transform: translateY(-1px);
        }

        .add-button::before {
            content: '+';
            font-size: 16px;
            font-weight: bold;
        }

        .availability-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .available {
            background-color: #e3fcef;
            color: #00b894;
        }

        .available::before {
            content: '✓';
            font-weight: bold;
        }

        .unavailable {
            background-color: #ffeaea;
            color: #ff5252;
        }

        .image-container {
            width: 160px;
            position: relative;
            overflow: hidden;
        }

        .menu-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .menu-card:hover .menu-image {
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .menu-card {
                height: auto;
                flex-direction: column;
            }

            .image-container {
                width: 100%;
                height: 140px;
            }

            .card-content {
                padding: 15px;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="home.jsp">Home</a> 
        <a href="About.jsp">About</a> 
        <a href="#">Contact</a> 
        <a href="#">Menu</a> 
       
    </div>

    <div class="content">
        <div class="container">
            <h1>Restaurant Menu</h1>
            
            <div class="menu-grid">
                <% 
                List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
                if (menuList != null && !menuList.isEmpty()) {
                    for (Menu menu : menuList) {
                %>
                    <div class="menu-card">
                        <div class="card-content">
                            <div>
                                <div class="item-name"><%= menu.getName() %></div>
                                <div class="item-description"><%= menu.getDescription() %></div>
                                <div class="price">₹<%= menu.getPrice() %></div>
                            </div>
                            
                            <div class="card-footer">
                                <span class="availability-badge <%= menu.getIsAvailable() ? "available" : "unavailable" %>">
                                    <%= menu.getIsAvailable() ? "Available" : "Not Available" %>
                                </span>
                                <form action="cart" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
                                    
                                    <button type="submit" class="add-button" >Add to cart</button>
                                </form>
                            </div>
                        </div>
                        
                        <div class="image-container">
                            <img src="<%= menu.getImagePath() %>" 
                                 class="menu-image" 
                                 alt="<%= menu.getName() %>"
                                 onerror="this.src='images/default-food.jpg'">
                        </div>
                    </div>
                <%
                    }
            
            } else {
            %>
                <div style="text-align: center; padding: 50px;">
                    <h3 style="color: #666;">No menu items available</h3>
                </div>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>