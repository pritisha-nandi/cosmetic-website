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
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
String id = request.getParameter("id");
try{
    con = DriverManager.getConnection(connectionUrl+database, userid, password);
    stmt = con.createStatement();
    String sql = "select * from items where id = '"+id+"'";
    rs = stmt.executeQuery(sql);
    if (rs.next()) {
        image = rs.getBlob(5);
        imgData = image.getBytes(1,(int)image.length());
        } 
        else {
        out.println("Display Blob Example");
        out.println("image not found for given id>");
        return;
        }
        // display the image
        response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
            out.println("Unable To Display image");
            out.println("Image Display Error=" + e.getMessage());
            return;
        } finally {
        
        try {
        rs.close();
        stmt.close();
        
        } catch (SQLException e) {
        
        e.printStackTrace();
        
        }
    
    }
    
    %>