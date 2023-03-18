package com.qpark.dao;
import com.qpark.model.Vehicle;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleDAO {
    private final Connection connection;

    public VehicleDAO(Connection connection) {
        this.connection = connection;
    }

    public void create(Vehicle vehicle) throws SQLException {
        String sql = "INSERT INTO vehicles (brand, image, color, plate, type, driver_id) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, vehicle.getBrand());
        statement.setString(2, vehicle.getImage());
        statement.setString(3, vehicle.getColor());
        statement.setString(4, vehicle.getPlate());
        statement.setString(5, vehicle.getType());
       statement.setInt(6, vehicle.getDriverId());
        statement.executeUpdate();
        statement.close();
    }

    public void update(Vehicle vehicle) throws SQLException {
        String sql = "UPDATE vehicles SET brand = ?, image = ?, color = ?, plate = ?, type = ?, driver_id = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, vehicle.getBrand());
        statement.setString(2, vehicle.getImage());
        statement.setString(3, vehicle.getColor());
        statement.setString(4, vehicle.getPlate());
        statement.setString(5, vehicle.getType());
       statement.setInt(6, vehicle.getDriverId());
        statement.setInt(7, vehicle.getId());
        statement.executeUpdate();
        statement.close();
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM vehicles WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();
        statement.close();
    }

    public Vehicle findById(int id) throws SQLException {
        String sql = "SELECT * FROM vehicles WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        Vehicle vehicle = null;
        if (resultSet.next()) {
            vehicle = new Vehicle(
                    resultSet.getInt("id"),
                    resultSet.getString("brand"),
                    resultSet.getString("image"),
                    resultSet.getString("color"),
                    resultSet.getString("plate"),
                    resultSet.getString("type"),
                    resultSet.getInt("driver_id")
            );
        }
        resultSet.close();
        statement.close();
        return vehicle;
    }

    public List<Vehicle> findAll() throws SQLException {
        String sql = "SELECT * FROM vehicles";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<Vehicle> vehicles = new ArrayList<>();
        while (resultSet.next()) {
           Vehicle vehicle = new Vehicle(
                    resultSet.getInt("id"),
                    resultSet.getString("brand"),
                    resultSet.getString("image"),
                    resultSet.getString("color"),
                    resultSet.getString("plate"),
                    resultSet.getString("type"),
                    resultSet.getInt("driver_id")
            );
            vehicles.add(vehicle);
        }
        resultSet.close();
        statement.close();
        return vehicles;
    }
}
