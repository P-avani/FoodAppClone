package com.food.dao;

import java.util.List;

import com.food.model.Menu;

public interface MenuDao {

	List<Menu> fetchMenuByRestaurant(int restaurantId);

	Menu getMenu(int menuId);


	
}
