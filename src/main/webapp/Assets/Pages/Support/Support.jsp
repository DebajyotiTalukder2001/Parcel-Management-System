<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Support</title>

<link rel="stylesheet" href="style.css">

</head>
<body>
<header>

<%

String username = (String) session.getAttribute("customerName");

if(username != null){




%>



<div>Welcome, <span id="username"><%= username %>!</span></div>


<%

}
%>


<button class="logout-button" onclick="logout()">Logout</button>


</header>

<main>
<div class="contact-info">

<h2>Contact Details</h2>
<p><strong>Mail ID:</strong> XYZ@gmail.com</p> 
<p><strong>Address:</strong> Mumbai, India</p>
<p><strong>Contact Number:</strong> +911234567890</p>
</div>




</main>


<script>
function logout() {
    alert('Logout Successfull!');
    window.location.href = '../Login/Login.html';
}
</script>
</body>
</html>

