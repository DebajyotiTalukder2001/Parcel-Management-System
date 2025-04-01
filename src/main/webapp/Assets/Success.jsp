
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
    <title>Registration Successful</title>
    <style>
        /* Add CSS code for styling */
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #4CAF50;
        }

        /* Popup Styles */
        .popup {
            display: none;
            position: fixed;
            top: -100px;
            left: 50%;
            transform: translateX(-50%);
            width: 350px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            z-index: 1000;
            opacity: 0;
            animation: fadeIn 1s forwards;
        }
        .popup h3 {
            color: #4CAF50;
        }
        .popup button {
            margin-top: 15px;
            padding: 8px 15px;
            border: none;
            background: #4CAF50;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .popup button:hover {
            background: #45a049;
        }
        
        @keyframes fadeIn {
            0% {
                opacity: 0;
                top: -100px;
            }
            100% {
                opacity: 1;
                top: 20px;
            }
        }
    </style>

    <script>
        function showPopup(id, name, email) {
            let popup = document.getElementById("popup");
            let popupContent = document.getElementById("popupContent");
            //console.log(id);
            //console.log(name);
           // console.log(email);
            if (id && name && email) {
            	//console.log(id);
            	//console.log(name);
            	//console.log(email);
                popupContent.innerHTML = "<h3>Registration Successful!</h3>" + 
                    "<p><strong>Customer ID:</strong> " + id + "</p>" + 
                    "<p><strong>Customer Name:</strong> " + name + "</p>" + 
                    "<p><strong>Customer Email:</strong> " + email + "</p>";
            } else {
                alert("Registration Successful! No details found.");
            }
            popup.style.display = "block";
      
        }

        function closePopup() {
            document.getElementById("popup").style.display = "none";
            window.location.href = "Pages/Login/Login.html"; // Redirect to login page
        }
    </script>
</head>

<body>
    <div class="container">
        <h2>Registration Successful</h2>
        <p>Fetching your details...</p>
    </div>

    <!-- Popup Box -->
    <div id="popup" class="popup">
        <div id="popupContent"></div>
        <button onclick="closePopup()">OK</button>
    </div>

    <%
    // Database connection
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        // Get connection using the DB class
        conn = DB.getConnection();
        // Query to fetch the latest registered customer
        String sql = "SELECT customerID, customername, email FROM customers ORDER BY customerID DESC FETCH FIRST ROW ONLY";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        if (rs.next()) {
            int id = rs.getInt("customerID");
            String name = rs.getString("customername");
            String email = rs.getString("email");
           // System.out.println(id);
           // System.out.println(name);
           // System.out.println(email);
    %>
            <script>
                // Pass the data to JavaScript for popup
              
                showPopup(<%= id %>, "<%= name %>", "<%= email %>");
            </script>
    <%
        } else {
    %>
            <script>
                // If no data found, show a fallback message
                showPopup(null, null, null);
            </script>
    <%
        }
    } catch (Exception e) {
    %>
        <script>
            alert("An error occurred while fetching your details.");
            window.location.href = "Error.html"; 
        </script>
    <%
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
    %>
</body>
</html>
