package com.qpark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.qpark.DatabaseConnection;
import com.qpark.model.DashboardStats;

public class AdminDAO {
	private final Connection connection;
	public AdminDAO() throws SQLException, ClassNotFoundException {
		connection = DatabaseConnection.getConnection();
	}
	
	public boolean checkAdminCredentials(String email, String password) throws SQLException {
        String sql = "SELECT * FROM admins WHERE email = ? AND password = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        return rs.next();
    }
	
	public DashboardStats getDashboardStats() throws SQLException {
        // prepare SQL statements to fetch statistics
        String bookingsSql = "SELECT COUNT(*) AS num_bookings, SUM(amount) AS total_amount FROM bookings";
        String driversSql = "SELECT COUNT(*) AS num_drivers FROM drivers";
        String parkingAreasSql = "SELECT COUNT(*) AS num_parking_areas FROM parking_areas";

        // execute queries and retrieve results
        PreparedStatement bookingsStatement = connection.prepareStatement(bookingsSql);
        ResultSet bookingsResult = bookingsStatement.executeQuery();
        bookingsResult.next();

        PreparedStatement driversStatement = connection.prepareStatement(driversSql);
        ResultSet driversResult = driversStatement.executeQuery();
        driversResult.next();

        PreparedStatement parkingAreasStatement = connection.prepareStatement(parkingAreasSql);
        ResultSet parkingAreasResult = parkingAreasStatement.executeQuery();
        parkingAreasResult.next();

        // create DashboardStats object with fetched statistics
        int numBookings = bookingsResult.getInt("num_bookings");
        double totalAmount = bookingsResult.getDouble("total_amount");
        int numDrivers = driversResult.getInt("num_drivers");
        int numParkingAreas = parkingAreasResult.getInt("num_parking_areas");

        DashboardStats stats = new DashboardStats(numBookings, totalAmount, numDrivers, numParkingAreas);
        return stats;
    }

}
