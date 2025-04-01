
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="dao.DB" %>  
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tracking</title>
    <link rel="stylesheet" href="track.css">
</head>
<body>





<%
    

    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
   
    String bookingId = request.getParameter("bookingId");
    String customerId = request.getParameter("customerId");
 
 String Rec_Name = "";
 String Rec_Address = "";
 String Par_Service_COST = "";
 String Par_Status = "";
 
    try {
        // Create a connection to the database
        conn = DB.getConnection(); // Assuming you have a DB class for DB connection.

        // Query to fetch sender information from officers table based on userID
        String query = "SELECT Booking_ID, User_Name, Rec_Name, Rec_Address, Par_Service_COST, Par_Status FROM tbl_BookingData WHERE User_Name = ? AND Booking_ID = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, customerId);		
        ps.setString(2, bookingId);
        
        //ps.setString(1, username);
        rs = ps.executeQuery();

        if (rs.next()) {
            // Populate officer's data
          
          Rec_Name = rs.getString("Rec_Name");
      	  Rec_Address = rs.getString("Rec_Address");
      	  Par_Service_COST = rs.getString("Par_Service_COST");
      	  Par_Status = rs.getString("Par_Status");
      	  
      	  //System.out.println(Rec_Name);
            
        } else {
        	
        	
 %>
        	
       <script>
            alert("An error occurred while fetching your details.");
            window.location.href = "TrackingOfficer.html"; 
        </script>
        
        
<% 
            // If no data found, redirect or handle the error
            
        }
    }
        
     catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Clean up database resources
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

 <h2>Shipped Packages</h2>
 
 
 
 <!-- Table to Display Search Results -->
    <h3>Package Status</h3>
    <table>
       
            <tr>
                <th>Booking ID</th>
                <th>Customer ID</th>
                <th>Receiver Name</th>
                <th>Receiver Address</th>
                <th>Service Cost</th>
                <th>Status</th>
            </tr>
            
        
            <tr>
                <td>BK<%= bookingId %></td>
                <td><%= customerId %></td>
                <td><%= Rec_Name %></td>
                <td><%= Rec_Address %></td>
                <td><%= Par_Service_COST %></td>
                <td><%= Par_Status %></td>
                
        
            
              </tr>
            
            
     
        
        
    </table>

</body>
</html>


