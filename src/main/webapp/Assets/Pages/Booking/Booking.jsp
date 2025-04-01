<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<%
    // Retrieve user ID from session
   String username = (String) session.getAttribute("customerName");

    if (username == null) {
        // If user is not logged in, redirect to login page
        response.sendRedirect("../Login/Login.html");
        return;
    }

    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String customerName = "";
    String customerAddress = "";
    String customerContact = "";

    // Default service cost
    //double serviceCost = 0.0;

    try {
        // Create a connection to the database
        conn = DB.getConnection(); // Assuming you have a DB class for DB connection.

        // Query to fetch sender information from officers table based on userID
        String query = "SELECT customerName, address, mobileNumber FROM customers WHERE customerName = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        rs = ps.executeQuery();

        if (rs.next()) {
            // Populate officer's data
            customerName = rs.getString("customerName");
            customerAddress = rs.getString("address");
            customerContact = rs.getString("mobileNumber");
        } else {
            // If no data found, redirect or handle the error
            response.sendRedirect("../Login/Login.html");
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

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Customer Booking Page</title>
    <link rel="stylesheet" href="style.css">
    <script>
    // Function to calculate the service cost based on input values
    
    	function handleSubmit(event) {
    		
			
        // Get the values of the input fields
        var weight = parseFloat(document.getElementById("parcel-weight").value);
        var shippingSpeed = document.getElementById("delivery-speed").value;
        var packaging = document.getElementById("packaging").value;

        // Base cost factors for calculations
        var baseCost = 5; // Base cost in dollars
        var weightFactor = 1.5; // Cost per kg
        var speedFactor = 0; 
        var packagingFactor = 0;

        // Calculate additional cost based on shipping speed
        if (shippingSpeed === "express") {
            speedFactor = 10; // Express shipping adds $10
        } else {
            speedFactor = 5; // Standard shipping adds $5
        }

        // Calculate packaging cost
        if (packaging === "custom") {
            packagingFactor = 15; // Custom packaging adds $15
        } else if (packaging === "eco-friendly") {
            packagingFactor = 8; // Eco-friendly packaging adds $8
        } else if (packaging === "fragile") {
            packagingFactor = 20; // Fragile packaging adds $20
        }

        // Calculate the total cost
        var totalCost = baseCost + (weight * weightFactor) + speedFactor + packagingFactor;

        // Update the service cost field with the calculated value
        document.getElementById("service-cost").value = totalCost.toFixed(2);
       //console.log(totalCost )
    
		
		if(totalCost>0.0){
			alert('Booking Successfull!\nBill Amount: Rs. ' + totalCost);
			
		}else{
			event.preventDefault();
			return false;
		}
    
    } 
   

  
</script>
</head>
<body>

<div class="container">
    <form id="booking-form" method="post" action="action.jsp" onsubmit="handleSubmit(event);">
        <h1>Customer Booking Service</h1>

        <fieldset>
            <legend>Sender Information</legend>
            <label for="sender-name">Name:</label>
            <input type="text" id="sender-name" name="sender-name" value="<%= customerName %>" readonly>

            <label for="sender-address">Address:</label>
            <input type="text" id="sender-address" name="sender-address" value="<%= customerAddress %>" readonly>

            <label for="sender-contact">Contact Details:</label>
            <input type="text" id="sender-contact" name="sender-contact" value="<%= customerContact %>" readonly>
        </fieldset>

        <fieldset>
            <legend>Receiver Information</legend>
            <label for="receiver-name">Name:</label>
            <input type="text" id="receiver-name" name="receiver-name" required>

            <label for="receiver-address">Address:</label>
            <input type="text" id="receiver-address" name="receiver-address" required>

            <label for="receiver-pin">Pin Code:</label>
            <input type="text" id="receiver-pin" name="receiver-pin" required pattern="\d{6}" title="Pin code must be 6 digits.">

            <label for="receiver-contact">Contact Details:</label>
            <input type="text" id="receiver-contact" name="receiver-contact" required pattern="^\+91\d{10}$" title="Enter 10 digits Contact No. with Country Code">
        </fieldset>

        <fieldset>
            <legend>Parcel Details</legend>
            <label for="parcel-size">Size:</label>
            <input type="text" id="parcel-size" name="parcel-size" required>
            <label for="parcel-weight">Weight (In gm):</label>
            <input type="text" id="parcel-weight" name="parcel-weight" required>

            <label for="parcel-contents">Parcel Contents:</label>
            <textarea id="parcel-contents" name="parcel-contents" required></textarea>
        </fieldset>

        <fieldset>
            <legend>Shipping Options</legend>
            <label for="delivery-speed">Choose Delivery Speed:</label>
            <select id="delivery-speed" name="delivery-speed" >
                <option value="standard">Standard</option>
                <option value="express">Express</option>
            </select>

            <label for="packaging">Select Packaging Preferences:</label>
            <select id="packaging" name="packaging" >
                <option value="standard">Standard Packaging</option>
                <option value="custom">Custom Packaging</option>
                <option value="eco-friendly">Eco-friendly Packaging</option>
                <option value="fragile">Fragile Item Handling</option>
            </select>
        </fieldset>

        <fieldset>
            <legend>Date and Time Selection</legend>
            <label for="pickup-time">Preferred Pickup Time:</label>
            <input type="datetime-local" id="pickup-time" name="pickup-time" required>
            <label for="dropoff-time">Preferred Pickup Time:</label>
            <input type="datetime-local" id="dropoff-time" name="dropoff-time" required>
        </fieldset>

        <fieldset>
            <legend>Service Cost and Payments</legend>
            <label for="service-cost">Service Cost:</label>
           
            <input type="text" id="service-cost" name="service-cost" value="Fetching..." readonly>
            
            
            
            <label for="payment-method">Payment Method:</label>
            
            
            
            <select id="payment-method" name="payment-method" required>
                <option value="credit-card">Credit Card</option>
                <option value="paypal">PayPal</option>
                <option value="bank-transfer">Bank Transfer</option>
            </select>
        </fieldset>

        <fieldset>
            <legend>Additional Services</legend>
            <label for="insurance">Insurance Options:</label>
            <select id="insurance" name="insurance">
                <option value="none">No insurance</option>
                <option value="basic">Basic Insurance</option>
                <option value="premium">Premium Insurance</option>
            </select>

            <label for="tracking">Tracking Services:</label>
            <input type="checkbox" id="tracking" name="tracking"> Enable Tracking
        </fieldset>

        <button type="submit">Book Service</button>
    </form>
</div>

</body>
</html>
