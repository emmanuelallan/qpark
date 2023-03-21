package com.qpark.dao;
import com.qpark.model.Driver;
import com.qpark.model.Vehicle;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DriverDAO {
    private final Connection connection;

    public DriverDAO(Connection connection) {
        this.connection = connection;
    }

    public void create(Driver driver) throws SQLException {
        String sql = "INSERT INTO drivers (name, avatar, email, phone, driving_licence, otp) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, driver.getName());
        statement.setString(2, driver.getAvatar());
        statement.setString(3, driver.getEmail());
        statement.setString(4, driver.getPhone());
        statement.setString(5, driver.getDrivingLicence());
        statement.setString(6, driver.getOtp());
        statement.executeUpdate();
        statement.close();
    }

    public void update(Driver driver) throws SQLException {
        String sql = "UPDATE drivers SET name = ?, avatar = ?, email = ?, phone = ?, driving_licence = ?, otp = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, driver.getName());
        statement.setString(2, driver.getAvatar());
        statement.setString(3, driver.getEmail());
        statement.setString(4, driver.getPhone());
        statement.setString(5, driver.getDrivingLicence());
        statement.setString(6, driver.getOtp());
        statement.setInt(7, driver.getId());
        statement.executeUpdate();
        statement.close();
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM drivers WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();
        statement.close();
    }

    public Driver findById(int id) throws SQLException {
        String sql = "SELECT * FROM drivers WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        Driver driver = null;
        if (resultSet.next()) {
            driver = new Driver(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("avatar"),
                    resultSet.getString("email"),
                    resultSet.getString("phone"),
                    resultSet.getString("driving_licence"),
                    resultSet.getString("otp")
            );
        }
        resultSet.close();
        statement.close();
        return driver;
    }

    public List<Driver> findAll() throws SQLException {
        String sql = "SELECT * FROM drivers";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<Driver> drivers = new ArrayList<>();
        while (resultSet.next()) {
            Driver driver = new Driver(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("avatar"),
                    resultSet.getString("email"),
                    resultSet.getString("phone"),
                    resultSet.getString("driving_licence"),
                    resultSet.getString("otp")
            );
            drivers.add(driver);
        }
        resultSet.close();
        statement.close();
        return drivers;
    }

    public Driver findByLicence(String drivingLicence) throws SQLException {
        String query = "SELECT d.id, d.name, d.avatar, d.email, d.phone, d.driving_licence, d.otp, v.id AS vehicle_id, v.brand, v.image, v.color, v.plate, v.type "
                + "FROM drivers d "
                + "JOIN vehicles v ON d.id = v.driver_id "
                + "WHERE d.driving_licence = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, drivingLicence);
        ResultSet resultSet = statement.executeQuery();

        Driver driver = null;
        Map<Integer, List<Vehicle>> vehiclesByDriverId = new HashMap<>();
        while (resultSet.next()) {
            if (driver == null) {
                driver = new Driver(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("avatar"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("driving_licence"),
                        resultSet.getString("otp")
                );
            }
            int vehicleId = resultSet.getInt("vehicle_id");
            String brand = resultSet.getString("brand");
            String image = resultSet.getString("image");
            String color = resultSet.getString("color");
            String plate = resultSet.getString("plate");
            String type = resultSet.getString("type");
            Vehicle vehicle = new Vehicle(vehicleId, brand, image, color, plate, type, driver.getId());
            int driverId = resultSet.getInt("id");
            List<Vehicle> vehiclesForDriver = vehiclesByDriverId.getOrDefault(driverId, new ArrayList<>());
            vehiclesForDriver.add(vehicle);
            vehiclesByDriverId.put(driverId, vehiclesForDriver);
        }
        resultSet.close();
        statement.close();

        if (driver != null) {
            driver.setVehicles(vehiclesByDriverId.get(driver.getId()));
        }

        return driver;
    }

    // get driver count
    public int getDriverCount() throws SQLException {
        String sql = "SELECT COUNT(*) FROM drivers";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        int count = 0;
        if (resultSet.next()) {
            count = resultSet.getInt(1);
        }
        resultSet.close();
        statement.close();
        return count;
    }
}

