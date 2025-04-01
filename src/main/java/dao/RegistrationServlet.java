package dao;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String customerName = request.getParameter("customerName");

        String email = request.getParameter("email");

        String countryCode = request.getParameter("countryCode");

        String mobileNumber = request.getParameter("mobileNumber");

        String address = request.getParameter("address");

        String userID = request.getParameter("userID");

        String password = request.getParameter("password");

        String preferences = request.getParameter("preferences");

        CustomerDao dao = new CustomerDao();

        CustomerBean newCustomer = new CustomerBean(0, customerName, email, countryCode, mobileNumber, address, userID, password, preferences);

        if (dao.insertCustomerBean(newCustomer)) {

            response.sendRedirect("Assets/Success.jsp");

        } else {

            response.sendRedirect("Assets/Error.html");

        }

    }

}




// RegistrationServlet.java (Without DAO)

//import java.io.*;
//import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.sql.*;
//
//@WebServlet("/RegistrationServlet")
//public class RegistrationServlet extends HttpServlet {
//
//    /**
//	 * 
//	 */
//	private static final long serialVersionUID = 1L;
//
//	// Handles POST requests (form submissions)
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Retrieve form data
//        String customerName = request.getParameter("customerName");
//        String email = request.getParameter("email");
//        String countryCode = request.getParameter("countryCode");
//        String mobileNumber = request.getParameter("mobileNumber");
//        String address = request.getParameter("address");
//        String userID = request.getParameter("userID");
//        String password = request.getParameter("password");
//        String preferences = request.getParameter("preferences");
//
//        // Database connection
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        
//        try {
//            // Use the DB class to get the connection
//          
//				conn = DB.getConnection();
//
//				
//
//				
//				
//            // SQL Insert Query
//            String query = "INSERT INTO customers (customerName, email, countryCode, mobileNumber, address, userID, password, preferences) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//            stmt = conn.prepareStatement(query);
//            
//            // Set parameters for PreparedStatement
//            stmt.setString(1, customerName);
//            stmt.setString(2, email);
//            stmt.setString(3, countryCode);
//            stmt.setString(4, mobileNumber);
//            stmt.setString(5, address);
//            stmt.setString(6, userID);
//            stmt.setString(7, password); 
//            stmt.setString(8, preferences);
//
//            // Execute the query
//            int result = stmt.executeUpdate();
//
//            // Redirect to a success or error page based on result
//            if (result > 0) {
//                response.sendRedirect("Assets/Success.jsp"); // Redirect to a success page
//
//            } else {
//                response.sendRedirect("Assets/Error.html"); // Redirect to an error page
//            }
//
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//            response.sendRedirect("Assets/Error.html"); // Redirect to error page on failure
//        } finally {
//            try {
//                if (stmt != null) stmt.close();
//                if (conn != null) conn.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//}