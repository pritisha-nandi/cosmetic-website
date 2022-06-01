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
String id = request.getParameter("id");
int i=0;
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
    .cart{
        padding-left: 300px;
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
      </div>
<%
try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    String sql ="delete from cart where id = '"+id+"'";
    PreparedStatement pst=connection.prepareStatement(sql);
    i=pst.executeUpdate();
    if(i!=0){ 
        %>
            <font color='green'><h1>Item Successfully Remove From The Cart</h1></font>
        <%
        }else{
            %>
                <font color='red'><h1> Failed due to error</h1></font>
            <% 
        }         
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<br><br>
<div class="cart"><a href="index2.html">
    <button class="btn"><b>Continue Shopping<b></button>
  </a>
</div>
  <div class="cart">
  <a href="viewcart.jsp">
    <button class="btn"><b>View Cart<b></button>
  </a></div>
  <br><br>
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