package com.food.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import com.food.dao.OrdersDAO;
import com.food.daoImpl.OrderItemsImpl;
import com.food.daoImpl.OrdersImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.OrderItems;
import com.food.model.Orders;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class Checkout extends HttpServlet {

    private OrdersImpl orderDao;
    private String restaurantId;

    @Override
    public void init() throws ServletException {
        try {
            orderDao = new OrdersImpl();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");

       

        if (cart != null && user != null && !cart.getAllItems().isEmpty()) {
            System.out.println("Inside checkoutServlet IF is true");

            // Extract checkout form data
            String paymentMethod = request.getParameter("paymentMode");
            System.out.println("Payment Method: " + paymentMethod);

            // Dynamically calculate total amount from cart
            float orderTotalAmount = (float) cart.getAllItems().values().stream()
                    .mapToDouble(item -> item.getPrice() * item.getQuantity())
                    .sum();
//            session.setAttribute("totalAmount", orderTotalAmount);
            

            System.out.println("Calculated Total Amount: " + orderTotalAmount);
            
            Integer restaurantId = (Integer) session.getAttribute("restaurantId");
            float totalAmount = (Float) session.getAttribute("totalAmount");
            System.out.println(restaurantId);
           

            // Create and populate the order object
            Orders order = new Orders();
            order.setUserId(user.getUserId());

            // Set the restaurantId for the order
            order.setRestaurantId(restaurantId);
            order.setTotalAmount(orderTotalAmount);
            order.setPaymentMode(paymentMethod);
            order.setStatus("Pending");

            OrdersDAO orderdao = new OrdersImpl();
            int orderId = orderdao.insert(order);  // Ensure this returns the generated orderId
            System.out.println("Generated Order ID: " + orderId);

            if (orderId > 0) {
                OrderItemsImpl orderItemsImpl = new OrderItemsImpl();
                int x = 0;

                for (Map.Entry<Integer, CartItem> entry : cart.getAllItems().entrySet()) {
                    CartItem item = entry.getValue();
                    int itemTotal = (int) (item.getPrice() * item.getQuantity());
                    System.out.println("Inserting OrderItem: ItemID = " + item.getItemId() + ", Quantity = " + item.getQuantity() + ", Total = " + itemTotal);
                    x = orderItemsImpl.insert(new OrderItems(0, orderId, item.getItemId(), item.getQuantity(), itemTotal));
                }

                if (x != 0) {
                    session.removeAttribute("cart");
                    response.sendRedirect("ConfirmOrder.jsp");
                } else {
                    response.sendRedirect("home1.jsp");
                }
            } else {
                System.out.println("Failed to insert order.");
                // response.sendRedirect("errorPage.jsp");  // Redirect to error page if orderId is invalid
            }
        } else {
            System.out.println("Cart is empty or user not logged in.");
            // response.sendRedirect("cart.jsp");
        }
    }

}
