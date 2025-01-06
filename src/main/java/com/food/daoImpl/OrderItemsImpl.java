package com.food.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.ResultSet;
//import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderItemsDAO;
import com.food.model.OrderItems;
import com.food.util.DBConnectionUtil;


public class OrderItemsImpl implements OrderItemsDAO {
	
	static ArrayList<OrderItems> orderItemsList=new ArrayList<OrderItems>();
	private static final  String INSERTQUERY = "Insert into OrderItems(orderItemId,orderId,menuId,quantity,itemTotal) "
			                                   + "values(?,?,?,?,?)";
	static final String SELECT_BY_ORDERID_QUERY = "SELECT * FROM `Orderitems` WHERE `orderId`=?";
//	private static final  String FETCHALL = "select * from OrderItems";
//	private static final  String FETCHONE = "select * from OrderItems where orderItemId=? ";
//	private static final  String UPDATE = "update OrderItems set quantity=? where orderItemId=? ";
//	private static final  String DELETE = "delete from OrderItems where orderItemId=? ";

    static Connection con;
	
	static {
		con = DBConnectionUtil.connect();
	}

	private PreparedStatement pstmt;
//	private Statement stmt;
//	private ResultSet resultSet;
//	private OrderItems oi;


	@Override
	public int insert(OrderItems oi) {
		try {
			pstmt = con.prepareStatement(INSERTQUERY);
			pstmt.setInt(1, oi.getOrderItemId());
			pstmt.setInt(2, oi.getOrderId());
			pstmt.setInt(3, oi.getMenuId());
			pstmt.setInt(4, oi.getQuantity());
			pstmt.setDouble(5, oi.getItemTotal());
		
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	 @Override
	    public List<OrderItems> getAllByOrderId(int orderId) {
	        List<OrderItems> orderItemsList = new ArrayList<>();
	        try (PreparedStatement pstmt = con.prepareStatement(SELECT_BY_ORDERID_QUERY)) {
	            pstmt.setInt(1, orderId);
	            ResultSet res = pstmt.executeQuery();
	            while (res.next()) {
	                orderItemsList.add(new OrderItems(
	                    res.getInt("orderItemId"),
	                    res.getInt("orderId"),
	                    res.getInt("menuId"),
	                    res.getInt("quantity"),
	                    res.getDouble("itemTotal")
	                ));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderItemsList;
	    }

//	@Override
//	public ArrayList<OrderItems> fetchAll() {
//		try {
//			stmt = con.createStatement();
//			resultSet = stmt.executeQuery(FETCHALL);
//			orderItemsList = extractOrderItemsListFromResultSet(resultSet);
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return orderItemsList;
//	}
//
//	@Override
//	public OrderItems fetchOne(int orderItemId) {
//		try {
//			pstmt = con.prepareStatement(FETCHONE);
//			pstmt.setInt(1, orderItemId);
//			resultSet = pstmt.executeQuery();
//			
//			oi = extractOrderItemsListFromResultSet(resultSet).get(0);
//			
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return oi;
//	}
//	
//    ArrayList<OrderItems> extractOrderItemsListFromResultSet(ResultSet resultSet) {
//		
//		try {
//		while(resultSet.next()) {
//			
//			orderItemsList.add(new OrderItems(
//						resultSet.getInt("orderItemId"),
//						resultSet.getInt("orderId"),
//						resultSet.getInt("menuId"),
//						resultSet.getInt("quantity"),
//						resultSet.getFloat("itemTotal")));
//			}
//		
//		}
//			catch(Exception e) {
//				e.printStackTrace();
//			
//		}
//		return orderItemsList;
//	}
//
//
//	@Override
//	public int update(int orderItemId, int quantity) {
//		try {
//			pstmt = con.prepareStatement(UPDATE);
//			pstmt.setInt(1, quantity);
//			pstmt.setInt(2, orderItemId);
//			return pstmt.executeUpdate();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//			return 0;
//		}
//	}
//
//	@Override
//	public int delete(int orderItemId) {
//		try {
//			pstmt = con.prepareStatement(DELETE);
//			pstmt.setInt(1, orderItemId);
//			return pstmt.executeUpdate();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//			return 0;
//		}
//	}

}






