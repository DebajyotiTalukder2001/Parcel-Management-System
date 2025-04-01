


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Officer Home Page</title>

<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">


<div class="top-bar">



<nav>

<ul>
<li><a href="#" id="home-link">Home</a></li>
<li><a href="../Tracking/TrackingOfficer.html" id="tracking-link" target="_blank">Tracking</a></li>
<li><a href="../DeliveryUpdate/DU.html" id="delivery-status-link" target="_blank">Delivery Status</a></li>
<li><a href="../PickUp/PS.html" id="pickup-scheduling-link" target="_blank">Pickup Scheduling</a></li>
<li><a href="../BookingHistory/BookingHistoryOfficer.jsp" id="previous-booking-link" target="_blank">Previous Booking</a></li>
<li><a href="../LoginOfficer/LGO.html" id="logout-link">Logout</a></li>




</ul>




</nav>




<%

String username2 = (String) session.getAttribute("OfficerName");

if(username2 != null){




%>





<div class ="welcome-message">


Welcome, <span id="username"><%= username2 %>!</span>


<%

}
%>

</div>


</div>


<div class = "main-content">

<h1> Welcome to your DashBoard</h1>

<p> Explore our services, track delivery status, schedule pickup, and track your previous bookings.</p>

</div>


</div>


<!-- JS -->

<script src="script.js"></script>

</body>
</html>
