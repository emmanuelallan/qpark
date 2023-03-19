package com.qpark.dao;

import com.qpark.model.Booking;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    private final Connection connection;

    public BookingDAO(Connection connection) {
        this.connection = connection;
    }
    
    public void create(Booking booking) throws SQLException {
        String sql = "INSERT INTO bookings (parking_slot_id, vehicle_id, current_driver_id, amount, check_in, check_out, delay, fine, status, payment_status, booking_duration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, booking.getParkingSlotId());
        statement.setInt(2, booking.getVehicleId());
        statement.setInt(3, booking.getCurrentDriverId());
        statement.setBigDecimal(4, booking.getAmount());
        statement.setTime(5, booking.getCheckIn());
        statement.setTime(6, booking.getCheckOut());
        statement.setTime(7, booking.getDelay());
        statement.setBigDecimal(8, booking.getFine());
        statement.setString(9, booking.getStatus());
        statement.setString(10, booking.getPaymentStatus());
        statement.setTime(11, booking.getBookingDuration());
        statement.executeUpdate();
        statement.close();
    }
    
    public void updateStatus(int id, String status) throws SQLException {
        String sql = "UPDATE bookings SET status = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, status);
        statement.setInt(2, id);
        statement.executeUpdate();
        statement.close();
    }

    public int getBookingCount() throws SQLException {
        String query = "SELECT COUNT(*) FROM bookings";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        int count = 0;
        if (resultSet.next()) {
            count = resultSet.getInt(1);
        }
        resultSet.close();
        statement.close();
        return count;
    }
    
    public BigDecimal getTotalAmount() throws SQLException {
        String sql = "SELECT SUM(amount) FROM bookings";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        BigDecimal totalAmount = BigDecimal.ZERO;
        if (resultSet.next()) {
            totalAmount = resultSet.getBigDecimal(1);
        }
        resultSet.close();
        statement.close();
        return totalAmount;
    }

    public List<Booking> findAll() throws SQLException {
        String sql = "SELECT * FROM bookings";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<Booking> bookings = new ArrayList<>();
        while (resultSet.next()){
            Booking booking = new Booking(
                    resultSet.getInt("id"),
                    resultSet.getInt("parking_slot_id"),
                    resultSet.getInt("vehicle_id"),
                    resultSet.getInt("current_driver_id"),
                    resultSet.getBigDecimal("amount"),
                    resultSet.getTime("check_in"),
                    resultSet.getTime("check_out"),
                    resultSet.getTime("delay"),
                    resultSet.getBigDecimal("fine"),
                    resultSet.getString("status"),
                    resultSet.getString("payment_status"),
                    resultSet.getTime("booking_duration")
            );
            bookings.add(booking);
        }
        resultSet.close();
        statement.close();
        return bookings;
    }

    // find the latest bookings and limit to 5
    public List<Booking> getLatestBookings() throws SQLException {
        String sql = "SELECT * FROM bookings ORDER BY id DESC LIMIT 5";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<Booking> bookings = new ArrayList<>();
        while (resultSet.next()){
            Booking booking = new Booking(
                    resultSet.getInt("id"),
                    resultSet.getInt("parking_slot_id"),
                    resultSet.getInt("vehicle_id"),
                    resultSet.getInt("current_driver_id"),
                    resultSet.getBigDecimal("amount"),
                    resultSet.getTime("check_in"),
                    resultSet.getTime("check_out"),
                    resultSet.getTime("delay"),
                    resultSet.getBigDecimal("fine"),
                    resultSet.getString("status"),
                    resultSet.getString("payment_status"),
                    resultSet.getTime("booking_duration")
            );
            bookings.add(booking);
        }
        resultSet.close();
        statement.close();
        return bookings;
    }
}
