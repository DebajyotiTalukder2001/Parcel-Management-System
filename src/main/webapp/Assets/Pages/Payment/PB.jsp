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
            <button id="logoutBtn" onclick="logout()">Logout</button>



        </div>


<%

}
%>

<%
    

    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String serviceCost = "";
  

    try {
        // Create a connection to the database
        conn = DB.getConnection(); // Assuming you have a DB class for DB connection.

        // Query to fetch sender information from officers table based on userID
        String query = "SELECT Par_Service_COST FROM tbl_BookingData WHERE User_Name = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        rs = ps.executeQuery();

        if (rs.next()) {
            // Populate officer's data
           serviceCost = rs.getString("Par_Service_COST");
            
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

        <div class="payment-details" id="payment-details">

            <p>Bill Amount: <span id="billAmount">Rs. <%= serviceCost %></span></p>


            <label for="paymentMode">Mode of Payment:</label>

            <select id="paymentMode">
                <option value="debit">Debit</option>
                <option value="credit">Credit</option>

            </select>
            <button onclick="show()">Pay Now</button>

            <button onclick="return_home()">Back to Home</button>
        </div>

    </div>






    <div id="CardDetailsScreen" class="card-details">
        <form method="post" onsubmit="handleSubmit(event);">

            <h2>Debit/Credit Card Payment</h2>


            <label for="cardNo">Card No:</label>


            <input type="text" id="cardNo" maxlength="16" placeholder="Enter 16 digits" required>



            <label for="cardholderName">Card Holder Name:</label>


            <input type="text" id="cardHolderName" placeholder="Enter Name" required>



            <label for="expiryDate">Expiry Date (MM/YY):</label>


            <input type="text" id="expiryDate" placeholder="MM/YY" required>




            <label for="cvv">CVV:</label>


            <input type="text" id="cvv" placeholder="Enter 3 digits" required pattern="\d{3}" title="CVV must be 3 digits.">

            <button type="submit">Make Payment</button>
        </form>

    </div>





    <script>


        function show() {

            document.getElementById('CardDetailsScreen').style.display = "block";
            document.getElementById('payment-details').style.display = "none";
        }

        function logout() {
            alert('Logout Successfull!');
            window.location.href = '../Login/Login.html';
        }

        function handleSubmit(event) {
            event.preventDefault();
            alert('Payment Successfull');
            window.location.href = 'PS.jsp';
        }

        function return_home(){
            window.location.href = '../Home/Home.jsp';
        }


    </script>






</body>

</html>

