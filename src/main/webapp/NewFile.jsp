<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>

<html>
<head>
    <title>Display Data from Database</title>
</head>
<body>
    <h1>Employee Information</h1>
    
        <% 
            try { String n="ayush yadav";
            	 Class.forName("com.mysql.cj.jdbc.Driver");
            	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush?useSSL=false","root","admin");
            			
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM binfo where name='"+n+"';");
                
                // Retrieve and display data
                while(rs.next()) {
                	  String name = rs.getString("name");
                   
                    int ph = rs.getInt("number");
                    String email = rs.getString("email");
                    
                    String group = rs.getString("bgroup");
                    String loc = rs.getString("location");
                    
                    int count = rs.getInt("count");
                    String bid = rs.getString("bid");
        %>
        
            <h1><%= bid %></h1>
            <h2><%= name %></h2>
            <h2><%= email %></h2>
             <h2><%= ph %></h2>
            <h2><%= loc %></h2>

        <% 
                }
                // Close database connection
                con.close();
            } catch(Exception e) {
                System.out.println("Exception: " + e);
            }
        %>
 
</body>
</html>
    