package com.food.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.food.dao.OrdersDAO;
import com.food.model.Orders;
import com.food.util.DBConnectionUtil;


public class OrdersImpl implements OrdersDAO {

	static ArrayList<Orders> ordersList=new ArrayList<Orders>();
	
//	private static final  String FETCHALL = "select * from Orders";
//	private static final  String FETCHONE = "select * from Orders where orderId=? ";
//	private static final  String UPDATE = "update Orders set status=? where orderId=? ";
//	private static final  String DELETE = "delete from Orders where orderId=? ";

    static Connection con;
	
	static {
		con = DBConnectionUtil.connect();
	}

//	private PreparedStatement pstmt;
//	private Statement stmt;
//	private ResultSet resultSet;
//	private Orders o;
//	private int orderId;
//	

	 @Override
	    public int insert(Orders order) {
	        int orderId = 0;
	        String query = "INSERT INTO orders (userId, restaurantId, totalAmount, paymentMode, status) VALUES (?, ?, ?, ?, ?)";
	        
	        try (PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
	            stmt.setInt(1, order.getUserId());
	            stmt.setInt(2, order.getRestaurantId());
	            stmt.setFloat(3, order.getTotalAmount());
	            stmt.setString(4, order.getPaymentMode());
	            stmt.setString(5, order.getStatus());

	            int rowsAffected = stmt.executeUpdate();
	            if (rowsAffected > 0) {
	                try (ResultSet rs = stmt.getGeneratedKeys()) {
	                    if (rs.next()) {
	                        orderId = rs.getInt(1);  
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderId; 
	    }
//	@Override
//	public ArrayList<Orders> fetchAll() {
//		try {
//			stmt = con.createStatement();
//			resultSet = stmt.executeQuery(FETCHALL);
//			ordersList = extractOrdersListFromResultSet(resultSet);
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return ordersList;
//	}

//	@Override
//	public Orders fetchOne(int orderId) {
//		try {
//			pstmt = con.prepareStatement(FETCHONE);
//			pstmt.setInt(1, orderId);
//			resultSet = pstmt.executeQuery();
//			
//			o = extractOrdersListFromResultSet(resultSet).get(0);
//			
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		return o;
//	}

//     ArrayList<Orders> extractOrdersListFromResultSet(ResultSet resultSet) {
//		
//		try {
//		while(resultSet.next()) {
//			
//				ordersList.add(new Orders(
//						resultSet.getInt("orderId"),
//						resultSet.getInt("userId"),
//						resultSet.getInt("restaurantId"),
//						resultSet.getFloat("totalAmount"),
//						resultSet.getString("status"),
//						resultSet.getString("paymentMode")));
//			}
//		
//		}
//			catch(Exception e) {
//				e.printStackTrace();
//			
//		}
//		return ordersList;
//	}
//	@Override
//	public int update(int orderId, String status) {
//		try {
//			pstmt = con.prepareStatement(UPDATE);
//			pstmt.setString(1, status);
//			pstmt.setInt(2, orderId);
//			return pstmt.executeUpdate();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//			return 0;
//		}
//	}
//
//	@Override
//	public int delete(int orderId) {
//		try {
//			pstmt = con.prepareStatement(DELETE);
//			pstmt.setInt(1, orderId);
//			return pstmt.executeUpdate();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//			return 0;
//		}
//	}
}
