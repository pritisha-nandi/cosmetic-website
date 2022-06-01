<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mydb";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style2.css">
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <style>
      .pay{
          padding-left: 550px;
          display: inline-block;
      }
      .btn{
          border: none;
          outline: 0;
          padding: 25px;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 300px;
    }
    .btn:hover {
      background-color: #555;
      color: rgb(237, 49, 49);
    }
  
  </style>
  </head>
<body>
  <div class="topnav">
    <a href="#"> <img src="images/PIXIE BEAUTY.png" width="140px"></a>
    <div class="search-container">
      <form action="search.jsp" method="post">
        <input type="text" placeholder="Search.." name="search">
        <button type="submit" style="height: 40px"><i class="fa fa-search"></i></button>
      </form>
    </div>
  </div>
  <div class="topnav2">
        <a href="index2.html">Home</a>
        <a href="membership/contact.html">Membership</a>
        <a href="Contact/index.html">Contact</a>
        <a href="about us/index.html">About</a>
        <a href="viewcart.jsp"><i class="fa fa-shopping-cart"></i></a>
  </div>
  <br>
  <h1>Shopping Cart</h1>
    <%
    try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql ="select * from cart";
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
    %>
    <div class="column">
        <div class="card">
          <img src="view.jsp?id=<%=resultSet.getString(1)%>" style="width:100%">
          <div class="container">
            <p>&#8377 <%=resultSet.getString(2)%></p>
            <p><a href="delete.jsp?id=<%=resultSet.getString(1)%>">
              <button class="button"><b>REMOVE<b></button>
            </a></p>
          </div>
        </div>
    </div>
    
<%
}
sql = "select sum(amount) from cart";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
  %>
  <br>
  <div class="pay">
  <p>
    <button class="btn"><b>TOTAL: <%=resultSet.getString(1)%></b></button>
  </p>
  <p>
    <button class="btn"><b>PAY</button></b></button>
  </p>
  </div>
  <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<br>
<hr>
      <section class="footer">
          <h3>
              About us
          </h3>
          <p>
            Hello, gorgeous! Welcome to PIXIE BEAUTY Cosmetics.<br> 
            A brand of choice for the women of today! And we're here to ensure you have a lot of fun with our makeup.<br> 
            We believe in every interpretation of beauty. Bold to subdued, quirky to crazy, everyday to glam goddess!<br>Our aim is to celebrate every aspect of you, no matter what your style is. 
            So, go ahead and pick your faves.<br>
            It's time to Rule the world, one look at a time!
          </p>
          <div class="icons">
              <i class="fa fa-facebook"></i>
              <i class="fa fa-twitter"></i>
              <i class="fa fa-instagram"></i>
              <i class="fa fa-pinterest"></i> <i class="fa fa-youtube"></i>
          </div>
          <hr>
          <p>Copyright © 2022 PIXIE BEAUTY | All rights reserved </p>
      </section>
</body>
</html>
