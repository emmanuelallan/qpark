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

    public Driver create(Driver driver) throws SQLException {
        String sql = "INSERT INTO drivers (name, avatar, email, phone, driving_licence, otp) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, driver.getName());
        statement.setString(2, driver.getAvatar());
        statement.setString(3, driver.getEmail());
        statement.setString(4, driver.getPhone());
        statement.setString(5, driver.getDrivingLicence());
        statement.setString(6, driver.getOtp());

        Driver newDriver = null;
        if (statement.executeUpdate() > 0) {
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                newDriver = new Driver(resultSet.getInt(1), driver.getName(), driver.getAvatar(), driver.getEmail(), driver.getPhone(), driver.getDrivingLicence(), driver.getOtp());
            }
        }
        statement.close();
        return newDriver;
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

    public Driver findByLicence(String licence) throws SQLException {
        String sql = "SELECT * FROM drivers WHERE driving_licence = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, licence);
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

