package com.food.dao;

import java.util.List;

//import java.util.ArrayList;

import com.food.model.OrderItems;

public interface OrderItemsDAO {
	
	int insert(OrderItems oi);
	List<OrderItems> getAllByOrderId(int orderId);
//	ArrayList<OrderItems> fetchAll();
//	OrderItems fetchOne(int orderItemId);
//	int update(int orderItemId,int quantity);
//	int delete(int orderItemId);
 
}
