package com.food.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.food.model.User;
import com.food.secure.DecryptData;
import com.food.secure.EncryptData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet res;

    private String checkEmail = "SELECT * FROM user WHERE email=?";
	

    @Override
    public void init() throws ServletException {
        String url = "jdbc:mysql://localhost:3306/foodapp";
        String dbUn = "root";
        String dbPwd = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, dbUn, dbPwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String email = EncryptData.encrypt(req.getParameter("email"));
        String password = EncryptData.encrypt(req.getParameter("password"));

        try {
            pstmt = con.prepareStatement(checkEmail);
            pstmt.setString(1, email);
            res = pstmt.executeQuery();

            if (res.next()) {
                if (password.equals(res.getString("password"))) {
                    
                    User user = new User();
                    user.setUserId(res.getInt("userId"));
                    user.setUserName(DecryptData.decrypt(res.getString("username")));
                    user.setPassword(DecryptData.decrypt(res.getString("password")));
                    user.setEmail(DecryptData.decrypt(res.getString("email")));
                    user.setAddress(DecryptData.decrypt(res.getString("address")));
                    
                    
                    System.out.println(user);

                   
                    session.setAttribute("user", user);
                  

                    Cookie ck1 = new Cookie("username", user.getUserName());
                    ck1.setMaxAge(20);
                    resp.addCookie(ck1);

                  
                    String username=res.getString("username");

                    session.setAttribute("username", DecryptData.decrypt(username));

                    
                    req.getRequestDispatcher("getAllRestaurants").forward(req, resp);
                } else {
                    resp.sendRedirect("passwordMismatch.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("errorPage.jsp"); 
        }
    }

    @Override
    public void destroy() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}