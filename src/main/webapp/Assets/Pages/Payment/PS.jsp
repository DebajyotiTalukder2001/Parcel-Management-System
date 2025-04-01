

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
    <title>Payment Page</title>

    <link rel="stylesheet" href="style.css">

</head>






<body>

<%

String username = (String) session.getAttribute("customerName");

if(username != null){




%>






    <div class="payment-container">

        <h2>Payment Page</h2>

        <div class="header">

            <span>Welcome, <span id="username"><%= username %>!</span></span>
            <button onclick="logout()">Logout</button>



        </div>
<%

}
%>


<%
    

    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String BookingId = "";
  

    try {
        // Create a connection to the database
        conn = DB.getConnection(); // Assuming you have a DB class for DB connection.

        // Query to fetch sender information from officers table based on userID
        String query = "SELECT Booking_ID FROM tbl_BookingData WHERE User_Name = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        //ps.setString(1, username);
        rs = ps.executeQuery();

        if (rs.next()) {
            // Populate officer's data
          BookingId  = rs.getString("Booking_ID");
            
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

        <div id="paymentSuccess" class="payment-success">

            <h2>Payment Successful!</h2>

            <p>Your Booking ID: <span id="bookingId">BK<%= BookingId %></span></p>

            <button onclick="fwd()">Go to Invoice</button>
            <button onclick="return_home()">Back to Home</button>

        </div>
</div>


        <script>


            function fwd() {
                window.open("../Invoice/Invoice.jsp", "_blank");
            }

            function logout() {
                alert('Logout Successfull!');
                window.location.href = '../Login/Login.html';
            }

            function return_home(){
            window.location.href = '../Home/Home.jsp';
        }

        </script>






</body>

</html>

