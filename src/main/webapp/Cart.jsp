<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.CartItem" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="com.food.model.Cart" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        h2 {
            color: #F96E2A;
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .empty-cart {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .empty-cart p {
            font-size: 1.2rem;
            color: #666;
            margin-bottom: 20px;
        }

        .cart-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #eee;
        }

        .item-details {
            flex: 1;
        }

        .item-details h3 {
            color: #333;
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .item-details p {
            color: #666;
            margin: 5px 0;
        }

        .item-controls {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-controls button {
            background: #6c757d;
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 1.2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .quantity-controls button:hover {
            
             background: #B6CBBD;
            transform: scale(1.1);
        }

        .quantity-controls span {
            font-weight: bold;
            min-width: 30px;
            text-align: center;
        }

        .delete-btn {
            background: red;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background: #c82333;
            transform: translateY(-2px);
        }

        .cart-summary {
            background: #f8f9fa;
            padding: 20px;
            text-align: right;
        }

        .cart-summary h3 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
        }

        .btn {
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .add-more {
            background: #6c757d;
            color: white;
        }

        .add-more:hover {
            background: #5a6268;
            color: white;
            transform: translateY(-2px);
        }

        .checkout {
            background: #28a745;
            color: white;
        }

        .checkout:hover {
            background: #218838;
            color: white;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .cart-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .item-controls {
                width: 100%;
                justify-content: space-between;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-shopping-cart me-2"></i>Shopping Cart</h2>

        <%
            Cart cart = (Cart) session.getAttribute("cart");
            int restaurantId = 0;

            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            if (!cart.getAllItems().isEmpty()) {
                restaurantId = cart.getAllItems().values().iterator().next().getRestaurantId();
            }

            if (cart.getAllItems().isEmpty()) {
        %>
            <div class="empty-cart">
                <i class="fas fa-shopping-basket fa-3x mb-3" style="color: #ccc;"></i>
                <p>Your cart is empty</p>
                <a href="menu?restaurantId=<%= restaurantId %>" class="btn add-more">
                    <i class="fas fa-utensils me-2"></i>Browse Menu
                </a>
            </div>
        <%
            } else {
                float totalAmount = 0;
        %>
            <div class="cart-container">
                <% 
                    for (Map.Entry<Integer, CartItem> entry : cart.getAllItems().entrySet()) {
                        CartItem item = entry.getValue();
                        double itemTotal = item.getPrice() * item.getQuantity();
                        totalAmount += itemTotal;
                %>
                    <div class="cart-item">
                        <div class="item-details">
                            <h3><%= item.getName() %></h3>
                            <p>Price: ₹<%= String.format("%.2f", item.getPrice()) %></p>
                            <p>Total: ₹<%= String.format("%.2f", itemTotal) %></p>
                        </div>
                        <div class="item-controls">
                            <form action="cart" method="post" class="quantity-controls">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                <button type="submit" name="quantity" value="<%= Math.max(1, item.getQuantity() - 1) %>">-</button>
                                <span><%= item.getQuantity() %></span>
                                <button type="submit" name="quantity" value="<%= item.getQuantity() + 1 %>">+</button>
                            </form>
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                                <button type="submit" class="delete-btn">
                                    <i class="fas fa-trash-alt"></i> Remove
                                </button>
                            </form>
                        </div>
                    </div>
                <%
                    }
                
                %>
                <%session.setAttribute("restaurantId",restaurantId); %>
                <%session.setAttribute("totalAmount",totalAmount); %>
                <div class="cart-summary">
                    <h3>Total Amount: ₹<%= String.format("%.2f", totalAmount) %></h3>
                    <div class="action-buttons">
                        <a href="menu?restaurantId=<%= restaurantId %>" class="btn add-more">
                            <i class="fas fa-plus me-2"></i>Add More Items
                        </a>
                        <a href="Checkout.jsp" class="btn checkout">
                            <i class="fas fa-shopping-cart me-2"></i>Proceed to Checkout
                        </a>
                    </div>
                </div>
            </div>
        <%
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>