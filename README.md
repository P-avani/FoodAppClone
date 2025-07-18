🍽️ **Bite Sphere - Food Ordering Web Application**

🚀 **Bite Sphere** is a feature-rich food ordering application designed to make browsing, ordering, and enjoying delicious meals simple and interactive.
Built with a modular architecture, it combines a dynamic user interface with a robust backend for a seamless user experience.

🌟 Key Features

- 🍽️ **Diverse Menu Browsing**: Explore a wide variety of cuisines and dishes through a clean and user-friendly interface.
- 🛒 **Seamless Order Placement**: Place orders quickly and effortlessly with a few clicks.
- 🎨 **Interactive Frontend**: Developed using **HTML**, **CSS**, and **JavaScript** for responsive and appealing design.
- 🛠️ **Robust Backend**: Built using **Java (JSE, JEE)** and **JDBC** to handle complex backend operations smoothly.
- 🗄️ **Database Integration**: Efficiently manages user data, orders, and products through **MySQL**.


⚙️ **Technologies Used**

 **Frontend:**
- HTML
- CSS
- JavaScript

 **Backend:**
- Java SE (JDK)
- Java EE (Servlets, JSP)
- JDBC for Database Connectivity

 **Database:**
- MySQL

📥 **Installation / Setup Instructions**

✅ **Prerequisites**

-Java Development Kit (JDK 8 or above)

-Apache Tomcat Server (Version 9 or above)

-MySQL Database

-IDE (Eclipse)

📝 **Steps to Setup the Project Locally**

**1.Clone the Repository**
 
  git clone https://github.com/YourUsername/BiteSphere.git

**2.Import Project into IDE**
  -Open your preferred IDE.
  
  -Import the project as a Dynamic Web Project (for Eclipse) or Maven/Gradle project based on your setup.

**3.Database Setup**
  
  -Open MySQL Workbench or command line.
  
  -Create a new database.
  
  -Import the provided SQL script in the project to create necessary tables and insert sample data.

**4.Configure Database Connection**
 
  -Navigate to the dbConnection/DBConnection.java file.
 
  -Update your database URL, username, and password:
  
   String url = "jdbc:mysql://localhost:3306/foodapp";
   String user = "your_username";
   String password = "your_password";

**5. Deploy on Server**
 
  -Configure Tomcat Server in your IDE.
 
  -Deploy the project to Tomcat or generate .war file and place it in Tomcat's webapps directory.

**6.Run the Project**
 
  -Start the Tomcat server.
 
  -Visit http://localhost:8080/BiteSphere/ in your browser.


**Project Structure**
FoodClone/
│
├── 📂 model/                        
│   └── Contains Java classes (POJOs) 
│       ├── User.java               
│       ├── Product.java             
│       ├── Cart.java               
│       └── Order.java               
├── 📂 dao/                          
│   └── Contains interfaces that define abstract methods for:
│       ├── UserDAO.java           
│       ├── ProductDAO.java         
│       ├── CartDAO.java        
│       └── OrderDAO.java         
├── 📂 daoImpl/                      
│   └── Implements DAO interfaces using **JDBC** for database operations:
│       ├── UserDAOImpl.java         
│       ├── ProductDAOImpl.java     
│       ├── CartDAOImpl.java         
│       └── OrderDAOImpl.java        
├── 📂 servlet/                      
│   └── Java **Servlets** that handle HTTP requests from the frontend and interact with DAO classes:
│       ├── LoginServlet.java        
│       ├── RegisterServlet.java     
│       ├── ProductListServlet.java  
│       ├── CartServlet.java         
│       └── OrderServlet.java       
├── 📂 dbConnection/                 
│   └── DBConnection.java          
├── 📂 jsp/                          
│   └── Contains frontend **JSP (Java Server Pages)** for dynamic UI:
│       ├── index.jsp              
│       ├── login.jsp              
│       ├── register.jsp          
│       ├── menu.jsp                
│       ├── cart.jsp                
│       ├── order.jsp               
│       └── admin.jsp (optional)    
├── 📂 SQL_Scripts/                  
│   └── Database schema files: 
├── 📄 README.md                     
│   └── Project documentation 
└── 📄 web.xml                       
    └── Servlet mappings and configuration file (located under WEB-INF)

    📜 License
This project is licensed under the MIT License. See the LICENSE file for more details.

