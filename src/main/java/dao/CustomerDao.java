package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.sql.SQLException;
import java.sql.*;

class CustomerDao {

    public boolean insertCustomerBean(CustomerBean CustomerBean) {

        String sql = "INSERT INTO customers (CustomerName, email, countryCode, mobileNumber, address, userID, password, preferences) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DB.getConnection();

             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, CustomerBean.getCustomerName());

            stmt.setString(2, CustomerBean.getEmail());

            stmt.setString(3, CustomerBean.getCountryCode());

            stmt.setString(4, CustomerBean.getMobileNumber());

            stmt.setString(5, CustomerBean.getAddress());

            stmt.setString(6, CustomerBean.getUserID());

            stmt.setString(7, CustomerBean.getPassword());

            stmt.setString(8, CustomerBean.getPreferences());

            return stmt.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {

            e.printStackTrace();

            return false;

        }

    }

    public List<CustomerBean> getAllCustomerBeans() {

        ArrayList<CustomerBean> CustomerBeans = new ArrayList<>();

        String sql = "SELECT * FROM customers";

        try (Connection conn = DB.getConnection();

             Statement stmt = conn.createStatement();

             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {

                CustomerBeans.add(new CustomerBean(

                        rs.getInt("CustomerBeanID"),

                        rs.getString("CustomerBeanName"),

                        rs.getString("email"),

                        rs.getString("countryCode"),

                        rs.getString("mobileNumber"),

                        rs.getString("address"),

                        rs.getString("userID"),

                        rs.getString("password"),

                        rs.getString("preferences")

                ));

            }

        } catch (SQLException | ClassNotFoundException e) {

            e.printStackTrace();

        }

        return CustomerBeans;

    }

    public CustomerBean getCustomerBeanByUserID(String userID) {

        String sql = "SELECT * FROM customers WHERE userID = ?";

        try (Connection conn = DB.getConnection();

             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userID);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                return new CustomerBean(

                        rs.getInt("CustomerBeanID"),

                        rs.getString("CustomerBeanName"),

                        rs.getString("email"),

                        rs.getString("countryCode"),

                        rs.getString("mobileNumber"),

                        rs.getString("address"),

                        rs.getString("userID"),

                        rs.getString("password"),

                        rs.getString("preferences")

                );

            }

        } catch (SQLException | ClassNotFoundException e) {

            e.printStackTrace();

        }

        return null;

    }

    public boolean updateCustomerBeanPreferences(int CustomerBeanID, String preferences) {

        String sql = "UPDATE customers SET preferences = ? WHERE userID = ?";

        try (Connection conn = DB.getConnection();

             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, preferences);

            stmt.setInt(2, CustomerBeanID);

            return stmt.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {

            e.printStackTrace();

            return false;

        }

    }

    public boolean deleteCustomerBean(int CustomerBeanID) {

        String sql = "DELETE FROM customers WHERE userID = ?";

        try (Connection conn = DB.getConnection();

             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, CustomerBeanID);

            return stmt.executeUpdate() > 0;

        } catch (SQLException | ClassNotFoundException e) {

            e.printStackTrace();

            return false;

        }

    }

}

