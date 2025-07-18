package com.food.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.food.dao.UserDao;
import com.food.model.User;
import com.food.util.DBConnectionUtil;



public class UserDaoImpl implements UserDao {

	static ArrayList<User> userList=new ArrayList<User>();
	private static final  String INSERTQUERY = "Insert into user(username,password,email,address) values(?,?,?,?)";
	private static final  String FETCHALL = "select * from user";
	private static final  String FETCHONE = "select * from user where userid=? ";
	private static final  String UPDATE = "update user set password=? where userId=? ";
	private static final  String DELETE = "delete from user where userid=? ";
	private static final  String FETCH = "select * from user where email=? ";
	
	static Connection con;
	
	static {
		con = DBConnectionUtil.connect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private User u;


	@Override
	public int insert(User u) {
		try {
			pstmt = con.prepareStatement(INSERTQUERY);
			
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<User> fetchAll() {
		try {
			stmt = con.createStatement();
			resultSet = stmt.executeQuery(FETCHALL);
			userList = extractUserListFromResultSet(resultSet);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return userList;
		
	}

	@Override
	public User fetchOne(int userid) {
		try {
			pstmt = con.prepareStatement(FETCHONE);
			pstmt.setInt(1, userid);
			resultSet = pstmt.executeQuery();
			
			u = extractUserListFromResultSet(resultSet).get(0);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}

	ArrayList<User> extractUserListFromResultSet(ResultSet resultSet) {
		
		try {
		while(resultSet.next()) {
			
				userList.add(new User(
						
						resultSet.getString("userName"),
						resultSet.getString("password"),
						resultSet.getString("email"),
						resultSet.getString("address")));
			}
		
		}
			catch(Exception e) {
				e.printStackTrace();
			
		}
		return userList;
	}

	@Override
	public int update(int userid,String password) {
		try {
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, password);
			pstmt.setInt(2, userid);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public int delete(int userid) {
		try {
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, userid);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public User fetch(String email) {
		try {
			pstmt = con.prepareStatement(FETCH);
			pstmt.setString(1, email);
			resultSet = pstmt.executeQuery();
			
			u = extractUserListFromResultSet(resultSet).get(0);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public User getUserByUsername(String username) {
		try {
			pstmt = con.prepareStatement(FETCHONE);
			pstmt.setString(1, username);
			resultSet = pstmt.executeQuery();
			
			u = extractUserListFromResultSet(resultSet).get(0);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}

}
