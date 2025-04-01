
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<%
    // Get form data
    String username = (String) session.getAttribute("customerName");
    String receiverName = request.getParameter("receiver-name");
    String receiverAddress = request.getParameter("receiver-address");
    String receiverPin = request.getParameter("receiver-pin");
    String receiverContact = request.getParameter("receiver-contact");
    String parcelSize = request.getParameter("parcel-size");
    String parcelWeight = request.getParameter("parcel-weight");
    String parcelContents = request.getParameter("parcel-contents");
    String deliverySpeed = request.getParameter("delivery-speed");
    String packaging = request.getParameter("packaging");
    String pickupTime = request.getParameter("pickup-time");
    String dropoffTime = request.getParameter("dropoff-time");
    String serviceCost = request.getParameter("service-cost");
    String paymentMethod = request.getParameter("payment-method");
    String insurance = request.getParameter("insurance");
    String tracking = request.getParameter("tracking");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // Create a connection to the database
        conn = DB.getConnection(); // Assuming you have a DB class for DB connection.

        // Insert query
        String insertQuery = "INSERT INTO tbl_BookingData (" +
                             "User_Name, Rec_Name, Rec_Address, Rec_Pin, Rec_Mobile, " +
                             "Par_Size, Par_Weight_Gram, Par_Content_Description, Par_Delivery_Type, " +
                             "Par_Picking_Preference, Par_Pickup_Time, Par_Dropof_Time, Par_Service_COST, " +
                             "Par_PaymentTime, Par_Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        ps = conn.prepareStatement(insertQuery);
        ps.setString(1, username);
        ps.setString(2, receiverName);
        ps.setString(3, receiverAddress);
        ps.setString(4, receiverPin);
        ps.setString(5, receiverContact);
        ps.setString(6, parcelSize);
        ps.setString(7, parcelWeight);
        ps.setString(8, parcelContents);
        ps.setString(9, deliverySpeed);
        ps.setString(10, packaging);
        ps.setString(11, pickupTime);
        ps.setString(12, dropoffTime);
        ps.setString(13, serviceCost);
        ps.setTimestamp(14, new Timestamp(System.currentTimeMillis())); // Current time for payment time
        ps.setString(15, "Pending"); // Status can be "Pending" or other as per business logic

        ps.executeUpdate();

        // Redirect to confirmation page or success message
        response.sendRedirect("../Payment/PB.jsp");
        return;

    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Clean up database resources
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>