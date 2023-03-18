package com.qpark.dao;
import com.qpark.model.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleDAO {
    private final Connection connection;

    public VehicleDAO(Connection connection) {
        this.connection = connection;
    }

    public void create(Vehicle vehicle) throws SQLException {
        String sql = "INSERT INTO drivers (id, brand, image, color, plate,type,driver_id) VALUES (?, ?, ?, ?, ?, ?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, driver.getId());
        statement.setString(2, driver.getBrand());
        statement.setString(3, driver.getImage());
        statement.setString(4, driver.getColor());
        statement.setString(5, driver.getPlate());
        statement.setString(6, driver.getType());
       statement.setString(7, driver.getDriver_id());
        statement.executeUpdate();
        statement.close();
    }

    public void update(Vehicle vehicle) throws SQLException {
        String sql = "UPDATE vehicles SET id = ?, brand = ?, image = ?, color = ?, plate = ?, type = ?, driver_id = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, driver.getId());
        statement.setString(2, driver.getBrand());
        statement.setString(3, driver.getImage());
        statement.setString(4, driver.getColor());
        statement.setString(5, driver.getPlate());
        statement.setString(6, driver.getType());
       statement.setString(7, driver.getDriver_id());
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
        Driver driver = null;
        if (resultSet.next()) {
            vehicle = new Vehicle(
                    resultSet.getInt("id"),
                    resultSet.getString("brand"),
                    resultSet.getString("image"),
                    resultSet.getString("color"),
                    resultSet.getString("plate"),
                    resultSet.getString("type"),
                    resultSet.getString("driver_id")
            );
        }
        resultSet.close();
        statement.close();
        return vehicle;
    }

    public List<Driver> findAll() throws SQLException {
        String sql = "SELECT * FROM drivers";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<Driver> drivers = new ArrayList<>();
        while (resultSet.next()) {
           vehicle = new Vehicle(
                    resultSet.getInt("id"),
                    resultSet.getString("brand"),
                    resultSet.getString("image"),
                    resultSet.getString("color"),
                    resultSet.getString("plate"),
                    resultSet.getString("type"),
                    resultSet.getString("driver_id")
            );
            vehicles.add(vehicle);
        }
        resultSet.close();
        statement.close();
        return vehicles;
    }
}
