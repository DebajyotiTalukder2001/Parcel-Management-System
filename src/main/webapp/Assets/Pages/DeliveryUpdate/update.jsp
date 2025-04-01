<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Status</title>
<link rel="stylesheet" href="track.css">
</head>
<body>

<%
    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
   
    String bookingId = request.getParameter("booking-id");
    String status = request.getParameter("status");

    try {
        // Create a connection to the database
        conn = DB.getConnection(); // Assuming you have a DB class for DB connection.

        // Query to check if the Booking_ID exists
        String checkQuery = "SELECT Booking_ID FROM tbl_BookingData WHERE Booking_ID = ?";
        ps = conn.prepareStatement(checkQuery);
        ps.setString(1, bookingId);
        rs = ps.executeQuery();

        if (rs.next()) {
            // If Booking_ID exists, proceed with the update
            String updateQuery = "UPDATE tbl_BookingData SET Par_Status = ? WHERE Booking_ID = ?";
            ps = conn.prepareStatement(updateQuery);
            ps.setString(1, status);
            ps.setString(2, bookingId);

            ps.executeUpdate();

            // Notify the user of success
            %>
            <script>
                alert("Data Updated Successfully!");
                window.location.href="DU.html";
            </script>
            <%
        } else {
            // If Booking_ID does not exist, notify the user
            %>
            <script>
                alert("Booking ID does not exist!");
                window.location.href="DU.html"; 
            </script>
            <%
        }

    } catch (SQLException e) {
        e.printStackTrace();
        %>
        <script>
            alert("An error occurred while updating");
            window.location.href="DU.html"; 
        </script>
        <%
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

</body>
</html>
