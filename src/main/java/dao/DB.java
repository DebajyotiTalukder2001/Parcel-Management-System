package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

    // Method to get a connection to the database
    public static Connection getConnection() throws SQLException, ClassNotFoundException{
        // Database URL, username, and password
    	
    	final String url = "jdbc:derby:C:\\Users\\debaj\\MyDB;create=true";
        
        
        Connection conn = null;
        
        try {
            // Load the Derby JDBC driver (ensure it's in your classpath)
        	// final String DRIVER = "org.apache.derby.jdbc.EmbeddedDriver";
          Class.forName("org.apache.derby.jdbc.EmbeddedDriver");

            // Establish the connection
            conn = DriverManager.getConnection(url);
            
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found.", e);
        }

        return conn;
    }

    // Main method for testing the connection (optional)
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        try {
            Connection conn = getConnection();
            if (conn != null) {
                System.out.println("Connection to the database successful!");
                conn.close();
            }
        } catch (SQLException e) {
            System.err.println("Connection failed: " + e.getMessage());
        }
    }
}




