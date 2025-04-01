
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.DB" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<%
    // Check if the form has been submitted
    String uid = request.getParameter("uname");
    String pwd = request.getParameter("pwd");

    if (uid != null && pwd != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Create a connection to the database
            conn = DB.getConnection(); // Assuming you have a DB class for DB connection.
            String query = "SELECT * FROM officers WHERE userID = ? AND password = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, uid);
            ps.setString(2, pwd);
            rs = ps.executeQuery();

            if (rs.next()) {
                // User found, create a session and set session attributes
                HttpSession sessn = request.getSession();
                sessn.setAttribute("uid", uid);  // Store user ID in session
                sessn.setAttribute("OfficerName", rs.getString("officerName"));  // Store name if needed
%>


<script type="text/javascript">
    alert('Login Successful');
    window.location.href = "../Home/HMO.jsp";
</script>

<%



            } else {
                // Invalid credentials
%> 
<script type="text/javascript">
    alert('Invalid credentials. Please try again.');
    window.location.href = "LGO.html"; // Redirect back to login page
</script>
<%
            }
        } catch (SQLException e) {
            e.printStackTrace();
%> 
<script type="text/javascript">
    alert('Error in login. Please try again later.');
    window.location.href = "LGO.html"; // Redirect to login page on error
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
    }
%>

