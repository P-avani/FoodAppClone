package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.daoImpl.RestaurantDaoImpl;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;





public class getAllRestaurants extends HttpServlet {
	

	    private static final long serialVersionUID = 1L;

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Fetch all restaurants from the database
	        RestaurantDaoImpl restaurantDao = new RestaurantDaoImpl();
	        List<Restaurant> restaurantList = restaurantDao.fetchAll(); // Fetch all restaurants

	        HttpSession session = request.getSession();
	        session.setAttribute("restaurantList", restaurantList); // Store the list in session

	      
	        // Redirect to the page where restaurants are displayed
	        response.sendRedirect("home.jsp");
	    
	    }
	}


