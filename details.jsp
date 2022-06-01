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
    <!-- <link rel="stylesheet" href="style.css"> -->
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <style>
        .left-column{
            display: inline-block;
            padding-left: 270px;  
            padding-top: 30px; 
        }
        .right-column{
            display: inline-block;
            padding-bottom: 30px; 
            padding-left: 150px; 
        }
        .btn{
            border: none;
            outline: 0;
            display: inline-block;
            padding: 15px;
            color: white;
            background-color: #000;
            text-align: center;
            cursor: pointer;
            width: 80%;
            border-radius: 12px;
            display: inline-block;
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
    <%
    try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql = "select * from items where id = '"+id+"'";
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
    %>
    <!-- <div class="column">
        <div class="card">
          <img src="view.jsp?id=<%=resultSet.getString(1)%>" style="width:100%">
          <div class="container">
            <h2><%=resultSet.getString(2)%></h2>
            <p>&#8377 <%=resultSet.getString(3)%></p>
            <p><b><%=resultSet.getString(4)%></b></p>
            <p><button class="button"><b>ADD TO CART</b></button></p>
          </div>
        </div>
    </div> -->
    <div class="card" style="background-color: rgb(235, 201, 201)">
    <div class ="left-column" >
        <br>
        <img src="view.jsp?id=<%=resultSet.getString(1)%>" style="width:80%">
    </div>
    <div class="right-column"> 
        <div class = "details">
          <h2 class = "product-brand"><%=resultSet.getString(2)%></h2>
          <br>
          <p>&#8377 <%=resultSet.getString(3)%></p>
          <p><b>PRODUCT DEATIL</b><br><%=resultSet.getString(4)%></p><br><br><br>
          <p><button class="btn"><b>ADD TO WISHLIST</b></button></p>
          <p><button class="btn"><b>ADD TO CART</b></button></p>
        </div>
    </div>
    <p>
        <hr>
        <b>Shades:</b>

        <br>01 Gold Diggin (Warm Gold With Pearl Tint)
        <br>02 Pink Trippin (Cool Pink With Pearl Tint)
        <br><b>Benefits:</b>
        <ul>
        <li>A unique sunscreen with the benefits of an illuminating moisturizer
        <li>Powered by SPF35 with a PA+++ rating, this sunscreen offers protection against harmful UVA and UVB rays
        <li>Lightweight formula absorbs quickly into the skin and does not leave behind any white cast or greasiness
        <li>Its nourishing texture leaves a pretty sheen and makes skin look healthy and radiant
        <li>Oil-free, non-comedogenic formula does not clog pores
        <li>Enriched with natural ingredients like shea butter, pomegranate, papaya and citrus limon fruit juice to brighten, diminish dullness and smoothen skin texture
        <li>Infused with sodium hyaluronate to boost skin elasticity, restore moisture and keep skin plump, supple, and smooth
        <li>Suitable for all skin types
        <li>100% vegan and cruelty-free; Free from parabens, sulphate and alcohol
        </ul>
        <br>Net Weight: 50gms
        <br>
        <br>Country of Origin: India
        <br>Company Name: SUGAR Cosmetics LLC
        <br>Company Address: Vellvette Lifestyle Pvt. Ltd., B-1004, Palatial Heights, Andheri (E), Mumbai 400072
        <br><hr><br>
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