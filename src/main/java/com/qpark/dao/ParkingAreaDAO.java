package com.qpark.dao;
import com.qpark.model.ParkingArea;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ParkingAreaDAO {
    private final Connection connection;

    public ParkingAreaDAO(Connection connection) {
        this.connection = connection;
    }

    public void create(ParkingArea parkingArea) throws SQLException {
        String query = "INSERT INTO parking_areas (capacity, image, location, price, name, status, fine, opening_time, closing_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, parkingArea.getCapacity());
        statement.setString(2, parkingArea.getImage());
        statement.setString(3, parkingArea.getLocation());
        statement.setBigDecimal(4, parkingArea.getPrice());
        statement.setString(5, parkingArea.getName());
        statement.setString(6, parkingArea.getStatus());
        statement.setBigDecimal(7, parkingArea.getFine());
        statement.setTime(8, parkingArea.getOpeningTime());
        statement.setTime(9, parkingArea.getClosingTime());
        statement.executeUpdate();
        statement.close();
    }

    public void update(ParkingArea parkingArea) throws SQLException {
        String query = "UPDATE parking_areas SET capacity = ?, image = ?, location = ?, price = ?, name = ?, status = ?, fine = ?, opening_time = ?, closing_time = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, parkingArea.getCapacity());
        statement.setString(2, parkingArea.getImage());
        statement.setString(3, parkingArea.getLocation());
        statement.setBigDecimal(4, parkingArea.getPrice());
        statement.setString(5, parkingArea.getName());
        statement.setString(6, parkingArea.getStatus());
        statement.setBigDecimal(7, parkingArea.getFine());
        statement.setTime(8, parkingArea.getOpeningTime());
        statement.setTime(9, parkingArea.getClosingTime());
        statement.setInt(10, parkingArea.getId());
        statement.executeUpdate();
        statement.close();
    }

    public void delete(int id) throws SQLException {
        String query = "DELETE FROM parking_areas WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, id);
        statement.executeUpdate();
        statement.close();
    }

    public ParkingArea findById(int id) throws SQLException {
        String query = "SELECT * FROM parking_areas WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        ParkingArea parkingArea = null;
        if (resultSet.next()) {
            parkingArea = new ParkingArea(
                    resultSet.getInt("id"),
                    resultSet.getInt("capacity"),
                    resultSet.getString("image"),
                    resultSet.getString("location"),
                    resultSet.getBigDecimal("price"),
                    resultSet.getString("name"),
                    resultSet.getString("status"),
                    resultSet.getBigDecimal("fine"),
                    resultSet.getTime("opening_time"),
                    resultSet.getTime("closing_time")
            );
        }
        resultSet.close();
        statement.close();
        return parkingArea;
    }

    public List<ParkingArea> findAll() throws SQLException {
        String query = "SELECT * FROM parking_areas";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        List<ParkingArea> parkingAreas = new ArrayList<>();
        while (resultSet.next()) {
            ParkingArea parkingArea = new ParkingArea(
                    resultSet.getInt("id"),
                    resultSet.getInt("capacity"),
                    resultSet.getString("image"),
                    resultSet.getString("location"),
                    resultSet.getBigDecimal("price"),
                    resultSet.getString("name"),
                    resultSet.getString("status"),
                    resultSet.getBigDecimal("fine"),
                    resultSet.getTime("opening_time"),
                    resultSet.getTime("closing_time")
            );
            parkingAreas.add(parkingArea);
        }
        resultSet.close();
        statement.close();
        return parkingAreas;
    }

    // get parking areas count
    public int getParkingAreaCount() throws SQLException {
        String query = "SELECT COUNT(*) FROM parking_areas";
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
}