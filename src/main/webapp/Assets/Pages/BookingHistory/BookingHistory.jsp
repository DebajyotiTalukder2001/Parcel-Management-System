
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
    <title>Booking History - Customer</title>

    <link rel="stylesheet" href="style.css">

</head>

<body>
<%

String username = (String) session.getAttribute("customerName");



%>
<div class="header">
        <div class="user-info">
            <span>Welcome, <strong id="username"> <%= username %>!</strong></span>
            <p><a href="../Login/Login.html" onclick="">Logout</a></p>
        </div>
    </div>
    
    <div class="booking-history">
    <h3>Booking History</h3>
 <table>
            <thead>
                <tr>
                <th>Booking ID</th>
                <th>Customer ID</th>           
                <th>Receiver Name</th>
                <th>Receiver Address</th>
                <th>Service Cost</th>
                <th>Status</th>
                </tr>

            </thead>


<%
    

    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
   
    //String bookingId = request.getParameter("bookingId");
    //String customerId = request.getParameter("customerId");
 
 String Rec_Name = "";
 String Rec_Address = "";
 String Par_Service_COST = "";
 String Par_Status = "";
 
    try {
        // Create a connection to the database
        conn = DB.getConnection(); // Assuming you have a DB class for DB connection.

        // Query to fetch sender information from officers table based on userID
        String query = "SELECT Booking_ID, User_Name, Rec_Name, Rec_Address, Par_Service_COST, Par_Status FROM tbl_BookingData WHERE User_Name = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, username);		
     
        
        //ps.setString(1, username);
        rs = ps.executeQuery();

        while (rs.next()) {
            // Populate officer's data
 %>   
 
        <tr>
                <th>BK<%= rs.getString("Booking_ID") %></th>
                <th><%= rs.getString("User_Name") %></th>
                <th><%= rs.getString("Rec_Name") %></th>
                <th><%= rs.getString("Rec_Address") %></th>
                <th><%= rs.getString("Par_Service_COST") %></th>
                <th><%= rs.getString("Par_Status") %></th>
       </tr>
 
 
 
        
         
<%       	  
      	  //System.out.println(Rec_Name);
            
        } 
        	
        	
 %>
        	
       
        
        
<% 
            // If no data found, redirect or handle the error
            
        
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
    

    
        


       

            


            </tbody>






        </table>



        <div class="pagination">
            <button onclick="">Previous</button>
            <button onclick="">Next</button>


        </div>


    </div>






    <script src="script.js"></script>
</body>

</html>
