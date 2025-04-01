
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Home Page</title>

<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">


<div class="top-bar">




<nav>

<ul>
<li><a href="#" id="home-link">Home</a></li>
<li><a href="../Booking/Booking.jsp" id="booking-link" target="_blank">Booking Services</a></li>
<li><a href="../Tracking/Tracking.html" id="tracking-link" target="_blank">Tracking</a></li>
<li><a href="../BookingHistory/BookingHistory.jsp" id="previous-booking-link" target="_blank">Previous Booking</a></li>
<li><a href="../Support/Support.jsp" id="#" target="_blank">Contact Support</a></li>
<li><a href="../Login/Login.html" id="logout-link">Logout</a></li>




</ul>




</nav>

<%

String username = (String) session.getAttribute("customerName");

if(username != null){




%>

<div class ="welcome-message">


Welcome, <span id="username"><%= username %>!</span>

<%

}
%>





</div>


</div>


<div class = "main-content">

<h1> Welcome to your DashBoard</h1>


<p> Explore our services and make a booking, track your previous bookings, or get support.</p>
</div>


</div>


<!-- JS -->

<script src="script.js"></script>

</body>
</html>
