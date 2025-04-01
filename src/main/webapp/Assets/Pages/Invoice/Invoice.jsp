	
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
<title>Invoice</title>

<link rel="stylesheet" href="style.css">

</head>
<body>

<%

String username = (String) session.getAttribute("customerName");

if(username != null){




%>


<div class="container">

  <div class="invoice-title">

     <h1>Parcel Invoice</h1>
   </div>





<%

}
%>


<%
    

    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    //String BookingId = "";
    String Rec_Name = "";
    String Rec_Address = "";
    String Rec_Pin = "";
    String Rec_Mobile = "";
    String Par_Size = "";
    String Par_Weight_Gram = "";
    String Par_Content_Description = "";
    String Par_Delivery_Type = "";
    String Par_Picking_Preference = "";
    String Par_Pickup_Time = "";
    String Par_Dropof_Time = "";  
    String Par_Service_COST = "";
    String Par_PaymentTime = "";
    String Par_Status = "";
   
    
    
  

    try {
        // Create a connection to the database
        conn = DB.getConnection(); // Assuming you have a DB class for DB connection.

        // Query to fetch sender information from officers table based on userID
        String query = "SELECT Booking_ID,  Rec_Name,  Rec_Address, Rec_Pin, Rec_Mobile,  Par_Size, " +
        		"Par_Weight_Gram,  Par_Content_Description,  Par_Delivery_Type, Par_Picking_Preference, Par_Pickup_Time, Par_Dropof_Time, " +
        		"Par_Service_COST, Par_PaymentTime, Par_Status FROM tbl_BookingData WHERE User_Name = ?";
        		
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        //ps.setString(1, username);
        rs = ps.executeQuery();

        if (rs.next()) {
            // Populate officer's data
         // BookingId  = "BK" + rs.getString("Booking_ID");
        	Rec_Name = rs.getString("Rec_Name");
        	Rec_Address = rs.getString("Rec_Address");
        	Rec_Pin = rs.getString("Rec_Pin");
        	Rec_Mobile = rs.getString("Rec_Mobile");
        	Par_Size = rs.getString("Par_Size");
        	Par_Weight_Gram = rs.getString("Par_Weight_Gram");
        	Par_Content_Description = rs.getString("Par_Content_Description");
        	Par_Delivery_Type = rs.getString("Par_Delivery_Type");
        	Par_Picking_Preference = rs.getString("Par_Picking_Preference");
        	Par_Pickup_Time = rs.getString("Par_Pickup_Time");
        	Par_Dropof_Time = rs.getString("Par_Dropof_Time");
        	Par_Service_COST = rs.getString("Par_Service_COST");
        	Par_PaymentTime = rs.getString("Par_PaymentTime");
        	Par_Status = rs.getString("Par_Status");
            
        } else {
            // If no data found, redirect or handle the error
            response.sendRedirect("#");
            return;
        }

        
    } catch (SQLException e) {
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

<div class="invoice-details">

<label for="receiver-name">Receiver Name:</label>
<div class ="info read-only" id="receiver-name"><%= Rec_Name %></div>

<label for="receiver-address">Receiver Address:</label>
<div class ="info read-only" id="receiver-address"><%= Rec_Address %></div>

<label for="receiver-pin">Receiver Pin:</label>
<div class ="info read-only" id="receiver-pin"><%= Rec_Pin %></div>


<label for="receiver-mobile">Receiver Mobile:</label>

<div class="info read-only" id="receiver-mobile"><%= Rec_Mobile %></div>


<label for="parcel-weight">Parcel Size:</label>

<div class="info read-only" id="parcel-size"><%= Par_Size %></div>


<label for="parcel-weight">Parcel Weight (g):</label>

<div class="info read-only" id="parcel-weight"><%= Par_Weight_Gram %></div>

<label for="parcel-weight">Parcel Contents Description:</label>

<div class="info read-only" id="parcel-contents"><%= Par_Content_Description %></div>

<label for="parcel-delivery-type">Parcel Weight (g):</label>

<div class="info read-only" id="parcel-delivery-type"><%= Par_Delivery_Type %></div>

<label for="parcel-packing">Parcel Packing Preference:</label>

<div class="info read-only" id="parcel-packing"><%= Par_Picking_Preference %></div>

<label for="parcel-pickup-time">Parcel Pickup Time:</label>

<div class="info read-only" id="parcel-pickup-time"><%= Par_Pickup_Time %></div>

<label for="parcel-dropoff-time">Parcel Dropoff Time:</label>

<div class="info read-only" id="parcel-dropoff-time"><%= Par_Dropof_Time %></div>

<label for="parcel-service-cost">Parcel Service Cost:</label>

<div class="info read-only" id="parcel-service-cost"><%= Par_Service_COST %></div>

<label for="parcel-payment-time">Parcel Payment Time:</label>

<div class="info read-only" id="parcel-payment-time"><%= Par_PaymentTime %></div>


</div>


<div class ="btn-container">

<button onclick="window.print()">Print Invoice</button>





</div>


</div>










</body>
</html>